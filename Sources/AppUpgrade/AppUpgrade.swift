import UIKit

public class AppUpgrade {
    private let appUpgradeApi: AppUpgradeApi
    private let appUpgradeAlert: AppUpgradeAlert
    
    init(
        appUpgradeApi: AppUpgradeApi,
        appUpgradeAlert: AppUpgradeAlert
    ) {
        self.appUpgradeApi = appUpgradeApi
        self.appUpgradeAlert = appUpgradeAlert
    }
    
    public init(){
        self.appUpgradeApi = AppUpgradeApi()
        self.appUpgradeAlert = AppUpgradeAlert()
    }
        
    public func checkForUpdates(xApiKey: String, appInfo: AppInfo, alertDialogConfig: AlertDialogConfig? = nil) {
        debugPrint("App Upgrade: Check for updates.")
        appUpgradeApi.checkVersion(xApiKey: xApiKey, appInfo: appInfo) { response in
            if let response = response {
                if (response.found) {
                    debugPrint("App Upgrade: Version found, update required.")
                    if (response.forceUpgrade) {
                        debugPrint("App Upgrade: Force upgrade required.")
                        DispatchQueue.main.async {
                            self.appUpgradeAlert.showForceUpgradePopup(message: response.message, appId: appInfo.appId, alertDialogConfig: alertDialogConfig)
                        }
                    } else {
                        debugPrint("App Upgrade: Force upgrade not required but update is recommended.")
                        DispatchQueue.main.async {
                            self.appUpgradeAlert.showUpgradePopup(message: response.message, appId: appInfo.appId, alertDialogConfig: alertDialogConfig)
                        }
                    }
                } else {
                    debugPrint("App Upgrade: Version not found, update not required.")
                }
            }
        }
    }
}
