module UnicodeScriptDetector
  class ScriptGroup
    attr_reader :script, :text, :name, :script_extensions, :char_extensions

    def initialize(script, chars, name, script_extensions = [], char_extensions = [])
      @script = script
      @chars = chars
      @text = chars.join
      @name = name
      @script_extensions = script_extensions
      @char_extensions = char_extensions
    end

    def length
      @chars.length
    end

    def characters
      @characters ||= @chars.map { |char| Character.new(char, @script, @name) }
    end
  end
end
