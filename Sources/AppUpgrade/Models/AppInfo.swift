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
               areDictionariesEqual(lhs.customAttributes, rhs.customAttributes)
    }
    
    private static func areDictionariesEqual(_ dict1: [String: Any]?, _ dict2: [String: Any]?) -> Bool {
        guard let dict1 = dict1, let dict2 = dict2 else {
            return dict1 == nil && dict2 == nil
        }
        
        if dict1.count != dict2.count {
            return false
        }
        
        for (key, value1) in dict1 {
            guard let value2 = dict2[key] else {
                return false
            }
            
            if !areEqual(value1, value2) {
                return false
            }
        }
        
        return true
    }
    
    private static func areEqual(_ value1: Any, _ value2: Any) -> Bool {
        if let value1 = value1 as? Equatable, let value2 = value2 as? Equatable {
            return value1 == value2
        }
        
        return false
    }
}
