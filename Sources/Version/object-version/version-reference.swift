public enum VersionReference: String, RawRepresentable, Codable, CaseIterable, Sendable {
    case compiled // for compiled.pkl
    case release // for build-object.pkl
}
