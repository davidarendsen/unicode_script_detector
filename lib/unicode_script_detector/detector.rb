module UnicodeScriptDetector
  class Detector
    # See lexilogos.com

    # European Scripts
    # Latin (\p{Latin}): Western languages (e.g., English, Spanish, French).
    # Cyrillic (\p{Cyrillic}): Eastern European languages (e.g., Russian, Bulgarian, Serbian).
    # Greek (\p{Greek}): Greek language and mathematical symbols.
    # Armenian (\p{Armenian}): Armenian language.
    # Georgian (\p{Georgian}): Georgian language.
    # Middle Eastern Scripts
    # Arabic (\p{Arabic}): Arabic, Persian, and Urdu languages.
    # Coptic
    # Hebrew (\p{Hebrew}): Hebrew script.
    # Syriac (\p{Syriac}): Classical Syriac and related scripts.
    # Thaana (\p{Thaana}): Divehi language (Maldives).
    # South Asian Scripts
    # Devanagari (\p{Devanagari}): Hindi, Marathi, Sanskrit.
    # Bengali (\p{Bengali}): Bengali and Assamese.
    # Gurmukhi (\p{Gurmukhi}): Punjabi.
    # Gujarati (\p{Gujarati}): Gujarati.
    # Tamil (\p{Tamil}): Tamil.
    # Telugu (\p{Telugu}): Telugu.
    # Kannada (\p{Kannada}): Kannada.
    # Malayalam (\p{Malayalam}): Malayalam.
    # Sinhala (\p{Sinhala}): Sinhala.
    # Southeast Asian Scripts
    # Thai (\p{Thai}): Thai language.
    # Lao (\p{Lao}): Lao language.
    # Myanmar (\p{Myanmar}): Burmese and related languages.
    # Khmer (\p{Khmer}): Cambodian language.
    # East Asian Scripts
    # Han (\p{Han}): Chinese characters.
    # Bopomofo (\p{Bopomofo}): Zhuyin Fuhao. A transliteration system for Standard Chinese and other Sinitic languages
    # Hiragana (\p{Hiragana}): Japanese.
    # Katakana (\p{Katakana}): Japanese.
    # Hangul (\p{Hangul}): Korean.
    # African Scripts
    # Ethiopic (\p{Ethiopic}): Amharic and other Ethiopian languages.
    # N'Ko (\p{Nko}): Used in West Africa.
    # Tifinagh (\p{Tifinagh}): Berber languages.
    # Indigenous Scripts
    # Cherokee (\p{Cherokee}): Native American Cherokee language.
    # Canadian Aboriginal Syllabics (\p{Canadian_Aboriginal}): Cree, Inuktitut, and related languages.
    # Historic Scripts
    # Runic (\p{Runic}): Old Norse.
    # Old Italic (\p{Old_Italic}): Early Italic scripts.
    # Cuneiform (\p{Cuneiform}): Ancient Mesopotamian texts.
    # Egyptian Hieroglyphs (\p{Egyptian_Hieroglyphs}): Ancient Egyptian texts.
    # Special and Symbolic Scripts
    # Mathematical Symbols (\p{Math}): Used in mathematics.
    # Emoji (\p{Emoji}): Modern pictograms.
    # Symbols (\p{Symbol}): Miscellaneous symbols and pictographs
    # Braille
    # Glagolitic (\p{Glagolitic}): Early Slavic script.
    # Osmanya (\p{Osmanya}): Somali script.
    # Deseret (\p{Deseret}): Mormon alphabet.
    # Linear B (\p{Linear_B}): Ancient Greek script.
    # Vai (\p{Vai}): West African script.

    # List of common Unicode script properties
    SUPPORTED_SCRIPTS = %w[
      Latin Cyrillic Greek Armenian Georgian Arabic Hebrew Syriac Thaana
      Devanagari Bengali Gurmukhi Gujarati Tamil Telugu Kannada Malayalam
      Sinhala Thai Lao Myanmar Khmer Han Bopomofo Hiragana Katakana Hangul Ethiopic
      Nko Tifinagh Cherokee Canadian_Aboriginal 
      Runic Old_Italic Cuneiform Egyptian_Hieroglyphs
      Math Emoji Symbol Glagolitic Osmanya Deseret Linear_B Vai Sora_Sompeng Lycian
    ]

    def initialize(string)
      @string = string
    end

    def detect_scripts
      scripts = []

      @string.chars.each_with_index do |char, index|
        detected = false
        Scripts::LIST.each_with_index do |script_data, index|
          if char.match?(script_data[:regex])
            scripts << Character.new(char, script_data[:script], script_data[:name])
            detected = true
            break
          end
        end
        scripts << Character.new(char, :Other, "Other", "Other characters.") unless detected
      end

      scripts
    end
  end
end

# input = "Hello, мир, 你好, مرحبا! 😭"
# scripts_detected = Detector.new(input).detect_scripts
# puts scripts_detected