module UnicodeScriptDetector
  class ScriptGroup
    attr_reader :script, :text, :name

    def initialize(script, chars, name)
      @script = script
      @chars = chars
      @text = chars.join
      @name = name
    end

    def length
      @chars.length
    end

    def characters
      @characters ||= @chars.map { |char| Character.new(char, @script, @name) }
    end
  end
end
