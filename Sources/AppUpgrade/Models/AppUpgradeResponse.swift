public struct AppUpgradeResponse: Decodable {
    public let found: Bool
    public let forceUpgrade: Bool
    public let message: String
}
