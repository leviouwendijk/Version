/// Released versions written as git tags: bare semver (`1.2.3`). `v1.2.3` is read as well,
/// never written.
public enum ReleaseTag {
    /// The version a tag names, or nil when it is not a release tag.
    public static func version(of tag: String) -> ObjectVersion? {
        let text = tag.hasPrefix("v") ? String(tag.dropFirst()) : tag
        let parts = text.split(separator: ".", omittingEmptySubsequences: false)
        guard
            parts.count == 3,
            parts.allSatisfy(
                {
                    !$0.isEmpty 
                    && $0.allSatisfy(\.isASCII) 
                    && $0.allSatisfy(\.isNumber)
                }
            ),
            let major = Int(parts[0]),
            let minor = Int(parts[1]),
            let patch = Int(parts[2])
        else { 
            return nil 
        }
        return .init(major: major, minor: minor, patch: patch)
    }

    /// The tag written for a version.
    public static func name(for version: ObjectVersion) -> String {
        "\(version.major).\(version.minor).\(version.patch)"
    }

    /// The newest release among tag names; other tags are ignored.
    public static func latest(in tags: some Sequence<String>) -> ObjectVersion? {
        tags.compactMap(version(of:)).max()
    }

    /// Whether a version is tagged among tag names, bare or v-prefixed.
    public static func isTagged(_ version: ObjectVersion, in tags: some Sequence<String>) -> Bool {
        let name = name(for: version)
        return tags.contains { $0 == name || $0 == "v" + name }
    }
}

/// What to release: the next version at a level after the newest release, or an exact version.
public enum ReleaseTarget: Sendable, Equatable {
    case next(ObjectVersionLevel)
    case exact(ObjectVersion)

    /// `major`, `minor`, `patch`, or a version `x.y.z` (a leading v is accepted).
    public init?(_ text: String) {
        if let level = ObjectVersionLevel(rawValue: text) {
            self = .next(level)
        } else if let version = ReleaseTag.version(of: text) {
            self = .exact(version)
        } else {
            return nil
        }
    }

    /// The version this target names, given the newest release so far.
    public func version(after latest: ObjectVersion?) -> ObjectVersion {
        switch self {
        case .exact(let version):
            return version
        case .next(let level):
            var version = latest ?? .zero()
            version.increment(level)
            return version
        }
    }
}
