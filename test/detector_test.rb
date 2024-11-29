require "test_helper"

class UnicodeScriptDetector::DetectorTest < ActiveSupport::TestCase
  test "detect latin script" do
    UnicodeScriptDetector.detect("Hello").each do |character|
      assert_equal :Latin, character.script
    end
  end

  test "detect emoji script" do
    UnicodeScriptDetector.detect("🔥✅").each do |character|
      assert_equal :Emoji, character.script
    end
  end
end