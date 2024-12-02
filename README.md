# Unicode Script Detector

Detect all Unicode scripts in a text.

## Installation

Add this line to your application's Gemfile:
```ruby
gem "unicode_script_detector"
```

Or install it globally:

```bash
$ gem install unicode_script_detector
```

## Detect all the characters of a string
```ruby
UnicodeScriptDetector.detect_characters "Hel6б"

#Output:
[#<UnicodeScriptDetector::Character:0x00007768fefdead8 @char="H", @name="Latin", @script=:Latin>,
 #<UnicodeScriptDetector::Character:0x00007768fefdea10 @char="e", @name="Latin", @script=:Latin>,
 #<UnicodeScriptDetector::Character:0x00007768fefde970 @char="l", @name="Latin", @script=:Latin>,
 #<UnicodeScriptDetector::Character:0x00007768fefde8d0 @char="6", @name="Digit", @script=:Digit>,
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

## Development
Start the console with `bin/console`.
Run the tests with `bin/test`.

## Contributing
You're welcome to contribute to this project. See https://github.com/davidarendsen/unicode_script_detector.

## License
This software is released under the [MIT license](LICENSE).