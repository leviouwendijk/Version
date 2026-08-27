import Arguments

public enum ObjectVersionLevel:
    String,
    RawRepresentable,
    Codable,
    CaseIterable,
    Sendable,
    ArgumentValue
{
    case major
    case minor
    case patch
}
