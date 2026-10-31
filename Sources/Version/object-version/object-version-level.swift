import Arguments
import Schema

public enum ObjectVersionLevel:
    String,
    RawRepresentable,
    Codable,
    CaseIterable,
    Sendable,
    ArgumentValue,
    JSONSchemaProviding
{
    case major
    case minor
    case patch

    public static var jsonschema: JSONSchema {
        .string(
            cases: allCases.map(\.rawValue)
        )
    }
}
