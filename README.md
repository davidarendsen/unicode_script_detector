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
UnicodeScriptDetector.detect_characters "Hel6б\t"

#Output:
[
  #<UnicodeScriptDetector::Character:0x00007768fefdead8 @char="H", @name="Latin", @script=:Latin>,
  #<UnicodeScriptDetector::Character:0x00007768fefdea10 @char="e", @name="Latin", @script=:Latin>,
  #<UnicodeScriptDetector::Character:0x00007768fefde970 @char="l", @name="Latin", @script=:Latin>,
  #<UnicodeScriptDetector::Character:0x00007768fefde8d0 @char="6", @name="Digit", @script=:Digit>,
  #<UnicodeScriptDetector::Character:0x00007768fefde830 @char="б", @name="Cyrillic", @script=:Cyrillic>,
  #<UnicodeScriptDetector::Character:0x00007768fefde830 @char="\t", @name="Tab", @script=:Tab>
]
```

## Detect if a script contains certain scripts
```ruby
# This will return true because it contains Latin and Cyrillic
UnicodeScriptDetector.contains? "Helб🔥", [:Latin, :Cyrillic]
```

## Detect if a script contains only certain scripts
```ruby
# This will return false because it contains an Emoji as well
UnicodeScriptDetector.contains_only? "Helб🔥", [:Latin, :Cyrillic]
```

## Detect all the characters of a string, grouped by the script
```ruby
UnicodeScriptDetector.script_groups("Hel6б how are you?").each do |group|
  puts "#{group.name}: #{group.text} (#{group.length} characters)"
end

#Output:

Latin: Hel (3 characters)
Digit: 6 (1 characters)
Cyrillic: б (1 characters)
Whitespace:   (1 characters)
Latin: how (3 characters)
Whitespace:   (1 characters)
Latin: are (3 characters)
Whitespace:   (1 characters)
Latin: you (3 characters)
Punctuation: ? (1 characters)
```

## Development
Start the console with `bin/console`.
Run the tests with `bin/test`.

## Contributing
You're welcome to contribute to this project. See https://github.com/davidarendsen/unicode_script_detector.

## License
This software is released under the [MIT license](LICENSE).
