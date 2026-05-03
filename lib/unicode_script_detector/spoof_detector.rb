module UnicodeScriptDetector
  class SpoofDetector
    Detection = Struct.new(:type, :message, :characters, :severity, keyword_init: true)
    ConfusableChar = Struct.new(:char, :script, :looks_like, :position, keyword_init: true)
    InvisibleChar = Struct.new(:char, :codepoint, :name, :position, keyword_init: true)

    SEVERITY_HIGH = :high
    SEVERITY_MEDIUM = :medium
    SEVERITY_LOW = :low

    def initialize(string)
      @string = string.to_s
      @detections = nil
    end

    # Returns all spoof detections found in the string
    def detections
      @detections ||= [
        detect_confusables,
        detect_invisible_characters,
        detect_directional_overrides,
        detect_mixed_scripts
      ].compact
    end

    # Returns true if actual spoofing is detected (confusables, invisible
    # characters, or directional overrides). Mixed scripts alone are not
    # considered spoofing — they may just be multilingual text.
    def spoofed?
      detections.any? { |d| [:confusable, :invisible, :directional_override].include?(d.type) }
    end

    # Returns only confusable character detections
    def confusables
      detections.select { |d| d.type == :confusable }
    end

    # Returns only invisible character detections
    def invisible_characters
      detections.select { |d| d.type == :invisible }
    end

    # Returns only mixed script detections
    def mixed_scripts
      detections.select { |d| d.type == :mixed_scripts }
    end

    private

    attr_reader :string

    def detect_confusables
      found = []

      string.chars.each_with_index do |char, idx|
        if Confusables.confusable?(char)
          script = detect_script_for_char(char)
          found << ConfusableChar.new(
            char: char,
            script: script[:name],
            looks_like: Confusables.looks_like(char),
            position: idx
          )
        end
      end

      return nil if found.empty?

      Detection.new(
        type: :confusable,
        message: "Found #{found.length} character(s) from non-Latin scripts that visually resemble Latin letters",
        characters: found,
        severity: SEVERITY_HIGH
      )
    end

    def detect_invisible_characters
      found = []

      string.chars.each_with_index do |char, idx|
        if Confusables.invisible?(char)
          found << InvisibleChar.new(
            char: char,
            codepoint: format("U+%04X", char.ord),
            name: invisible_char_name(char),
            position: idx
          )
        end
      end

      return nil if found.empty?

      Detection.new(
        type: :invisible,
        message: "Found #{found.length} invisible character(s)",
        characters: found,
        severity: SEVERITY_HIGH
      )
    end

    def detect_directional_overrides
      found = []

      string.chars.each_with_index do |char, idx|
        if Confusables.directional_override?(char)
          found << InvisibleChar.new(
            char: char,
            codepoint: format("U+%04X", char.ord),
            name: "Bidirectional override",
            position: idx
          )
        end
      end

      return nil if found.empty?

      Detection.new(
        type: :directional_override,
        message: "Found #{found.length} bidirectional override character(s)",
        characters: found,
        severity: SEVERITY_HIGH
      )
    end

    def detect_mixed_scripts
      return nil unless Unicode::Scripts.mixed?(string)

      detector = Detector.new(string)
      scripts = detector.scripts.reject { |s| ignored_script?(s) }

      return nil if scripts.size <= 1

      script_set = scripts.to_set

      # Check if it's a known safe combination (backward compatibility)
      return nil if Confusables::SAFE_SCRIPT_COMBINATIONS.any? { |safe| script_set.subset?(safe) }

      Detection.new(
        type: :mixed_scripts,
        message: "Text contains a mix of #{scripts.size} scripts: #{scripts.map(&:to_s).join(", ")}",
        characters: scripts.map(&:to_s),
        severity: SEVERITY_MEDIUM
      )
    end

    def detect_script_for_char(char)
      script_name = Unicode::Scripts.scripts(char).first
      { script: script_name.to_sym, name: script_name }
    end

    def ignored_script?(script)
      %i[Common Inherited Whitespace Punctuation Digit New_Line Tab Emoji].include?(script)
    end

    def invisible_char_name(char)
      names = {
        "\u200B" => "Zero-width space",
        "\u200C" => "Zero-width non-joiner",
        "\u200D" => "Zero-width joiner",
        "\u200E" => "Left-to-right mark",
        "\u200F" => "Right-to-left mark",
        "\uFEFF" => "Zero-width no-break space",
        "\u2060" => "Word joiner",
        "\u00AD" => "Soft hyphen",
        "\u180E" => "Mongolian vowel separator",
        "\u2061" => "Function application",
        "\u2062" => "Invisible times",
        "\u2063" => "Invisible separator",
        "\u2064" => "Invisible plus",
      }
      names[char] || "Unknown invisible character"
    end
  end
end
