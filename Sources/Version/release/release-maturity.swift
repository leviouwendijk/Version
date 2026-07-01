public enum ReleaseMaturity: String, Codable, CaseIterable, Sendable {
    case experimental
    case alpha
    case beta
    case release_candidate
    case stable

    public var label: String? {
        switch self {
        case .experimental:
            return "Experimental"
        case .alpha:
            return "Alpha"
        case .beta:
            return "Beta"
        case .release_candidate:
            return "RC"
        case .stable:
            return nil
        }
    }

    public var suffix: String? {
        switch self {
        case .experimental:
            return "experimental"
        case .alpha:
            return "alpha"
        case .beta:
            return "beta"
        case .release_candidate:
            return "rc"
        case .stable:
            return nil
        }
    }
}
