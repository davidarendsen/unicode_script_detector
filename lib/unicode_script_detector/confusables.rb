require 'set'

module UnicodeScriptDetector
  module Confusables
    # Curated mapping of characters that visually resemble Latin letters.
    # AUTO-GENERATED from https://unicode.org/Public/security/latest/confusables.txt
    # Run `rake update_confusables` to regenerate.
    MAPPING = {

      # Cyrillic → Latin
      'Ѕ' => 'S',   # U+0405
      'І' => 'l',   # U+0406
      'Ј' => 'J',   # U+0408
      'А' => 'A',   # U+0410
      'В' => 'B',   # U+0412
      'Е' => 'E',   # U+0415
      'З' => '3',   # U+0417
      'К' => 'K',   # U+041A
      'М' => 'M',   # U+041C
      'Н' => 'H',   # U+041D
      'О' => 'O',   # U+041E
      'Р' => 'P',   # U+0420
      'С' => 'C',   # U+0421
      'Т' => 'T',   # U+0422
      'У' => 'Y',   # U+0423
      'Х' => 'X',   # U+0425
      'Ь' => 'b',   # U+042C
      'а' => 'a',   # U+0430
      'б' => '6',   # U+0431
      'г' => 'r',   # U+0433
      'е' => 'e',   # U+0435
      'о' => 'o',   # U+043E
      'р' => 'p',   # U+0440
      'с' => 'c',   # U+0441
      'у' => 'y',   # U+0443
      'х' => 'x',   # U+0445
      'ш' => 'w',   # U+0448
      'ѕ' => 's',   # U+0455
      'і' => 'i',   # U+0456
      'ј' => 'j',   # U+0458
      'ѡ' => 'w',   # U+0461
      'Ѵ' => 'V',   # U+0474
      'ѵ' => 'v',   # U+0475
      'Ү' => 'Y',   # U+04AE
      'ү' => 'y',   # U+04AF
      'һ' => 'h',   # U+04BB
      'ҽ' => 'e',   # U+04BD
      'Ӏ' => 'l',   # U+04C0
      'ӏ' => 'l',   # U+04CF
      'Ӡ' => '3',   # U+04E0
      'ԁ' => 'd',   # U+0501
      'Ԍ' => 'G',   # U+050C
      'ԛ' => 'q',   # U+051B
      'Ԝ' => 'W',   # U+051C
      'ԝ' => 'w',   # U+051D

      # Greek → Latin
      'ͺ' => 'i',   # U+037A
      'Ϳ' => 'J',   # U+037F
      'Α' => 'A',   # U+0391
      'Β' => 'B',   # U+0392
      'Ε' => 'E',   # U+0395
      'Ζ' => 'Z',   # U+0396
      'Η' => 'H',   # U+0397
      'Ι' => 'l',   # U+0399
      'Κ' => 'K',   # U+039A
      'Μ' => 'M',   # U+039C
      'Ν' => 'N',   # U+039D
      'Ο' => 'O',   # U+039F
      'Ρ' => 'P',   # U+03A1
      'Τ' => 'T',   # U+03A4
      'Υ' => 'Y',   # U+03A5
      'Χ' => 'X',   # U+03A7
      'α' => 'a',   # U+03B1
      'γ' => 'y',   # U+03B3
      'ι' => 'i',   # U+03B9
      'ν' => 'v',   # U+03BD
      'ο' => 'o',   # U+03BF
      'ρ' => 'p',   # U+03C1
      'σ' => 'o',   # U+03C3
      'υ' => 'u',   # U+03C5
      'ϒ' => 'Y',   # U+03D2
      'Ϝ' => 'F',   # U+03DC
      'Ϩ' => '2',   # U+03E8
      'Ϭ' => '6',   # U+03EC
      'ϭ' => 'o',   # U+03ED
      'ϱ' => 'p',   # U+03F1
      'ϲ' => 'c',   # U+03F2
      'ϳ' => 'j',   # U+03F3
      'ϸ' => 'p',   # U+03F8
      'Ϲ' => 'C',   # U+03F9
      'Ϻ' => 'M',   # U+03FA

      # Armenian → Latin
      'Ս' => 'U',   # U+054D
      'Տ' => 'S',   # U+054F
      'Օ' => 'O',   # U+0555
      'ա' => 'w',   # U+0561
      'գ' => 'q',   # U+0563
      'զ' => 'q',   # U+0566
      'հ' => 'h',   # U+0570
      'ո' => 'n',   # U+0578
      'ռ' => 'n',   # U+057C
      'ս' => 'u',   # U+057D
      'ց' => 'g',   # U+0581
      'ւ' => 'i',   # U+0582
      'ք' => 'f',   # U+0584
      'օ' => 'o',   # U+0585

      # Georgian → Latin
      'ყ' => 'y',   # U+10E7
      'ჿ' => 'o',   # U+10FF

      # Hebrew → Latin
      '׀' => 'l',   # U+05C0
      'ו' => 'l',   # U+05D5
      'ט' => 'v',   # U+05D8
      'ן' => 'l',   # U+05DF
      'ס' => 'o',   # U+05E1

      # Ethiopic → Latin
      'ሀ' => 'U',   # U+1200
      'ዐ' => 'O',   # U+12D0
    }.freeze

    INVISIBLE_CHARACTERS = [
      "\u200B", # Zero-width space
      "\u200C", # Zero-width non-joiner
      "\u200D", # Zero-width joiner
      "\u200E", # Left-to-right mark
      "\u200F", # Right-to-left mark
      "\uFEFF", # Zero-width no-break space (BOM)
      "\u2060", # Word joiner
      "\u00AD", # Soft hyphen
      "\u180E", # Mongolian vowel separator
      "\u2061", # Function application
      "\u2062", # Invisible times
      "\u2063", # Invisible separator
      "\u2064" # Invisible plus
    ].freeze

    DIRECTIONAL_OVERRIDES = [
      "\u202A", # Left-to-right embedding
      "\u202B", # Right-to-left embedding
      "\u202C", # Pop directional formatting
      "\u202D", # Left-to-right override
      "\u202E" # Right-to-left override
    ].freeze

    # SAFE_SCRIPT_COMBINATIONS defines which script combinations are considered
    # safe (not suspicious) when mixed together. This implements Unicode TR #39's
    # "Moderately Restrictive" level, which is the recommended default for
    # general-purpose use. It allows legitimate multilingual text (e.g. Latin+CJK)
    # while still flagging potentially spoofed text (e.g. Latin+Cyrillic).
    #
    # See: https://unicode.org/reports/tr39/#Restriction_Level_Detection
    SAFE_SCRIPT_COMBINATIONS = [
      Set[:Latin, :Han, :Hiragana, :Katakana],  # Japanese + Latin
      Set[:Latin, :Han, :Bopomofo],              # Chinese (Bopomofo) + Latin
      Set[:Latin, :Han, :Hangul],                # Korean + Latin
      Set[:Hiragana, :Katakana, :Han],           # Japanese only
      Set[:Latin, :Inherited],                   # Latin with diacritics
      Set[:Latin, :Common],                      # Latin with common chars
      Set[:Latin, :Punctuation],                 # Latin with punctuation
      Set[:Latin, :Digit],                       # Latin with digits
      Set[:Latin, :Whitespace]                   # Latin with whitespace
    ].freeze

    def self.confusable?(char)
      MAPPING.key?(char)
    end

    def self.looks_like(char)
      MAPPING[char]
    end

    def self.invisible?(char)
      INVISIBLE_CHARACTERS.include?(char)
    end

    def self.directional_override?(char)
      DIRECTIONAL_OVERRIDES.include?(char)
    end
  end
end
