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

  test "detect script contains latin" do
    assert UnicodeScriptDetector.contains?("H🔥ll✅", :Latin)
  end
end