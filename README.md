# Unicode Script Detector

## How to use
```ruby
UnicodeScriptDetector.detect_characters "Hello"

#Output:
[#<UnicodeScriptDetector::Character:0x00007768fefdead8 @char="H", @name="Latin", @script=:Latin>,
 #<UnicodeScriptDetector::Character:0x00007768fefdea10 @char="e", @name="Latin", @script=:Latin>,
 #<UnicodeScriptDetector::Character:0x00007768fefde970 @char="l", @name="Latin", @script=:Latin>,
 #<UnicodeScriptDetector::Character:0x00007768fefde8d0 @char="l", @name="Latin", @script=:Latin>,
 #<UnicodeScriptDetector::Character:0x00007768fefde830 @char="o", @name="Latin", @script=:Latin>]
```