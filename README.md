# PascalCaseKit

[![Languages](https://img.shields.io/badge/languages-Swift-orange.svg)]()
[![my twitter][social_twitter_image]][social_twitter_url]

[social_twitter_image]: https://img.shields.io/badge/Twitter-@brettunhandled-blue.svg
[social_twitter_url]: https://www.twitter.com/brettunhandled

Converts Swift enum rawValues to Pascal Case.

## Why

In Swift we commonly have an enum representing something that is defined in Pascal Case, such as Color and Image assets.
To do this we have to manually override the compiler's synthesized RawValue, because it outputs in Camel Case, which is a bummer.

**Example**

```
👎
enum Colors: String {
    case neonGreen = "NeonGreen"
}
```

With PascalCaseKit, the RawValue is automatically converted to PascalCase.

```
👍
enum Colors: String, PascalCaseRepresentable {
    case neonGreen
}

Colors.neonGreen.rawValue // NeonGreen
```

## Design Decisions

The conversion to Pascal Case should be completely transparent to the consumer. The desired String must be accessed through `rawValue` and not a new variable.

## Limitations

Due to the core design decision above, an enum case cannot choose to override the rawValue like you normally can. Any overrides are ignored.

```
enum Colors: String, PascalCaseRepresentable {
    case neonGreen = "blue"
}

Colors.neonGreen.rawValue // NeonGreen
🤷
```