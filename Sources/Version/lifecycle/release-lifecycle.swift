public enum Lifecycle: String, Codable, CaseIterable, Sendable {
    case active
    case maintenance
    case deprecated
    case archived

    public var label: String? {
        switch self {
        case .active:
            return nil
        case .maintenance:
            return "Maintenance"
        case .deprecated:
            return "Deprecated"
        case .archived:
            return "Archived"
        }
    }
}
