extension ObjectVersion {
    public static func default_version(for reference: VersionReference = .release) -> ObjectVersion {
        switch reference {
        case .release:
            return .init(
                major: 0,
                minor: 1,
                patch: 0
            )
        case .compiled:
            return .init(
                major: 0,
                minor: 0,
                patch: 0
            )
        }
    }
}
