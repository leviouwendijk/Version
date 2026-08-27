import Arguments

public enum VersionReference:
    String,
    RawRepresentable,
    Codable,
    CaseIterable,
    Sendable,
    ArgumentValue
{
    case compiled
    case release
}
