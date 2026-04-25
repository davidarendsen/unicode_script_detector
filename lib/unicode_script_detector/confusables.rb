module UnicodeScriptDetector
  module Confusables
    # Curated mapping of characters that visually resemble Latin letters.
    # Sourced from Unicode Confusables (https://unicode.org/Public/security/latest/confusables.txt)
    # Focused on the most dangerous lookalikes used in spoofing attacks.
    MAPPING = {
      # Cyrillic → Latin
      "а" => "a",   # U+0430 CYRILLIC SMALL LETTER A
      "е" => "e",   # U+0435 CYRILLIC SMALL LETTER IE
      "о" => "o",   # U+043E CYRILLIC SMALL LETTER O
      "р" => "p",   # U+0440 CYRILLIC SMALL LETTER ER
      "с" => "c",   # U+0441 CYRILLIC SMALL LETTER ES
      "х" => "x",   # U+0445 CYRILLIC SMALL LETTER HA
      "у" => "y",   # U+0443 CYRILLIC SMALL LETTER U
      "і" => "i",   # U+0456 CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I
      "ј" => "j",   # U+0458 CYRILLIC SMALL LETTER JE
      "ѕ" => "s",   # U+0455 CYRILLIC SMALL LETTER DZE
      "ԝ" => "w",   # U+051D CYRILLIC SMALL LETTER WE
      "ԛ" => "q",   # U+051B CYRILLIC SMALL LETTER QA
      "һ" => "h",   # U+04BB CYRILLIC SMALL LETTER SHHA
      "ԁ" => "d",   # U+0501 CYRILLIC SMALL LETTER KOMI DE
      "г" => "r",   # U+0433 CYRILLIC SMALL LETTER GHE
      "ѵ" => "v",   # U+0475 CYRILLIC SMALL LETTER IZHITSA
      "ѡ" => "w",   # U+0461 CYRILLIC SMALL LETTER OMEGA
      "ҽ" => "e",   # U+04BD CYRILLIC SMALL LETTER ABKHASIAN CHE
      "п" => "n",   # U+043F CYRILLIC SMALL LETTER PE
      "м" => "m",   # U+043C CYRILLIC SMALL LETTER EM
      "т" => "t",   # U+0442 CYRILLIC SMALL LETTER TE
      "ь" => "b",   # U+044C CYRILLIC SMALL LETTER SOFT SIGN
      "в" => "b",   # U+0432 CYRILLIC SMALL LETTER VE
      "к" => "k",   # U+043A CYRILLIC SMALL LETTER KA
      "з" => "z",   # U+0437 CYRILLIC SMALL LETTER ZE
      "и" => "u",   # U+0438 CYRILLIC SMALL LETTER I
      "й" => "y",   # U+0439 CYRILLIC SMALL LETTER SHORT I
      "л" => "n",   # U+043B CYRILLIC SMALL LETTER EL
      "ш" => "w",   # U+0448 CYRILLIC SMALL LETTER SHA
      "щ" => "w",   # U+0449 CYRILLIC SMALL LETTER SHCHA
      "ъ" => "b",   # U+044A CYRILLIC SMALL LETTER HARD SIGN
      "ы" => "bl",  # U+044B CYRILLIC SMALL LETTER YERU
      "ц" => "u",   # U+0446 CYRILLIC SMALL LETTER TSE
      "ч" => "4",   # U+0447 CYRILLIC SMALL LETTER CHE
      "я" => "r",   # U+044F CYRILLIC SMALL LETTER YA
      "ж" => "x",   # U+0436 CYRILLIC SMALL LETTER ZHE
      "б" => "6",   # U+0431 CYRILLIC SMALL LETTER BE
      "ё" => "e",   # U+0451 CYRILLIC SMALL LETTER IO
      "ѓ" => "r",   # U+0403 CYRILLIC CAPITAL LETTER GJE
      "ќ" => "k",   # U+040C CYRILLIC CAPITAL LETTER KJE
      "ѝ" => "n",   # U+045D CYRILLIC SMALL LETTER I WITH GRAVE
      "ғ" => "f",   # U+0493 CYRILLIC SMALL LETTER GHE WITH STROKE
      "ң" => "h",   # U+04A3 CYRILLIC SMALL LETTER EN WITH DESCENDER
      "ү" => "y",   # U+04AF CYRILLIC SMALL LETTER STRAIGHT U

      # Greek → Latin
      "α" => "a",   # U+03B1 GREEK SMALL LETTER ALPHA
      "ι" => "i",   # U+03B9 GREEK SMALL LETTER IOTA
      "κ" => "k",   # U+03BA GREEK SMALL LETTER KAPPA
      "ν" => "v",   # U+03BD GREEK SMALL LETTER NU
      "ρ" => "p",   # U+03C1 GREEK SMALL LETTER RHO
      "υ" => "u",   # U+03C5 GREEK SMALL LETTER UPSILON
      "ω" => "w",   # U+03C9 GREEK SMALL LETTER OMEGA
      "ο" => "o",   # U+03BF GREEK SMALL LETTER OMICRON
      "τ" => "t",   # U+03C4 GREEK SMALL LETTER TAU
      "η" => "n",   # U+03B7 GREEK SMALL LETTER ETA
      "ε" => "e",   # U+03B5 GREEK SMALL LETTER EPSILON
      "σ" => "o",   # U+03C3 GREEK SMALL LETTER SIGMA
      "ς" => "c",   # U+03C2 GREEK SMALL LETTER FINAL SIGMA
      "χ" => "x",   # U+03C7 GREEK SMALL LETTER CHI
      "γ" => "y",   # U+03B3 GREEK SMALL LETTER GAMMA
      "ζ" => "z",   # U+03B6 GREEK SMALL LETTER ZETA
      "δ" => "o",   # U+03B4 GREEK SMALL LETTER DELTA
      "β" => "b",   # U+03B2 GREEK SMALL LETTER BETA
      "μ" => "u",   # U+03BC GREEK SMALL LETTER MU
      "λ" => "n",   # U+03BB GREEK SMALL LETTER LAMDA
      "π" => "n",   # U+03C0 GREEK SMALL LETTER PI
      "θ" => "o",   # U+03B8 GREEK SMALL LETTER THETA
      "φ" => "o",   # U+03C6 GREEK SMALL LETTER PHI
      "ψ" => "y",   # U+03C8 GREEK SMALL LETTER PSI
      "ξ" => "e",   # U+03BE GREEK SMALL LETTER XI

      # Armenian → Latin
      "ա" => "w",   # U+056F ARMENIAN SMALL LETTER KEN
      "գ" => "q",   # U+0563 ARMENIAN SMALL LETTER GIM
      "զ" => "z",   # U+0566 ARMENIAN SMALL LETTER ZA
      "է" => "e",   # U+0567 ARMENIAN SMALL LETTER EH
      "լ" => "l",   # U+056C ARMENIAN SMALL LETTER LIWN
      "հ" => "h",   # U+0570 ARMENIAN SMALL LETTER HO
      "յ" => "y",   # U+0575 ARMENIAN SMALL LETTER YI
      "ո" => "n",   # U+0578 ARMENIAN SMALL LETTER VO
      "ս" => "s",   # U+057D ARMENIAN SMALL LETTER SEH
      "օ" => "o",   # U+0585 ARMENIAN SMALL LETTER OH
      "ք" => "p",   # U+0584 ARMENIAN SMALL LETTER KEH
      "դ" => "d",   # U+0564 ARMENIAN SMALL LETTER DA
      "մ" => "u",   # U+0574 ARMENIAN SMALL LETTER MEN
      "տ" => "t",   # U+057F ARMENIAN SMALL LETTER TIWN
      "կ" => "k",   # U+056F ARMENIAN SMALL LETTER KEN
      "բ" => "b",   # U+0562 ARMENIAN SMALL LETTER BEN
      "ր" => "n",   # U+0580 ARMENIAN SMALL LETTER REH
      "ց" => "u",   # U+057E ARMENIAN SMALL LETTER GIM
      "շ" => "w",   # U+0577 ARMENIAN SMALL LETTER SHA
      "վ" => "v",   # U+057E ARMENIAN SMALL LETTER GIM
      "ֆ" => "f",   # U+0586 ARMENIAN SMALL LETTER FEH
      "ռ" => "n",   # U+057C ARMENIAN SMALL LETTER RA

      # Georgian → Latin
      "ი" => "i",   # U+10D8 GEORGIAN LETTER IN
      "ო" => "o",   # U+10DD GEORGIAN LETTER ON
      "ყ" => "y",   # U+10E7 GEORGIAN LETTER QAR
      "ძ" => "z",   # U+10EB GEORGIAN LETTER JIL
      "ხ" => "x",   # U+10EE GEORGIAN LETTER XAN
      "თ" => "t",   # U+10D7 GEORGIAN LETTER TAN
      "პ" => "p",   # U+10DE GEORGIAN LETTER PAR
      "ჩ" => "4",   # U+10E9 GEORGIAN LETTER CHIN
      "ც" => "o",   # U+10EA GEORGIAN LETTER CAN
      "ჱ" => "e",   # U+10F1 GEORGIAN LETTER HE
      "გ" => "g",   # U+10D2 GEORGIAN LETTER GAN
      "უ" => "y",   # U+10E3 GEORGIAN LETTER UN
      "ვ" => "v",   # U+10D5 GEORGIAN LETTER VIN
      "ე" => "e",   # U+10D4 GEORGIAN LETTER EN
      "ა" => "a",   # U+10D0 GEORGIAN LETTER AN
      "ს" => "s",   # U+10E1 GEORGIAN LETTER SAN
      "ნ" => "n",   # U+10DC GEORGIAN LETTER NAR
      "რ" => "r",   # U+10E0 GEORGIAN LETTER RAE
      "ლ" => "n",   # U+10DA GEORGIAN LETTER LAS
      "ბ" => "b",   # U+10D1 GEORGIAN LETTER BAN
      "დ" => "d",   # U+10D3 GEORGIAN LETTER DON
      "კ" => "k",   # U+10D9 GEORGIAN LETTER KAN
      "მ" => "m",   # U+10DB GEORGIAN LETTER MAN
      "ფ" => "f",   # U+10E4 GEORGIAN LETTER PHAR
      "ქ" => "k",   # U+10E5 GEORGIAN LETTER KAR
      "შ" => "w",   # U+10E8 GEORGIAN LETTER SHIN
      "ღ" => "r",   # U+10E6 GEORGIAN LETTER GHAN
      "ჯ" => "j",   # U+10EF GEORGIAN LETTER JHAN
      "ჰ" => "h",   # U+10F0 GEORGIAN LETTER HAE
      "წ" => "o",   # U+10EC GEORGIAN LETTER CIL
      "ჭ" => "4",   # U+10ED GEORGIAN LETTER CHAR

      # Hebrew → Latin
      "ד" => "a",   # U+05D3 HEBREW LETTER DALET
      "ו" => "u",   # U+05D5 HEBREW LETTER VAV
      "ח" => "n",   # U+05D7 HEBREW LETTER HET
      "י" => "i",   # U+05D9 HEBREW LETTER YOD
      "ן" => "i",   # U+05DF HEBREW LETTER FINAL NUN
      "ס" => "o",   # U+05E1 HEBREW LETTER SAMEKH
      "װ" => "w",   # U+05F0 HEBREW LIGATURE YIDDISH DOUBLE VAV
      "ײ" => "y",   # U+05F2 HEBREW LIGATURE YIDDISH DOUBLE YOD
      "ש" => "w",   # U+05E9 HEBREW LETTER SHIN
      "ק" => "p",   # U+05E7 HEBREW LETTER QOF
      "ב" => "b",   # U+05D1 HEBREW LETTER BET
      "כ" => "n",   # U+05DB HEBREW LETTER KAF
      "ך" => "n",   # U+05DA HEBREW LETTER FINAL KAF
      "נ" => "n",   # U+05E0 HEBREW LETTER NUN
      "ם" => "o",   # U+05DD HEBREW LETTER FINAL MEM
      "ע" => "n",   # U+05E2 HEBREW LETTER AYIN
      "ז" => "z",   # U+05D6 HEBREW LETTER ZAYIN
      "ה" => "n",   # U+05D4 HEBREW LETTER HE
      "ר" => "n",   # U+05E8 HEBREW LETTER RESH
      "ת" => "n",   # U+05EA HEBREW LETTER TAV
      "צ" => "y",   # U+05E6 HEBREW LETTER TSADI
      "ץ" => "y",   # U+05E5 HEBREW LETTER FINAL TSADI
      "מ" => "a",   # U+05DE HEBREW LETTER MEM
      "ל" => "l",   # U+05DC HEBREW LETTER LAMED
      "ט" => "n",   # U+05D8 HEBREW LETTER TET
      "פ" => "n",   # U+05E4 HEBREW LETTER PE
      "ף" => "n",   # U+05E3 HEBREW LETTER FINAL PE
      "ג" => "g",   # U+05D2 HEBREW LETTER GIMEL

      # Ethiopic (Ge'ez) → Latin
      "ሀ" => "h",   # U+1200 ETHIOPIC SYLLABLE HA
      "ሠ" => "s",   # U+1220 ETHIOPIC SYLLABLE SZA
      "ሰ" => "s",   # U+1230 ETHIOPIC SYLLABLE SA
      "ስ" => "s",   # U+1235 ETHIOPIC SYLLABLE SE
      "በ" => "b",   # U+1260 ETHIOPIC SYLLABLE BA
      "ነ" => "n",   # U+1290 ETHIOPIC SYLLABLE NA
      "ተ" => "t",   # U+1270 ETHIOPIC SYLLABLE TA
      "ከ" => "k",   # U+12A8 ETHIOPIC SYLLABLE KA
      "ዐ" => "o",   # U+12D0 ETHIOPIC SYLLABLE PHARYNGEAL A
      "ዕ" => "o",   # U+12D5 ETHIOPIC SYLLABLE PHARYNGEAL EE
      "ዘ" => "z",   # U+12D8 ETHIOPIC SYLLABLE ZA
      "ጠ" => "t",   # U+1320 ETHIOPIC SYLLABLE TSA
      "ፐ" => "p",   # U+1350 ETHIOPIC SYLLABLE PA
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
      "\u2064", # Invisible plus
    ].freeze

    DIRECTIONAL_OVERRIDES = [
      "\u202A", # Left-to-right embedding
      "\u202B", # Right-to-left embedding
      "\u202C", # Pop directional formatting
      "\u202D", # Left-to-right override
      "\u202E", # Right-to-left override
    ].freeze

    SAFE_SCRIPT_COMBINATIONS = [
      Set[:Latin, :Han, :Hiragana, :Katakana],
      Set[:Latin, :Han, :Bopomofo],
      Set[:Latin, :Han, :Hangul],
      Set[:Hiragana, :Katakana, :Han],
      Set[:Latin, :Inherited],
      Set[:Latin, :Common],
      Set[:Latin, :Punctuation],
      Set[:Latin, :Digit],
      Set[:Latin, :Whitespace],
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
