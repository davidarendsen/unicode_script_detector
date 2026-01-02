module UnicodeScriptDetector
  class Detector
    attr_reader :scripts

    def initialize(string)
      @string = string
      @char_scripts = []
      @script_names = []

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
        .zip(@char_scripts, @script_names)
        .chunk { |_, script, _| script }
        .map do |script, char_data| 
          chars = char_data.map(&:first)
          name = char_data.first[2]
          ScriptGroup.new(script, chars, name)
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
        end
      end

      def find_script_for_char(char)
        Scripts::LIST.each do |script_data|
          return script_data if char.match?(script_data[:regex])
        end
        { script: :Other, name: "Other" }
      end

  end
end
