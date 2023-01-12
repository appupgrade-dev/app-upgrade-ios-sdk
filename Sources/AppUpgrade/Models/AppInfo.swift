public struct AppInfo: Equatable {
    let appId: String
    let appName: String
    let appVersion: String
    let platform: String
    let environment: String
    
    public init(
        appId: String,
        appName: String,
        appVersion: String,
        platform: String,
        environment: String
    ) {
        self.appId = appId
        self.appName = appName
        self.appVersion = appVersion
        self.platform = platform
        self.environment = environment
    }
}

