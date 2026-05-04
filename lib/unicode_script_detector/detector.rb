module UnicodeScriptDetector
  class Detector
    attr_reader :scripts

    def initialize(string)
      @string = string
      @char_scripts = []
      @script_names = []
      @script_extensions = []

      detect_scripts
    end

    def scripts
      @char_scripts.uniq
    end

    def contains?(scripts)
      return @char_scripts.include?(scripts) if scripts.is_a?(Symbol)
      scripts.all? { |script| @char_scripts.include?(script) }
    end

    def contains_only?(scripts)
      return @char_scripts.uniq == [scripts] if scripts.is_a?(Symbol)
      @char_scripts.uniq.sort == scripts.uniq.sort
    end

    def script_groups
      @string.chars
        .zip(@char_scripts, @script_names, @script_extensions)
        .chunk { |_, script, _, _| script }
        .map do |script, char_data|
          chars = char_data.map(&:first)
          name = char_data.first[2]
          extensions = char_data.map(&:last).flatten.uniq
          ScriptGroup.new(script, chars, name, extensions)
        end
    end

    def grouped_scripts_hash
      script_groups.map { |group| [group.script, group.text] }.to_h
    end

    def characters
      @characters ||= @string.chars.zip(@char_scripts, @script_names).map do |char, script, name|
        Character.new(char, script, name)
      end
    end

    private

      def detect_scripts
        @string.chars.each do |char|
          script_info = find_script_for_char(char)
          @char_scripts << script_info[:script]
          @script_names << script_info[:name]
          @script_extensions << script_info[:script_extensions]
        end
      end

      def find_script_for_char(char)
        # Check custom categories first (preserve backward compatibility)
        custom = custom_script_for_char(char)
        return custom if custom

        # Use unicode-scripts for standard Unicode script detection
        name = Unicode::Scripts.scripts(char).first
        extensions = Unicode::Scripts.script_extensions(char).map(&:to_sym)

        # For Common characters, apply fallback categories (Punctuation, etc.)
        if name == "Common"
          return fallback_common_script(char, extensions)
        end

        {
          script: name.to_sym,
          name: name,
          script_extensions: extensions.empty? ? [name.to_sym] : extensions
        }
      end

      def custom_script_for_char(char)
        # Check custom categories first (preserve backward compatibility)
        # These are categories that unicode-scripts returns as "Common"
        if char == "\t"
          { script: :Tab, name: "Tab", script_extensions: [:Tab] }
        elsif char == "\n" || char == "\r"
          { script: :New_Line, name: "New Line", script_extensions: [:New_Line] }
        elsif char =~ /^\s$/
          { script: :Whitespace, name: "Whitespace", script_extensions: [:Whitespace] }
        elsif char =~ /^\d$/
          { script: :Digit, name: "Digit", script_extensions: Unicode::Scripts.augmented_scripts(char).map(&:to_sym) }
        elsif char =~ /^\p{Emoji_Presentation}$/
          { script: :Emoji, name: "Emoji", script_extensions: [:Emoji] }
        else
          nil
        end
      end

      def fallback_common_script(char, extensions)
        # For characters unicode-scripts returns as "Common",
        # check if they match our custom fallback categories.
        # When unicode-scripts only returns ["Common"] for extensions,
        # use augmented_scripts to get all scripts that accept this character.
        all_extensions = if extensions == [:Common]
          Unicode::Scripts.augmented_scripts(char).map(&:to_sym)
        else
          extensions
        end

        if char =~ /^[[:punct:]]$/
          { script: :Punctuation, name: "Punctuation", script_extensions: all_extensions }
        else
          { script: :Common, name: "Common", script_extensions: all_extensions }
        end
      end
  end
end
