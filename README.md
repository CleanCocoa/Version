# Version

Swift µ-library to represent (semantic) Versions in code, including parsing from String.

## Usage

```swift
import Version

let version = Version(2, 3, 4)
print(version) // => "2.3.4"

let update = Version(fromString: "2.3.5")
print(update.major) // => "2"
print(update.minor) // => "3"
print(update.patch) // => "5"
```

## Alternatives

- <https://github.com/mrackwitz/Version>: More features! It comes with conveniences to get versions from `NSBundle` and `UIDevice`; allows appending `prerelease` and `build` attributes to represent e.g. `"1.2.3-alpha.1+B001"`.

## License

 Copyright © 2020 Christian Tietze. All rights reserved. Distributed under the MIT License.
