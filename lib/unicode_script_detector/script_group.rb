module UnicodeScriptDetector
  class ScriptGroup
    attr_reader :script, :characters, :text

    def initialize(script, characters)
      @script = script
      @characters = characters
      @text = characters.map(&:char).join
    end

    def length
      @characters.length
    end

    def name
      @characters.first&.name
    end
  end
end
