public struct AppInfo: Equatable {
    let appId: String
    let appName: String
    let appVersion: String
    let platform: String
    let environment: String
    let appLanguage: String?
    let customAttributes: [String: Any]?
    
    public init(
        appId: String,
        appName: String,
        appVersion: String,
        platform: String,
        environment: String,
        appLanguage: String? = nil,
        customAttributes: [String: Any]? = nil
    ) {
        self.appId = appId
        self.appName = appName
        self.appVersion = appVersion
        self.platform = platform
        self.environment = environment
        self.appLanguage = appLanguage
        self.customAttributes = customAttributes
    }

    public static func ==(lhs: AppInfo, rhs: AppInfo) -> Bool {
        return lhs.appId == rhs.appId &&
               lhs.appName == rhs.appName &&
               lhs.appVersion == rhs.appVersion &&
               lhs.platform == rhs.platform &&
               lhs.environment == rhs.environment &&
               lhs.appLanguage == rhs.appLanguage &&
               lhs.customAttributes == rhs.customAttributes
    }
}

