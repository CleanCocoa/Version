# Version

Swift µ-library to represent (semantic) Versions in code, including parsing from String.

## Usage

```swift
import Version

let version = Version(2, 3, 4)
print(version) // => "2.3.4"

let update = Version(fromString: "2.3.5")
print(update.major) // => "5"
print(update.minor) // => "5"
print(update.patch) // => "5"
```
## License

 Copyright © 2020 Christian Tietze. All rights reserved. Distributed under the MIT License.
