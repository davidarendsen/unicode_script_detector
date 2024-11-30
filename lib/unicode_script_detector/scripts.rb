module UnicodeScriptDetector
  class Scripts
    LIST = [
      { 
        script: :Arabic, 
        name: "Arabic", 
        regex: /\p{Arabic}/, 
      },
      { 
        script: :Armenian, 
        name: "Armenian", 
        regex: /\p{Armenian}/, 
      },
      { 
        script: :Balinese, 
        name: "Balinese", 
        regex: /\p{Balinese}/, 
      },
      { 
        script: :Bamum, 
        name: "Bamum", 
        regex: /\p{Bamum}/, 
      },
      { 
        script: :Batak, 
        name: "Batak", 
        regex: /\p{Batak}/, 
      },
      { 
        script: :Bengali, 
        name: "Bengali", 
        regex: /\p{Bengali}/, 
      },
      { 
        script: :Bopomofo, 
        name: "Bopomofo", 
        regex: /\p{Bopomofo}/, 
      },
      { 
        script: :Brahmi, 
        name: "Brahmi", 
        regex: /\p{Brahmi}/, 
      },
      { 
        script: :Braille, 
        name: "Braille", 
        regex: /\p{Braille}/, 
      },
      { 
        script: :Buginese, 
        name: "Buginese", 
        regex: /\p{Buginese}/, 
      },
      { 
        script: :Buhid, 
        name: "Buhid", 
        regex: /\p{Buhid}/, 
      },
      { 
        script: :Canadian_Aboriginal, 
        name: "Canadian_Aboriginal", 
        regex: /\p{Canadian_Aboriginal}/, 
      },
      { 
        script: :Carian, 
        name: "Carian", 
        regex: /\p{Carian}/, 
      },
      { 
        script: :Chakma, 
        name: "Chakma", 
        regex: /\p{Chakma}/, 
      },
      { 
        script: :Cham, 
        name: "Cham", 
        regex: /\p{Cham}/, 
      },
      { 
        script: :Cherokee, 
        name: "Cherokee", 
        regex: /\p{Cherokee}/, 
      },
      { 
        script: :Coptic, 
        name: "Coptic", 
        regex: /\p{Coptic}/, 
      },
      { 
        script: :Cuneiform, 
        name: "Cuneiform", 
        regex: /\p{Cuneiform}/, 
      },
      { 
        script: :Cypriot, 
        name: "Cypriot", 
        regex: /\p{Cypriot}/, 
      },
      { 
        script: :Cyrillic, 
        name: "Cyrillic", 
        regex: /\p{Cyrillic}/, 
      },
      { 
        script: :Deseret, 
        name: "Deseret", 
        regex: /\p{Deseret}/, 
      },
      { 
        script: :Devanagari, 
        name: "Devanagari", 
        regex: /\p{Devanagari}/, 
      },
      { 
        script: :Egyptian_Hieroglyphs, 
        name: "Egyptian_Hieroglyphs", 
        regex: /\p{Egyptian_Hieroglyphs}/, 
      },
      { 
        script: :Ethiopic, 
        name: "Ethiopic", 
        regex: /\p{Ethiopic}/, 
      },
      { 
        script: :Georgian, 
        name: "Georgian", 
        regex: /\p{Georgian}/, 
      },
      { 
        script: :Glagolitic, 
        name: "Glagolitic", 
        regex: /\p{Glagolitic}/, 
      },
      { 
        script: :Gothic, 
        name: "Gothic", 
        regex: /\p{Gothic}/, 
      },
      { 
        script: :Greek, 
        name: "Greek", 
        regex: /\p{Greek}/, 
      },
      { 
        script: :Gujarati, 
        name: "Gujarati", 
        regex: /\p{Gujarati}/, 
      },
      { 
        script: :Gurmukhi, 
        name: "Gurmukhi", 
        regex: /\p{Gurmukhi}/, 
      },
      { 
        script: :Han, 
        name: "Han", 
        regex: /\p{Han}/, 
      },
      { 
        script: :Hangul, 
        name: "Hangul", 
        regex: /\p{Hangul}/, 
      },
      { 
        script: :Hanunoo, 
        name: "Hanunoo", 
        regex: /\p{Hanunoo}/, 
      },
      { 
        script: :Hebrew, 
        name: "Hebrew", 
        regex: /\p{Hebrew}/, 
      },
      { 
        script: :Hiragana, 
        name: "Hiragana", 
        regex: /\p{Hiragana}/, 
      },
      { 
        script: :Imperial_Aramaic, 
        name: "Imperial_Aramaic", 
        regex: /\p{Imperial_Aramaic}/, 
      },
      { 
        script: :Inherited, 
        name: "Inherited", 
        regex: /\p{Inherited}/, 
      },
      { 
        script: :Inscriptional_Pahlavi, 
        name: "Inscriptional_Pahlavi", 
        regex: /\p{Inscriptional_Pahlavi}/, 
      },
      { 
        script: :Inscriptional_Parthian, 
        name: "Inscriptional_Parthian", 
        regex: /\p{Inscriptional_Parthian}/, 
      },
      { 
        script: :Javanese, 
        name: "Javanese", 
        regex: /\p{Javanese}/, 
      },
      { 
        script: :Kaithi, 
        name: "Kaithi", 
        regex: /\p{Kaithi}/, 
      },
      { 
        script: :Kannada, 
        name: "Kannada", 
        regex: /\p{Kannada}/, 
      },
      { 
        script: :Katakana, 
        name: "Katakana", 
        regex: /\p{Katakana}/, 
      },
      { 
        script: :Kayah_Li, 
        name: "Kayah_Li", 
        regex: /\p{Kayah_Li}/, 
      },
      { 
        script: :Kharoshthi, 
        name: "Kharoshthi", 
        regex: /\p{Kharoshthi}/, 
      },
      { 
        script: :Khmer, 
        name: "Khmer", 
        regex: /\p{Khmer}/, 
      },
      { 
        script: :Lao, 
        name: "Lao", 
        regex: /\p{Lao}/, 
      },
      { 
        script: :Latin, 
        name: "Latin", 
        regex: /\p{Latin}/, 
      },
      { 
        script: :Lepcha, 
        name: "Lepcha", 
        regex: /\p{Lepcha}/, 
      },
      { 
        script: :Limbu, 
        name: "Limbu", 
        regex: /\p{Limbu}/, 
      },
      { 
        script: :Linear_B, 
        name: "Linear_B", 
        regex: /\p{Linear_B}/, 
      },
      { 
        script: :Lycian, 
        name: "Lycian", 
        regex: /\p{Lycian}/, 
      },
      { 
        script: :Lydian, 
        name: "Lydian", 
        regex: /\p{Lydian}/, 
      },
      { 
        script: :Malayalam, 
        name: "Malayalam", 
        regex: /\p{Malayalam}/, 
      },
      { 
        script: :Mandaic, 
        name: "Mandaic", 
        regex: /\p{Mandaic}/, 
      },
      { 
        script: :Meetei_Mayek, 
        name: "Meetei_Mayek", 
        regex: /\p{Meetei_Mayek}/, 
      },
      { 
        script: :Meroitic_Cursive, 
        name: "Meroitic_Cursive", 
        regex: /\p{Meroitic_Cursive}/, 
      },
      { 
        script: :Meroitic_Hieroglyphs, 
        name: "Meroitic_Hieroglyphs", 
        regex: /\p{Meroitic_Hieroglyphs}/, 
      },
      { 
        script: :Miao, 
        name: "Miao", 
        regex: /\p{Miao}/, 
      },
      { 
        script: :Mongolian, 
        name: "Mongolian", 
        regex: /\p{Mongolian}/, 
      },
      { 
        script: :Myanmar, 
        name: "Myanmar", 
        regex: /\p{Myanmar}/, 
      },
      { 
        script: :New_Tai_Lue, 
        name: "New_Tai_Lue", 
        regex: /\p{New_Tai_Lue}/, 
      },
      { 
        script: :Nko, 
        name: "Nko", 
        regex: /\p{Nko}/, 
      },
      { 
        script: :Ogham, 
        name: "Ogham", 
        regex: /\p{Ogham}/, 
      },
      { 
        script: :Ol_Chiki, 
        name: "Ol_Chiki", 
        regex: /\p{Ol_Chiki}/, 
      },
      { 
        script: :Old_Italic, 
        name: "Old_Italic", 
        regex: /\p{Old_Italic}/, 
      },
      { 
        script: :Old_Persian, 
        name: "Old_Persian", 
        regex: /\p{Old_Persian}/, 
      },
      { 
        script: :Old_South_Arabian, 
        name: "Old_South_Arabian", 
        regex: /\p{Old_South_Arabian}/, 
      },
      { 
        script: :Old_Turkic, 
        name: "Old_Turkic", 
        regex: /\p{Old_Turkic}/, 
      },
      { 
        script: :Oriya, 
        name: "Oriya", 
        regex: /\p{Oriya}/, 
      },
      { 
        script: :Osmanya, 
        name: "Osmanya", 
        regex: /\p{Osmanya}/, 
      },
      { 
        script: :Phags_Pa, 
        name: "Phags_Pa", 
        regex: /\p{Phags_Pa}/, 
      },
      { 
        script: :Phoenician, 
        name: "Phoenician", 
        regex: /\p{Phoenician}/, 
      },
      { 
        script: :Rejang, 
        name: "Rejang", 
        regex: /\p{Rejang}/, 
      },
      { 
        script: :Runic, 
        name: "Runic", 
        regex: /\p{Runic}/, 
      },
      { 
        script: :Saurashtra, 
        name: "Saurashtra", 
        regex: /\p{Saurashtra}/, 
      },
      { 
        script: :Sharada, 
        name: "Sharada", 
        regex: /\p{Sharada}/, 
      },
      { 
        script: :Shavian, 
        name: "Shavian", 
        regex: /\p{Shavian}/, 
      },
      { 
        script: :Sinhala, 
        name: "Sinhala", 
        regex: /\p{Sinhala}/, 
      },
      { 
        script: :Sora_Sompeng, 
        name: "Sora_Sompeng", 
        regex: /\p{Sora_Sompeng}/, 
      },
      { 
        script: :Sundanese, 
        name: "Sundanese", 
        regex: /\p{Sundanese}/, 
      },
      { 
        script: :Syloti_Nagri, 
        name: "Syloti_Nagri", 
        regex: /\p{Syloti_Nagri}/, 
      },
      { 
        script: :Syriac, 
        name: "Syriac", 
        regex: /\p{Syriac}/, 
      },
      { 
        script: :Tagalog, 
        name: "Tagalog", 
        regex: /\p{Tagalog}/, 
      },
      { 
        script: :Tagbanwa, 
        name: "Tagbanwa", 
        regex: /\p{Tagbanwa}/, 
      },
      { 
        script: :Tai_Le, 
        name: "Tai_Le", 
        regex: /\p{Tai_Le}/, 
      },
      { 
        script: :Tai_Tham, 
        name: "Tai_Tham", 
        regex: /\p{Tai_Tham}/, 
      },
      { 
        script: :Tai_Viet, 
        name: "Tai_Viet", 
        regex: /\p{Tai_Viet}/, 
      },
      { 
        script: :Takri, 
        name: "Takri", 
        regex: /\p{Takri}/, 
      },
      { 
        script: :Tamil, 
        name: "Tamil", 
        regex: /\p{Tamil}/, 
      },
      { 
        script: :Telugu, 
        name: "Telugu", 
        regex: /\p{Telugu}/, 
      },
      { 
        script: :Thaana, 
        name: "Thaana", 
        regex: /\p{Thaana}/, 
      },
      { 
        script: :Thai, 
        name: "Thai", 
        regex: /\p{Thai}/, 
      },
      { 
        script: :Tibetan, 
        name: "Tibetan", 
        regex: /\p{Tibetan}/, 
      },
      { 
        script: :Tifinagh, 
        name: "Tifinagh", 
        regex: /\p{Tifinagh}/, 
      },
      { 
        script: :Ugaritic, 
        name: "Ugaritic", 
        regex: /\p{Ugaritic}/, 
      },
      { 
        script: :Vai, 
        name: "Vai", 
        regex: /\p{Vai}/, 
      },
      { 
        script: :Yi, 
        name: "Yi", 
        regex: /\p{Yi}/, 
      },
      {
        script: :Emoji,
        name: "Emoji",
        regex: /\p{Emoji}/,
      },
      { 
        script: :Common, 
        name: "Common", 
        regex: /\p{Common}/, 
      },
    ]
  end
end