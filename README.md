# Unicode Script Detector

## Detect all the characters of a string
```ruby
UnicodeScriptDetector.detect_characters "Hellб"

#Output:
[#<UnicodeScriptDetector::Character:0x00007768fefdead8 @char="H", @name="Latin", @script=:Latin>,
 #<UnicodeScriptDetector::Character:0x00007768fefdea10 @char="e", @name="Latin", @script=:Latin>,
 #<UnicodeScriptDetector::Character:0x00007768fefde970 @char="l", @name="Latin", @script=:Latin>,
 #<UnicodeScriptDetector::Character:0x00007768fefde8d0 @char="l", @name="Latin", @script=:Latin>,
 #<UnicodeScriptDetector::Character:0x00007768fefde830 @char="б", @name="Cyrillic", @script=:Cyrillic>]
```

## Detect if a script contains certain scripts
```ruby
# This will return true because it contains Latin and Cyrillic
UnicodeScriptDetector.contains? "Hellб🔥", [:Latin, :Cyrillic]
```

## Detect if a script contains only certain scripts
```ruby
# This will return false because it contains an Emoji as well
UnicodeScriptDetector.contains_only? "Hellб🔥", [:Latin, :Cyrillic]
```