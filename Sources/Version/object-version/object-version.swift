import Schema

public typealias BuildVersion = ObjectVersion

public struct ObjectVersion: Codable, Comparable, Sendable, Hashable {
    public var major: Int
    public var minor: Int
    public var patch: Int

    public init(major: Int, minor: Int, patch: Int) {
        self.major = major
        self.minor = minor
        self.patch = patch
    }

    public mutating func increment(_ type: ObjectVersionLevel) {
        switch type {
        case .major:
            major += 1
            minor = 0
            patch = 0
        case .minor:
            minor += 1
            patch = 0
        case .patch:
            patch += 1
        }
    }

    public static func < (lhs: ObjectVersion, rhs: ObjectVersion) -> Bool {
        if lhs.major != rhs.major { return lhs.major < rhs.major }
        if lhs.minor != rhs.minor { return lhs.minor < rhs.minor }
        return lhs.patch < rhs.patch
    }
}

extension ObjectVersion {
    public static func zero() -> ObjectVersion {
        return Self.init(
            major: 0,
            minor: 0,
            patch: 0
        )
    }

    public static func new() -> ObjectVersion {
        return Self.init(
            major: 0,
            minor: 1,
            patch: 0
        )
    }
}

extension ObjectVersion: JSONSchemaProviding {
    public static var jsonschema: JSONSchema {
        .object(
            properties: [
                .init(
                    name: "major",
                    schema: Int.jsonschema,
                    required: true
                ),
                .init(
                    name: "minor",
                    schema: Int.jsonschema,
                    required: true
                ),
                .init(
                    name: "patch",
                    schema: Int.jsonschema,
                    required: true
                ),
            ],
            additionalProperties: .disallowed
        )
    }
}
