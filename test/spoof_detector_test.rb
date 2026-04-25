require "test_helper"

class UnicodeScriptDetector::SpoofDetectorTest < ActiveSupport::TestCase
  test "detects no spoofing in pure latin text" do
    detector = UnicodeScriptDetector::SpoofDetector.new("Hello World")
    assert_not detector.spoofed?
    assert_empty detector.detections
  end

  test "detects cyrillic confusable characters" do
    detector = UnicodeScriptDetector::SpoofDetector.new("Раypal") # Р and а are Cyrillic
    assert detector.spoofed?

    confusables = detector.confusables
    assert_equal 1, confusables.size

    chars = confusables.first.characters
    assert chars.any? { |c| c.char == "Р" && c.looks_like == "P" }
    assert chars.any? { |c| c.char == "а" && c.looks_like == "a" }
  end

  test "detects greek confusable characters" do
    detector = UnicodeScriptDetector::SpoofDetector.new("gοοgle") # ο is Greek
    assert detector.spoofed?

    confusables = detector.confusables
    assert_equal 1, confusables.size
    assert_equal 2, confusables.first.characters.size
  end

  test "detects armenian confusable characters" do
    detector = UnicodeScriptDetector::SpoofDetector.new("զero") # զ is Armenian
    assert detector.spoofed?
    assert_equal "z", detector.confusables.first.characters.first.looks_like
  end

  test "detects georgian confusable characters" do
    detector = UnicodeScriptDetector::SpoofDetector.new("იcon") # ი is Georgian
    assert detector.spoofed?
    assert_equal "i", detector.confusables.first.characters.first.looks_like
  end

  test "detects hebrew confusable characters" do
    detector = UnicodeScriptDetector::SpoofDetector.new("סort") # ס is Hebrew
    assert detector.spoofed?
    assert_equal "o", detector.confusables.first.characters.first.looks_like
  end

  test "detects invisible characters" do
    text = "test\u200Bing" # Contains zero-width space
    detector = UnicodeScriptDetector::SpoofDetector.new(text)
    assert detector.spoofed?

    invisible = detector.invisible_characters
    assert_equal 1, invisible.size
    assert_equal 1, invisible.first.characters.size
    assert_equal "U+200B", invisible.first.characters.first.codepoint
  end

  test "detects soft hyphen" do
    text = "test\u00ADing"
    detector = UnicodeScriptDetector::SpoofDetector.new(text)
    assert detector.spoofed?
    assert_equal :invisible, detector.detections.first.type
  end

  test "detects directional overrides" do
    text = "test\u202Eing" # Right-to-left override
    detector = UnicodeScriptDetector::SpoofDetector.new(text)
    assert detector.spoofed?

    directional = detector.detections.select { |d| d.type == :directional_override }
    assert_equal 1, directional.size
  end

  test "detects mixed scripts as suspicious" do
    detector = UnicodeScriptDetector::SpoofDetector.new("Hello мир") # Latin + Cyrillic
    assert detector.spoofed?

    mixed = detector.mixed_scripts
    assert_equal 1, mixed.size
    assert_includes mixed.first.characters, "Cyrillic"
    assert_includes mixed.first.characters, "Latin"
  end

  test "allows safe japanese mixed scripts" do
    detector = UnicodeScriptDetector::SpoofDetector.new("こんにちはKonnichiwa")
    # Japanese (Hiragana) + Latin is a safe combination
    mixed = detector.mixed_scripts
    assert_empty mixed
  end

  test "allows safe chinese mixed scripts" do
    detector = UnicodeScriptDetector::SpoofDetector.new("Hello 你好")
    # Han + Latin is safe
    mixed = detector.mixed_scripts
    assert_empty mixed
  end

  test "allows safe korean mixed scripts" do
    detector = UnicodeScriptDetector::SpoofDetector.new("Hello 한글")
    # Hangul + Latin is safe
    mixed = detector.mixed_scripts
    assert_empty mixed
  end

  test "returns high severity for confusables" do
    detector = UnicodeScriptDetector::SpoofDetector.new("Раypal")
    assert_equal :high, detector.confusables.first.severity
  end

  test "returns high severity for invisible characters" do
    detector = UnicodeScriptDetector::SpoofDetector.new("test\u200Bing")
    assert_equal :high, detector.invisible_characters.first.severity
  end

  test "returns medium severity for mixed scripts" do
    detector = UnicodeScriptDetector::SpoofDetector.new("Hello мир")
    assert_equal :medium, detector.mixed_scripts.first.severity
  end

  test "detects multiple types of spoofing" do
    text = "Ра\u200Byрal" # Cyrillic + zero-width space
    detector = UnicodeScriptDetector::SpoofDetector.new(text)

    assert detector.spoofed?
    assert_equal 2, detector.detections.size
    assert detector.detections.any? { |d| d.type == :confusable }
    assert detector.detections.any? { |d| d.type == :invisible }
  end

  test "character positions are correct" do
    detector = UnicodeScriptDetector::SpoofDetector.new("aРb")
    confusables = detector.confusables.first.characters
    assert_equal 1, confusables.first.position
  end

  test "confusable includes script name" do
    detector = UnicodeScriptDetector::SpoofDetector.new("Раypal")
    char = detector.confusables.first.characters.first
    assert_equal "Cyrillic", char.script
  end

  test "handles empty string" do
    detector = UnicodeScriptDetector::SpoofDetector.new("")
    assert_not detector.spoofed?
    assert_empty detector.detections
  end

  test "handles string with only safe characters" do
    detector = UnicodeScriptDetector::SpoofDetector.new("Hello! How are you? 123")
    assert_not detector.spoofed?
  end

  test "module-level spoof_analysis helper" do
    detections = UnicodeScriptDetector.spoof_analysis("Раypal")
    assert_equal 1, detections.size
    assert_equal :confusable, detections.first.type
  end

  test "module-level spoofed? helper" do
    assert UnicodeScriptDetector.spoofed?("Раypal")
    assert_not UnicodeScriptDetector.spoofed?("paypal")
  end
end
