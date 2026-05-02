# AGENTS.md — Unicode Script Detector

Guidance for AI assistants working on this Ruby gem.

## Project Overview

A Ruby gem that detects Unicode scripts per character in text, with a focus on **homograph spoof detection** — identifying visually confusable characters from different scripts (e.g., Cyrillic `Р` that looks like Latin `P`).

## Architecture

```
lib/unicode_script_detector/
├── character.rb        # Character object with script/name
├── confusables.rb      # MAPPING of lookalike chars (auto-generated)
├── detector.rb         # Core script detection engine
├── script_group.rb     # Groups consecutive same-script chars
├── scripts.rb          # Regex-based Unicode script definitions
├── spoof_detector.rb   # Confusable/invisible/mixed-script detection
└── version.rb          # Single source of truth for version
```

Entry point: `lib/unicode_script_detector.rb` — delegates to `Detector` and `SpoofDetector`.

## Key Conventions

- **Confusables are auto-generated.** Never hand-edit `confusables.rb` directly. Use:
  ```bash
  rake update_confusables   # Regenerate from Unicode confusables.txt
  rake validate_confusables # Check against latest Unicode data
  ```
- **Version bump** goes in `lib/unicode_script_detector/version.rb` only.
- **Scripts** are defined by regex ranges in `scripts.rb`.
- **Safe script combinations** (e.g., Latin + Han) are whitelisted in `confusables.rb` (`SAFE_SCRIPT_COMBINATIONS`).

## Testing

Uses **Minitest** with `ActiveSupport::TestCase`.

```bash
bin/test          # Run tests
rake              # Default: run tests
rake test         # Same
```

Test files: `test/*_test.rb`

## Dependencies

- `zeitwerk` (~> 2.6) — autoloading
- `activesupport` (>= 7.2.2, < 9.0) — for testing + utilities
- Ruby >= 3.2.0

## Active Work Context

| PR | Branch | Focus |
|--|--|--|
| #5 | `feature/homograph-spoof-detection` | Homograph spoof detection (confusables, invisible chars, mixed scripts) |

**Current local branch:** `pr-5` (tracks `origin/feature/homograph-spoof-detection`)

## When Making Changes

1. Run `bin/test` before committing.
2. If modifying confusables logic, run `rake validate_confusables`.
3. Bump `VERSION` if releasing.
4. Keep the module-level API in `unicode_script_detector.rb` in sync with new features.
