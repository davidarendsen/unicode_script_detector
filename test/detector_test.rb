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
    script_groups = UnicodeScriptDetector.script_groups("test 🔥✅ this test?")

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

    # Fourth group should be Whitespace for " "
    assert_equal :Whitespace, script_groups[3].script
    assert_equal " ", script_groups[3].text
    assert_equal 1, script_groups[3].length

    # Fifth group should be Latin for "this"
    assert_equal :Latin, script_groups[4].script
    assert_equal "this", script_groups[4].text
    assert_equal 4, script_groups[4].length

    # Sixth group should be Whitespace for " "
    assert_equal :Whitespace, script_groups[5].script
    assert_equal " ", script_groups[5].text
    assert_equal 1, script_groups[5].length

    # Seventh group should be Latin for "test"
    assert_equal :Latin, script_groups[6].script
    assert_equal "test", script_groups[6].text
    assert_equal 4, script_groups[6].length

    # Seventh group should be Punctuation for "?"
    assert_equal :Punctuation, script_groups[7].script
    assert_equal "?", script_groups[7].text
    assert_equal 1, script_groups[7].length
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

  # Asian Scripts
  test "detect script contains han (chinese)" do
    assert UnicodeScriptDetector.contains_only?("你好", :Han)
  end

  test "detect script contains hiragana" do
    assert UnicodeScriptDetector.contains_only?("ひらがな", :Hiragana)
  end

  test "detect script contains katakana" do
    assert UnicodeScriptDetector.contains_only?("カタカナ", :Katakana)
  end

  test "detect script contains hangul (korean)" do
    assert UnicodeScriptDetector.contains_only?("한글", :Hangul)
  end

  test "detect script contains thai" do
    assert UnicodeScriptDetector.contains_only?("ไทย", :Thai)
  end

  test "detect script contains devanagari (hindi)" do
    assert UnicodeScriptDetector.contains_only?("हिन्दी", :Devanagari)
  end

  test "detect mixed japanese scripts" do
    assert UnicodeScriptDetector.contains?("ひらカナ漢字", [:Hiragana, :Katakana, :Han])
  end

  # Other writing systems
  test "detect script contains georgian" do
    assert UnicodeScriptDetector.contains_only?("ქართული", :Georgian)
  end

  test "detect script contains runic" do
    assert UnicodeScriptDetector.contains_only?("ᚠᚢ", :Runic)
  end

  test "detect script contains braille" do
    assert UnicodeScriptDetector.contains_only?("⠓⠑⠇⠇⠕", :Braille)
  end

  # Indian scripts
  test "detect script contains bengali" do
    assert UnicodeScriptDetector.contains_only?("বাংলা", :Bengali)
  end

  test "detect script contains gujarati" do
    assert UnicodeScriptDetector.contains_only?("ગુજરાતી", :Gujarati)
  end

  test "detect script contains tamil" do
    assert UnicodeScriptDetector.contains_only?("தமிழ்", :Tamil)
  end

  test "detect script contains telugu" do
    assert UnicodeScriptDetector.contains_only?("తెలుగు", :Telugu)
  end

  test "detect script contains kannada" do
    assert UnicodeScriptDetector.contains_only?("ಕನ್ನಡ", :Kannada)
  end

  test "detect script contains malayalam" do
    assert UnicodeScriptDetector.contains_only?("മലയാളം", :Malayalam)
  end

  # Southeast Asian scripts
  test "detect script contains myanmar (burmese)" do
    assert UnicodeScriptDetector.contains_only?("မြန်မာ", :Myanmar)
  end

  test "detect script contains khmer (cambodian)" do
    assert UnicodeScriptDetector.contains_only?("ខ្មែរ", :Khmer)
  end

  test "detect script contains lao" do
    assert UnicodeScriptDetector.contains_only?("ລາວ", :Lao)
  end

  # Historical and specialized scripts
  test "detect script contains egyptian hieroglyphs" do
    assert UnicodeScriptDetector.contains_only?("𓈖𓏏𓂋", :Egyptian_Hieroglyphs)
  end

  test "detect script contains cuneiform" do
    assert UnicodeScriptDetector.contains_only?("𒀭𒈹", :Cuneiform)
  end

  test "detect script contains phoenician" do
    assert UnicodeScriptDetector.contains_only?("𐤄𐤈𐤀", :Phoenician)
  end

  test "detect script contains a new line" do
    assert UnicodeScriptDetector.contains_only? "this\ncontains a new line", [:New_Line, :Latin, :Whitespace]
  end

  test "detect script contains a tab" do
    assert UnicodeScriptDetector.contains_only? "this\tcontains a tab", [:Tab, :Latin, :Whitespace]
  end

  # Complex grouping tests with multiple scripts
  test "detect and group multilingual text" do
    script_groups = UnicodeScriptDetector.script_groups("Hello नमस्ते 你好\t🌍")

    assert_equal :Latin, script_groups[0].script
    assert_equal "Hello", script_groups[0].text

    assert_equal :Whitespace, script_groups[1].script
    assert_equal " ", script_groups[1].text

    assert_equal :Devanagari, script_groups[2].script
    assert_equal "नमस्ते", script_groups[2].text

    assert_equal :Whitespace, script_groups[3].script
    assert_equal " ", script_groups[3].text

    assert_equal :Han, script_groups[4].script
    assert_equal "你好", script_groups[4].text

    assert_equal :Tab, script_groups[5].script

    assert_equal :Emoji, script_groups[6].script
    assert_equal "🌍", script_groups[6].text
  end

  test "detect and group japanese mixed scripts" do
    script_groups = UnicodeScriptDetector.script_groups("こんにちはKonnichiwa今日")

    assert_equal :Hiragana, script_groups[0].script
    assert_equal "こんにちは", script_groups[0].text

    assert_equal :Latin, script_groups[1].script
    assert_equal "Konnichiwa", script_groups[1].text

    assert_equal :Han, script_groups[2].script
    assert_equal "今日", script_groups[2].text
  end

  test "detect and group arabic with numbers" do
    script_groups = UnicodeScriptDetector.script_groups("مرحبا123")

    assert_equal :Arabic, script_groups[0].script
    assert_equal "مرحبا", script_groups[0].text

    assert_equal :Digit, script_groups[1].script
    assert_equal "123", script_groups[1].text
  end

  # Edge cases
  test "detect mixed scripts contains all expected" do
    text = "Hello שלום مرحبا नमस्ते 你好 🎌"
    expected_scripts = [:Latin, :Whitespace, :Hebrew, :Arabic, :Devanagari, :Han, :Emoji]
    
    assert UnicodeScriptDetector.contains?(text, expected_scripts)
  end

  test "detect script contains punctuation only" do
    assert UnicodeScriptDetector.contains_only?("@#$%", :Punctuation)
  end

  test "detect inherited script characters" do
    text = "é".unicode_normalize(:nfd)  # Normalize to decomposed form
    assert UnicodeScriptDetector.contains?(text, [:Latin, :Inherited])
  end

  # Script_Extensions tests
  test "script_extensions for simple latin text" do
    groups = UnicodeScriptDetector.script_groups("hello")
    assert_equal [:Latin], groups.first.script_extensions
  end

  test "script_extensions for common punctuation with multiple extensions" do
    groups = UnicodeScriptDetector.script_groups("॥")
    assert_equal :Punctuation, groups.first.script
    assert groups.first.script_extensions.include?(:Devanagari)
    assert groups.first.script_extensions.include?(:Bengali)
    assert groups.first.script_extensions.length > 1
  end

  test "script_extensions for inherited combining character" do
    text = "é".unicode_normalize(:nfd)
    groups = UnicodeScriptDetector.script_groups(text)
    # The combining acute accent should have multiple script extensions
    accent_group = groups.find { |g| g.script == :Inherited }
    assert accent_group, "Expected an Inherited group"
    assert accent_group.script_extensions.length > 1
    assert accent_group.script_extensions.include?(:Latin)
  end

  test "script_extensions is empty array by default for backward compatibility" do
    group = UnicodeScriptDetector::ScriptGroup.new(:Latin, ["a"], "Latin")
    assert_equal [], group.script_extensions
  end

  test "script_extensions accessible on ScriptGroup" do
    groups = UnicodeScriptDetector.script_groups("abc")
    assert_respond_to groups.first, :script_extensions
  end
end
