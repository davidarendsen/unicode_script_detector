module UnicodeScriptDetector
  class Detector
    attr_reader :characters, :scripts

    def initialize(string)
      @string = string
      @characters = []
      @scripts = []

      detect_scripts
    end

    def scripts
      @scripts.uniq
    end

    def detect_scripts
      @string.chars.each_with_index do |char, index|
        detected = false
        Scripts::LIST.each_with_index do |script_data, index|
          if char.match?(script_data[:regex])
            @characters << Character.new(char, script_data[:script], script_data[:name])
            @scripts << script_data[:script]
            detected = true
            break
          end
        end
        @characters << Character.new(char, :Other, "Other") unless detected
        @scripts << :Other unless detected
      end
    end

    def contains?(scripts)
      return @scripts.include?(scripts) if scripts.is_a?(Symbol)

      scripts.all? { |script| @scripts.include?(script) }
    end

    def contains_only?(scripts)
      return @scripts.uniq == [scripts] if scripts.is_a?(Symbol)

      @scripts.uniq.sort == scripts.uniq.sort
    end
  end
end