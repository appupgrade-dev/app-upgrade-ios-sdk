public struct AppUpgradeResponse: Decodable {
    public let found: Bool
    public let forceUpgrade: Bool
    public let message: String
    
    private enum CodingKeys: String, CodingKey {
        case found, forceUpgrade, message
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        found = try container.decode(Bool.self, forKey: .found)
        forceUpgrade = try container.decodeIfPresent(Bool.self, forKey: .forceUpgrade) ?? false
        message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""
    }
}
