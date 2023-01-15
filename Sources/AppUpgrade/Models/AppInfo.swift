public struct AppInfo: Equatable {
    let appId: String
    let appName: String
    let appVersion: String
    let platform: String
    let environment: String
    let appLanguage: String?
    
    public init(
        appId: String,
        appName: String,
        appVersion: String,
        platform: String,
        environment: String,
        appLanguage: String? = nil
    ) {
        self.appId = appId
        self.appName = appName
        self.appVersion = appVersion
        self.platform = platform
        self.environment = environment
        self.appLanguage = appLanguage
    }
}

