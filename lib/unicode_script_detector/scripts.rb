module UnicodeScriptDetector
  class Scripts
    LIST = [
      { 
        script: :Latin, 
        name: "Latin", 
        regex: /\p{Latin}/, 
        description: "Western languages (e.g., English, Spanish, French)."
      },
      { 
        script: :Cyrillic, 
        name: "Cyrillic", 
        regex: /\p{Cyrillic}/, 
        description: "Eastern European languages (e.g., Russian, Bulgarian, Serbian)."
      },
      { 
        script: :Hiragana, 
        name: "Hiragana", 
        regex: /\p{Hiragana}/, 
        description: "Japanese."
      },
      { 
        script: :Emoji, 
        name: "Emoji", 
        regex: /\p{Emoji}/, 
        description: "Modern pictograms."
      },
    ]
  end
end