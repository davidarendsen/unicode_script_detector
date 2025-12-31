module UnicodeScriptDetector
  class Character
    attr_reader :char, :script, :name

    def initialize(char, script, name)
      @char = char
      @script = script
      @name = name
    end

    def latin?
      @script === :Latin
    end

    def hiragana?
      @script === :Hiragana
    end

    def punctuation?
      @script === :Punctuation
    end

    def emoji?
      @script === :Emoji
    end

    def digit?
      @script === :Digit
    end
  end
end
