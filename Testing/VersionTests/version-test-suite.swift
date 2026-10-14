import Testing

enum VersionTestSuite {
    static let suite = TestSuite("version", title: "Version domain and Pkl regressions") {
        versionRegressionSuite
    }
}
