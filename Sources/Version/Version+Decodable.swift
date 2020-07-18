//  Copyright © 2020 Christian Tietze. All rights reserved. Distributed under the MIT License.

extension Version: Codable {
    public init(from decoder: Decoder) throws {
        let string = try decoder.singleValueContainer()
            .decode(String.self)
        try self.init(string: string)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.string)
    }
}
