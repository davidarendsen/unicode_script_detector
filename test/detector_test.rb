require "test_helper"

class UnicodeScriptDetector::DetectorTest < ActiveSupport::TestCase
  test "detect latin script characters" do
    UnicodeScriptDetector.detect_characters("Hello").each do |character|
      assert_equal :Latin, character.script
    end
  end

  test "detect emoji script characters" do
    UnicodeScriptDetector.detect_characters("🔥✅").each do |character|
      assert_equal :Emoji, character.script
    end
  end

  test "detect latin and emoji script characters, but group them" do
    script_groups = UnicodeScriptDetector.script_groups("test 🔥✅")

    # First group should be Latin for "test"
    assert_equal :Latin, script_groups[0].script
    assert_equal "test", script_groups[0].text
    assert_equal 4, script_groups[0].length

    # Second group should be Whitespace for " "
    assert_equal :Whitespace, script_groups[1].script
    assert_equal " ", script_groups[1].text
    assert_equal 1, script_groups[1].length

    # Third group should be Emoji for "🔥✅"
    assert_equal :Emoji, script_groups[2].script
    assert_equal "🔥✅", script_groups[2].text
    assert_equal 2, script_groups[2].length
  end

  test "detect script contains latin" do
    assert UnicodeScriptDetector.contains?("H🔥ll✅", :Latin)
  end

  test "detect script contains latin and emoji" do
    assert UnicodeScriptDetector.contains?("H🔥ll✅", [:Latin, :Emoji])
  end

  test "detect script contains latin and spaces" do
    assert UnicodeScriptDetector.contains?("H el lo 🔥", [:Latin, :Whitespace])
  end

  test "detect script contains latin, spaces, and digits" do
    assert UnicodeScriptDetector.contains?("H e3l lo 🔥", [:Latin, :Whitespace, :Digit])
  end

  test "detect script contains greek and coptic" do
    assert UnicodeScriptDetector.contains_only?("ͰϤβϫ", [:Greek, :Coptic])
  end

  test "detect script contains cyrillic" do
    assert UnicodeScriptDetector.contains_only?("Ѐб", :Cyrillic)
  end

  test "detect script contains cyrillic and greek" do
    assert UnicodeScriptDetector.contains_only?("Ѐбβ", [:Cyrillic, :Greek])
  end

  test "detect script doesn't contain only cyrillic and greek" do
    refute UnicodeScriptDetector.contains_only?("ЀбβH", [:Cyrillic, :Greek]) #It also contains :Latin
  end

  test "detect script contains armenian" do
    assert UnicodeScriptDetector.contains_only?("Բա", :Armenian)
  end

  test "detect script contains hebrew" do
    assert UnicodeScriptDetector.contains_only?("דװ", :Hebrew)
  end

  test "detect script contains arabic" do
    assert UnicodeScriptDetector.contains_only?("؈ئ", :Arabic)
  end

  test "detect script contains arabic and a whitespace" do
    assert UnicodeScriptDetector.contains_only?("؈ئ ", [:Arabic, :Whitespace])
  end

  test "detect script contains arabic, whitespace, and an emoji" do
    assert UnicodeScriptDetector.contains_only?("✅؈ئ ", [:Arabic, :Whitespace, :Emoji])
  end

  test "detect script contains syriac" do
    assert UnicodeScriptDetector.contains_only?("ܘܕ", :Syriac)
  end

  test "detect script contains thaana" do
    assert UnicodeScriptDetector.contains_only?("ޅޡ", :Thaana)
  end
end
