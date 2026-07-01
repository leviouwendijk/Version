public struct ReleaseVersion: Codable, Sendable {
    public var version: ObjectVersion
    public var maturity: ReleaseMaturity

    public init(
        version: ObjectVersion,
        maturity: ReleaseMaturity = .stable
    ) {
        self.version = version
        self.maturity = maturity
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
}
