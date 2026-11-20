/// What a product's binary was built from: the `<product>.metadata` written beside it after a
/// successful build (`.build/<mode>/`) or deploy (the deploy directory). `key=value` lines;
/// `Version` is the newest release tag at build time, `Commit` the built commit.
public struct ProductMetadata: Sendable, Equatable {
    public let values: [String: String]

    public var version: ObjectVersion? { values["Version"].flatMap(ReleaseTag.version(of:)) }
    public var commit: String? { values["Commit"].flatMap { $0.isEmpty ? nil : $0 } }
    public var dirty: Bool { values["Dirty"] == "true" }

    public init(values: [String: String]) {
        self.values = values
    }

    public init(parsing text: String) {
        var values: [String: String] = [:]
        for line in text.split(whereSeparator: \.isNewline) {
            guard let separator = line.firstIndex(of: "=") else { continue }
            values[String(line[..<separator])] = String(line[line.index(after: separator)...])
        }
        self.init(values: values)
    }
}
