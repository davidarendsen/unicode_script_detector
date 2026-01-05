module UnicodeScriptDetector
  class Scripts
    LIST = [
      { 
        script: :Adlam, 
        name: "Adlam", 
        regex: /\p{Adlam}/, 
      },
      { 
        script: :Ahom, 
        name: "Ahom", 
        regex: /\p{Ahom}/, 
      },
      { 
        script: :Anatolian_Hieroglyphs, 
        name: "Anatolian Hieroglyphs", 
        regex: /\p{Anatolian_Hieroglyphs}/, 
      },
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
        script: :Avestan, 
        name: "Avestan", 
        regex: /\p{Avestan}/, 
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
        script: :Bassa_Vah, 
        name: "Bassa Vah", 
        regex: /\p{Bassa_Vah}/, 
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
        script: :Bhaiksuki, 
        name: "Bhaiksuki", 
        regex: /\p{Bhaiksuki}/, 
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
        name: "Canadian Aboriginal", 
        regex: /\p{Canadian_Aboriginal}/, 
      },
      { 
        script: :Carian, 
        name: "Carian", 
        regex: /\p{Carian}/, 
      },
      { 
        script: :Caucasian_Albanian, 
        name: "Caucasian Albanian", 
        regex: /\p{Caucasian_Albanian}/, 
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
        script: :Chorasmian, 
        name: "Chorasmian", 
        regex: /\p{Chorasmian}/, 
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
        script: :Cypro_Minoan, 
        name: "Cypro Minoan", 
        regex: /\p{Cypro_Minoan}/, 
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
        script: :Dives_Akuru, 
        name: "Dives Akuru", 
        regex: /\p{Dives_Akuru}/, 
      },
      { 
        script: :Dogra, 
        name: "Dogra", 
        regex: /\p{Dogra}/, 
      },
      { 
        script: :Duployan, 
        name: "Duployan", 
        regex: /\p{Duployan}/, 
      },
      { 
        script: :Egyptian_Hieroglyphs, 
        name: "Egyptian Hieroglyphs", 
        regex: /\p{Egyptian_Hieroglyphs}|[\u{13460}-\u{1355F}]/, 
      },
      { 
        script: :Elbasan, 
        name: "Elbasan", 
        regex: /\p{Elbasan}/, 
      },
      { 
        script: :Elymaic, 
        name: "Elymaic", 
        regex: /\p{Elymaic}/, 
      },
      { 
        script: :Ethiopic, 
        name: "Ethiopic", 
        regex: /\p{Ethiopic}/, 
      },
      { 
        script: :Garay, 
        name: "Garay", 
        regex: /[\u{10D40}-\u{10D8F}]/,
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
        script: :Grantha, 
        name: "Grantha", 
        regex: /\p{Grantha}/, 
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
        script: :Gunjala_Gondi, 
        name: "Gunjala Gondi", 
        regex: /\p{Gunjala_Gondi}/, 
      },
      { 
        script: :Gurmukhi, 
        name: "Gurmukhi", 
        regex: /\p{Gurmukhi}/, 
      },
      { 
        script: :Gurung_Khema, 
        name: "Gurung Khema", 
        regex: /[\u{16100}-\u{1613F}]/,
      },
      { 
        script: :Han, 
        name: "Han", 
        regex: /\p{Han}|[\u{323B0}-\u{3347F}]/, 
      },
      { 
        script: :Hangul, 
        name: "Hangul", 
        regex: /\p{Hangul}/, 
      },
      { 
        script: :Hanifi_Rohingya, 
        name: "Hanifi Rohingya", 
        regex: /\p{Hanifi_Rohingya}/, 
      },
      { 
        script: :Hanunoo, 
        name: "Hanunoo", 
        regex: /\p{Hanunoo}/, 
      },
      { 
        script: :Hatran, 
        name: "Hatran", 
        regex: /\p{Hatran}/, 
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
        name: "Imperial Aramaic", 
        regex: /\p{Imperial_Aramaic}/, 
      },
      { 
        script: :Inherited, 
        name: "Inherited", 
        regex: /\p{Inherited}/, 
      },
      { 
        script: :Inscriptional_Pahlavi, 
        name: "Inscriptional Pahlavi", 
        regex: /\p{Inscriptional_Pahlavi}/, 
      },
      { 
        script: :Inscriptional_Parthian, 
        name: "Inscriptional Parthian", 
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
        script: :Kawi, 
        name: "Kawi", 
        regex: /\p{Kawi}/, 
      },
      { 
        script: :Kayah_Li, 
        name: "Kayah Li", 
        regex: /\p{Kayah_Li}/, 
      },
      { 
        script: :Kharoshthi, 
        name: "Kharoshthi", 
        regex: /\p{Kharoshthi}/, 
      },
      { 
        script: :Khitan_Small_Script, 
        name: "Khitan Small Script", 
        regex: /\p{Khitan_Small_Script}/, 
      },
      { 
        script: :Khmer, 
        name: "Khmer", 
        regex: /\p{Khmer}/, 
      },
      { 
        script: :Khojki, 
        name: "Khojki", 
        regex: /\p{Khojki}/, 
      },
      { 
        script: :Khudawadi, 
        name: "Khudawadi", 
        regex: /\p{Khudawadi}/, 
      },
      { 
        script: :Kirat_Rai, 
        name: "Kirat Rai", 
        regex: /[\u{16D40}-\u{16D7F}]/,
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
        script: :Linear_A, 
        name: "Linear A", 
        regex: /\p{Linear_A}/, 
      },
      { 
        script: :Linear_B, 
        name: "Linear B", 
        regex: /\p{Linear_B}/, 
      },
      { 
        script: :Lisu, 
        name: "Lisu", 
        regex: /\p{Lisu}/, 
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
        script: :Mahajani, 
        name: "Mahajani", 
        regex: /\p{Mahajani}/, 
      },
      { 
        script: :Makasar, 
        name: "Makasar", 
        regex: /\p{Makasar}/, 
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
        script: :Manichaean, 
        name: "Manichaean", 
        regex: /\p{Manichaean}/, 
      },
      { 
        script: :Marchen, 
        name: "Marchen", 
        regex: /\p{Marchen}/, 
      },
      { 
        script: :Masaram_Gondi, 
        name: "Masaram Gondi", 
        regex: /\p{Masaram_Gondi}/, 
      },
      { 
        script: :Medefaidrin, 
        name: "Medefaidrin", 
        regex: /\p{Medefaidrin}/, 
      },
      { 
        script: :Meetei_Mayek, 
        name: "Meetei Mayek", 
        regex: /\p{Meetei_Mayek}/, 
      },
      { 
        script: :Mende_Kikakui, 
        name: "Mende Kikakui", 
        regex: /\p{Mende_Kikakui}/, 
      },
      { 
        script: :Meroitic_Cursive, 
        name: "Meroitic Cursive", 
        regex: /\p{Meroitic_Cursive}/, 
      },
      { 
        script: :Meroitic_Hieroglyphs, 
        name: "Meroitic Hieroglyphs", 
        regex: /\p{Meroitic_Hieroglyphs}/, 
      },
      { 
        script: :Miao, 
        name: "Miao", 
        regex: /\p{Miao}/, 
      },
      { 
        script: :Modi, 
        name: "Modi", 
        regex: /\p{Modi}/, 
      },
      { 
        script: :Mongolian, 
        name: "Mongolian", 
        regex: /\p{Mongolian}/, 
      },
      { 
        script: :Mro, 
        name: "Mro", 
        regex: /\p{Mro}/, 
      },
      { 
        script: :Multani, 
        name: "Multani", 
        regex: /\p{Multani}/, 
      },
      { 
        script: :Myanmar, 
        name: "Myanmar", 
        regex: /\p{Myanmar}|[\u{116D0}-\u{116FF}]/, 
      },
      { 
        script: :Nabataean, 
        name: "Nabataean", 
        regex: /\p{Nabataean}/, 
      },
      { 
        script: :Nag_Mundari, 
        name: "Nag Mundari", 
        regex: /\p{Nag_Mundari}/, 
      },
      { 
        script: :Nandinagari, 
        name: "Nandinagari", 
        regex: /\p{Nandinagari}/, 
      },
      { 
        script: :New_Tai_Lue, 
        name: "New Tai Lue", 
        regex: /\p{New_Tai_Lue}/, 
      },
      { 
        script: :Newa, 
        name: "Newa", 
        regex: /\p{Newa}/, 
      },
      { 
        script: :Nko, 
        name: "Nko", 
        regex: /\p{Nko}/, 
      },
      { 
        script: :Nushu, 
        name: "Nushu", 
        regex: /\p{Nushu}/, 
      },
      { 
        script: :Nyiakeng_Puachue_Hmong, 
        name: "Nyiakeng Puachue Hmong", 
        regex: /\p{Nyiakeng_Puachue_Hmong}/, 
      },
      { 
        script: :Ogham, 
        name: "Ogham", 
        regex: /\p{Ogham}/, 
      },
      { 
        script: :Ol_Chiki, 
        name: "Ol Chiki", 
        regex: /\p{Ol_Chiki}/, 
      },
      { 
        script: :Ol_Onal, 
        name: "Ol Onal", 
        regex: /[\u{1E5D0}-\u{1E5FF}]/,
      },
      { 
        script: :Old_Hungarian, 
        name: "Old Hungarian", 
        regex: /\p{Old_Hungarian}/, 
      },
      { 
        script: :Old_Italic, 
        name: "Old Italic", 
        regex: /\p{Old_Italic}/, 
      },
      { 
        script: :Old_North_Arabian, 
        name: "Old North Arabian", 
        regex: /\p{Old_North_Arabian}/, 
      },
      { 
        script: :Old_Permic, 
        name: "Old Permic", 
        regex: /\p{Old_Permic}/, 
      },
      { 
        script: :Old_Persian, 
        name: "Old Persian", 
        regex: /\p{Old_Persian}/, 
      },
      { 
        script: :Old_Sogdian, 
        name: "Old Sogdian", 
        regex: /\p{Old_Sogdian}/, 
      },
      { 
        script: :Old_South_Arabian, 
        name: "Old South Arabian", 
        regex: /\p{Old_South_Arabian}/, 
      },
      { 
        script: :Old_Turkic, 
        name: "Old Turkic", 
        regex: /\p{Old_Turkic}/, 
      },
      { 
        script: :Old_Uyghur, 
        name: "Old Uyghur", 
        regex: /\p{Old_Uyghur}/, 
      },
      { 
        script: :Oriya, 
        name: "Oriya", 
        regex: /\p{Oriya}/, 
      },
      { 
        script: :Osage, 
        name: "Osage", 
        regex: /\p{Osage}/, 
      },
      { 
        script: :Osmanya, 
        name: "Osmanya", 
        regex: /\p{Osmanya}/, 
      },
      { 
        script: :Pahawh_Hmong, 
        name: "Pahawh Hmong", 
        regex: /\p{Pahawh_Hmong}/, 
      },
      { 
        script: :Palmyrene, 
        name: "Palmyrene", 
        regex: /\p{Palmyrene}/, 
      },
      { 
        script: :Pau_Cin_Hau, 
        name: "Pau Cin Hau", 
        regex: /\p{Pau_Cin_Hau}/, 
      },
      { 
        script: :Phags_Pa, 
        name: "Phags Pa", 
        regex: /\p{Phags_Pa}/, 
      },
      { 
        script: :Phoenician, 
        name: "Phoenician", 
        regex: /\p{Phoenician}/, 
      },
      { 
        script: :Psalter_Pahlavi, 
        name: "Psalter Pahlavi", 
        regex: /\p{Psalter_Pahlavi}/, 
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
        script: :Samaritan, 
        name: "Samaritan", 
        regex: /\p{Samaritan}/, 
      },
      { 
        script: :Saurashtra, 
        name: "Saurashtra", 
        regex: /\p{Saurashtra}/, 
      },
      { 
        script: :Sharada, 
        name: "Sharada", 
        regex: /\p{Sharada}|[\u{11B60}-\u{11B7F}]/, 
      },
      { 
        script: :Shavian, 
        name: "Shavian", 
        regex: /\p{Shavian}/, 
      },
      { 
        script: :Siddham, 
        name: "Siddham", 
        regex: /\p{Siddham}/, 
      },
      {
        script: :Sidetic,
        name: "Sidetic",
        regex: /[\u{10940}-\u{1095F}]/
      },
      { 
        script: :SignWriting, 
        name: "SignWriting", 
        regex: /\p{SignWriting}/, 
      },
      { 
        script: :Sinhala, 
        name: "Sinhala", 
        regex: /\p{Sinhala}/, 
      },
      { 
        script: :Sogdian, 
        name: "Sogdian", 
        regex: /\p{Sogdian}/, 
      },
      { 
        script: :Sora_Sompeng, 
        name: "Sora Sompeng", 
        regex: /\p{Sora_Sompeng}/, 
      },
      { 
        script: :Soyombo, 
        name: "Soyombo", 
        regex: /\p{Soyombo}/, 
      },
      { 
        script: :Sundanese, 
        name: "Sundanese", 
        regex: /\p{Sundanese}/, 
      },
      { 
        script: :Sunuwar, 
        name: "Sunuwar", 
        regex: /[\u{11BC0}-\u{11BFF}]/,
      },
      { 
        script: :Syloti_Nagri, 
        name: "Syloti Nagri", 
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
        name: "Tai Le", 
        regex: /\p{Tai_Le}/, 
      },
      { 
        script: :Tai_Tham, 
        name: "Tai Tham", 
        regex: /\p{Tai_Tham}/, 
      },
      { 
        script: :Tai_Viet, 
        name: "Tai Viet", 
        regex: /\p{Tai_Viet}/, 
      },
      { 
        script: :Tai_Yo, 
        name: "Tai Yo", 
        regex: /[\u{1E6C0}-\u{1E6FF}]/,
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
        script: :Tangsa, 
        name: "Tangsa", 
        regex: /\p{Tangsa}/, 
      },
      { 
        script: :Tangut, 
        name: "Tangut", 
        regex: /\p{Tangut}|[\u{18D80}-\u{18DFF}]/, 
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
        script: :Tirhuta, 
        name: "Tirhuta", 
        regex: /\p{Tirhuta}/, 
      },
      { 
        script: :Todhri, 
        name: "Todhri", 
        regex: /[\u{105C0}-\u{105FF}]/,
      },
      { 
        script: :Tolong_Siki, 
        name: "Tolong Siki", 
        regex: /[\u{11DB0}-\u{11DEF}]/,
      },
      { 
        script: :Toto, 
        name: "Toto", 
        regex: /\p{Toto}/, 
      },
      { 
        script: :Tulu_Tigalari, 
        name: "Tulu Tigalari", 
        regex: /[\u{11380}-\u{113FF}]/,
      },
      { 
        script: :Ugaritic, 
        name: "Ugaritic", 
        regex: /\p{Ugaritic}/, 
      },
      { 
        script: :Unknown, 
        name: "Unknown", 
        regex: /\p{Unknown}/, 
      },
      { 
        script: :Vai, 
        name: "Vai", 
        regex: /\p{Vai}/, 
      },
      { 
        script: :Vithkuqi, 
        name: "Vithkuqi", 
        regex: /\p{Vithkuqi}/, 
      },
      { 
        script: :Wancho, 
        name: "Wancho", 
        regex: /\p{Wancho}/, 
      },
      { 
        script: :Warang_Citi, 
        name: "Warang Citi", 
        regex: /\p{Warang_Citi}/, 
      },
      { 
        script: :Yezidi, 
        name: "Yezidi", 
        regex: /\p{Yezidi}/, 
      },
      { 
        script: :Yi, 
        name: "Yi", 
        regex: /\p{Yi}/, 
      },
      { 
        script: :Zanabazar_Square, 
        name: "Zanabazar Square", 
        regex: /\p{Zanabazar_Square}/, 
      },

      #Special characters
      {
        script: :New_Line,
        name: "New Line",
        regex: /\n/,
      },
      {
        script: :Tab,
        name: "Tab",
        regex: /\t/,
      },
      {
        script: :Whitespace,
        name: "Whitespace",
        regex: /\s/,
      },
      {
        script: :Digit,
        name: "Digit",
        regex: /\d/,
      },
      { 
        script: :Emoji, 
        name: "Emoji", 
        regex: /\p{Emoji_Presentation}/, 
      },
      {
        script: :Punctuation,
        name: "Punctuation",
        regex: /[[:punct:]]/,
      },
      { 
        script: :Common, 
        name: "Common", 
        regex: /\p{Common}|[\u{1CEC0}-\u{1CEFF}]|[\u{1CC00}-\u{1CEBF}]/, 
      },
    ]
  end
end
