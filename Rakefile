require "rake/testtask"
require "net/http"
require "uri"

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end

task default: :test

desc "Validate confusables mapping against latest Unicode confusables.txt"
task :validate_confusables do
  require_relative "lib/unicode_script_detector/confusables"

  puts "Fetching latest Unicode confusables..."
  uri = URI("https://unicode.org/Public/security/latest/confusables.txt")
  response = Net::HTTP.get_response(uri)

  unless response.is_a?(Net::HTTPSuccess)
    abort "Failed to fetch confusables.txt: #{response.code} #{response.message}"
  end

  # Scripts we track
  TRACKED_SCRIPTS = [
    (0x0400..0x04FF), (0x0500..0x052F), # Cyrillic
    (0x0370..0x03FF),                     # Greek
    (0x0530..0x058F),                     # Armenian
    (0x10A0..0x10FF), (0x2D00..0x2D2F),  # Georgian
    (0x0590..0x05FF),                     # Hebrew
    (0x1200..0x137F), (0x1380..0x139F),
    (0x2D80..0x2DDF), (0xAB00..0xAB2F),  # Ethiopic
  ].freeze

  def script_tracked?(cp)
    TRACKED_SCRIPTS.any? { |range| range.cover?(cp) }
  end

  # Build expected mappings from Unicode data (filtered to tracked scripts)
  expected = {}
  response.body.each_line do |line|
    next if line.start_with?("#") || line.strip.empty?

    parts = line.split(";").map(&:strip)
    next if parts.length < 3

    source_hex = parts[0]
    target_hex = parts[1]

    # Skip multi-codepoint sources
    next if source_hex.include?(" ")

    source = source_hex.to_i(16)

    # Only track scripts we care about
    next unless script_tracked?(source)

    source_char = [source].pack("U")

    # Parse target - only single-codepoint targets
    target_parts = target_hex.split
    next if target_parts.length != 1

    target = target_parts[0].to_i(16)
    target_char = [target].pack("U")

    # Only map to Latin letters (a-zA-Z) and digits
    next unless target_char.match?(/^[a-zA-Z0-9]$/)

    expected[source_char] = target_char
  end

  # Get current mappings
  current = UnicodeScriptDetector::Confusables::MAPPING.dup

  # Compare
  missing = expected.reject { |char, _| current.key?(char) }
  extra = current.reject { |char, _| expected.key?(char) }
  changed = current.select { |char, target| expected[char] && expected[char] != target }

  puts "\n=== Validation Results ==="
  puts "Unicode confusables total: #{expected.length}"
  puts "Current mappings total: #{current.length}"

  if missing.any?
    puts "\n❌ Missing from current mapping (#{missing.length}):"
    missing.sort_by { |char, _| char.ord }.each do |char, target|
      puts "  '#{char}' => '#{target}'  # U+%04X" % char.ord
    end
  else
    puts "\n✅ No missing mappings"
  end

  if extra.any?
    puts "\n⚠️  Extra in current mapping (#{extra.length}) — not in Unicode confusables:"
    extra.sort_by { |char, _| char.ord }.each do |char, target|
      puts "  '#{char}' => '#{target}'  # U+%04X" % char.ord
    end
  else
    puts "\n✅ No extra mappings"
  end

  if changed.any?
    puts "\n❌ Mismatched mappings (#{changed.length}):"
    changed.sort_by { |char, _| char.ord }.each do |char, current_target|
      expected_target = expected[char]
      puts "  '#{char}' => '#{current_target}' (expected '#{expected_target}')  # U+%04X" % char.ord
    end
  else
    puts "\n✅ No mismatched mappings"
  end

  if missing.empty? && extra.empty? && changed.empty?
    puts "\n🎉 All mappings match Unicode confusables!"
  else
    puts "\n💡 Run `rake update_confusables` to sync with Unicode"
    exit 1
  end
end

desc "Update confusables.rb from latest Unicode confusables.txt"
task :update_confusables do
  require "set"

  puts "Fetching latest Unicode confusables..."
  uri = URI("https://unicode.org/Public/security/latest/confusables.txt")
  response = Net::HTTP.get_response(uri)

  unless response.is_a?(Net::HTTPSuccess)
    abort "Failed to fetch confusables.txt: #{response.code} #{response.message}"
  end

  # Scripts we track
  TRACKED_SCRIPTS_UPDATE = [
    (0x0400..0x04FF), (0x0500..0x052F), # Cyrillic
    (0x0370..0x03FF),                     # Greek
    (0x0530..0x058F),                     # Armenian
    (0x10A0..0x10FF), (0x2D00..0x2D2F),  # Georgian
    (0x0590..0x05FF),                     # Hebrew
    (0x1200..0x137F), (0x1380..0x139F),
    (0x2D80..0x2DDF), (0xAB00..0xAB2F),  # Ethiopic
  ].freeze

  def script_tracked_update?(cp)
    TRACKED_SCRIPTS_UPDATE.any? { |range| range.cover?(cp) }
  end

  # Parse confusables
  mappings = {}
  response.body.each_line do |line|
    next if line.start_with?("#") || line.strip.empty?

    parts = line.split(";").map(&:strip)
    next if parts.length < 3

    source_hex = parts[0]
    target_hex = parts[1]

    next if source_hex.include?(" ")

    source = source_hex.to_i(16)

    # Only track scripts we care about
    next unless script_tracked_update?(source)

    source_char = [source].pack("U")

    target_parts = target_hex.split
    next if target_parts.length != 1

    target = target_parts[0].to_i(16)
    target_char = [target].pack("U")

    next unless target_char.match?(/^[a-zA-Z0-9]$/)

    mappings[source_char] = target_char
  end

  # Group by script
  def script_name(cp)
    case cp
    when 0x0400..0x04FF, 0x0500..0x052F then "Cyrillic"
    when 0x0370..0x03FF then "Greek"
    when 0x0530..0x058F then "Armenian"
    when 0x10A0..0x10FF, 0x2D00..0x2D2F then "Georgian"
    when 0x0590..0x05FF then "Hebrew"
    when 0x1200..0x137F, 0x1380..0x139F, 0x2D80..0x2DDF, 0xAB00..0xAB2F then "Ethiopic"
    else nil
    end
  end

  grouped = Hash.new { |h, k| h[k] = {} }
  mappings.each do |char, target|
    name = script_name(char.ord)
    next unless name
    grouped[name][char] = target
  end

  # Generate new file content
  lines = []
  lines << "require 'set'"
  lines << ""
  lines << "module UnicodeScriptDetector"
  lines << "  module Confusables"
  lines << "    # Curated mapping of characters that visually resemble Latin letters."
  lines << "    # AUTO-GENERATED from https://unicode.org/Public/security/latest/confusables.txt"
  lines << "    # Run `rake update_confusables` to regenerate."
  lines << "    MAPPING = {"

  ["Cyrillic", "Greek", "Armenian", "Georgian", "Hebrew", "Ethiopic"].each do |script|
    next unless grouped[script].any?
    lines << ""
    lines << "      # #{script} → Latin"
    grouped[script].sort_by { |char, _| char.ord }.each do |char, target|
      lines << "      '#{char}' => '#{target}',   # U+%04X" % char.ord
    end
  end

  lines << "    }.freeze"
  lines << ""
  lines << "    INVISIBLE_CHARACTERS = ["
  lines << '      "\\u200B", # Zero-width space'
  lines << '      "\\u200C", # Zero-width non-joiner'
  lines << '      "\\u200D", # Zero-width joiner'
  lines << '      "\\u200E", # Left-to-right mark'
  lines << '      "\\u200F", # Right-to-left mark'
  lines << '      "\\uFEFF", # Zero-width no-break space (BOM)'
  lines << '      "\\u2060", # Word joiner'
  lines << '      "\\u00AD", # Soft hyphen'
  lines << '      "\\u180E", # Mongolian vowel separator'
  lines << '      "\\u2061", # Function application'
  lines << '      "\\u2062", # Invisible times'
  lines << '      "\\u2063", # Invisible separator'
  lines << '      "\\u2064" # Invisible plus'
  lines << "    ].freeze"
  lines << ""
  lines << "    DIRECTIONAL_OVERRIDES = ["
  lines << '      "\\u202A", # Left-to-right embedding'
  lines << '      "\\u202B", # Right-to-left embedding'
  lines << '      "\\u202C", # Pop directional formatting'
  lines << '      "\\u202D", # Left-to-right override'
  lines << '      "\\u202E" # Right-to-left override'
  lines << "    ].freeze"
  lines << ""
  lines << "    SAFE_SCRIPT_COMBINATIONS = ["
  lines << "      Set[:Latin, :Han, :Hiragana, :Katakana],"
  lines << "      Set[:Latin, :Han, :Bopomofo],"
  lines << "      Set[:Latin, :Han, :Hangul],"
  lines << "      Set[:Hiragana, :Katakana, :Han],"
  lines << "      Set[:Latin, :Inherited],"
  lines << "      Set[:Latin, :Common],"
  lines << "      Set[:Latin, :Punctuation],"
  lines << "      Set[:Latin, :Digit],"
  lines << "      Set[:Latin, :Whitespace]"
  lines << "    ].freeze"
  lines << ""
  lines << "    def self.confusable?(char)"
  lines << "      MAPPING.key?(char)"
  lines << "    end"
  lines << ""
  lines << "    def self.looks_like(char)"
  lines << "      MAPPING[char]"
  lines << "    end"
  lines << ""
  lines << "    def self.invisible?(char)"
  lines << "      INVISIBLE_CHARACTERS.include?(char)"
  lines << "    end"
  lines << ""
  lines << "    def self.directional_override?(char)"
  lines << "      DIRECTIONAL_OVERRIDES.include?(char)"
  lines << "    end"
  lines << "  end"
  lines << "end"

  File.write("lib/unicode_script_detector/confusables.rb", lines.join("\n") + "\n")
  puts "✅ Updated lib/unicode_script_detector/confusables.rb with #{mappings.length} mappings"
end
