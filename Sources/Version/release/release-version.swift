public struct ReleaseVersion: Codable, Comparable, Sendable {
    public var version: ObjectVersion
    public var maturity: ReleaseMaturity
    public var lifecycle: Lifecycle

    public init(
        version: ObjectVersion,
        maturity: ReleaseMaturity = .stable,
        lifecycle: Lifecycle = .active
    ) {
        self.version = version
        self.maturity = maturity
        self.lifecycle = lifecycle
    }

    public func string(
        prefixStyle: VersionPrefixStyle = .short,
        includeMaturitySuffix: Bool = false
    ) -> String {
        let versionString = version.string(
            prefixStyle: prefixStyle,
            remote: false,
            prefixSpace: false
        )

        guard
            includeMaturitySuffix,
            let suffix = maturity.suffix
        else {
            return versionString
        }

        return "\(versionString)-\(suffix)"
    }

    public var maturityLabel: String? {
        maturity.label
    }

    public var lifecycleLabel: String? {
        lifecycle.label
    }

    public static func == (
        lhs: ReleaseVersion,
        rhs: ReleaseVersion
    ) -> Bool {
        lhs.version == rhs.version
            && lhs.maturity == rhs.maturity
    }

    public static func < (
        lhs: ReleaseVersion,
        rhs: ReleaseVersion
    ) -> Bool {
        if lhs.version != rhs.version {
            return lhs.version < rhs.version
        }

        return lhs.maturity.sortRank < rhs.maturity.sortRank
    }
}
