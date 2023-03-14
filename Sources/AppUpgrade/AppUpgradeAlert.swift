import UIKit

public struct AppUpgradeAlert {
    public func showForceUpgradePopup(message: String, appId: String, alertDialogConfig: AlertDialogConfig?) {
        debugPrint("App Upgrade: Show force upgrade popup.")
        
        let alert = UIAlertController(
            title: alertDialogConfig != nil ? alertDialogConfig?.title : "Please update",
            message: message,
            preferredStyle: .alert
        )
        
        let updateButtonTitle = alertDialogConfig != nil ? alertDialogConfig?.updateButtonTitle : "Update Now"
        
        let updateButton = UIAlertAction(title: updateButtonTitle, style: .default, handler: { (action) -> Void in
            onUserUpdate(appId: appId)
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true)                                                                               
        })

        alert.addAction(updateButton)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true)
    }
    
    public func showUpgradePopup(message: String, appId: String, alertDialogConfig: AlertDialogConfig?) {
        debugPrint("App Upgrade: Show upgrade popup.")
        
        let alert = UIAlertController(
            title: alertDialogConfig != nil ? alertDialogConfig?.title : "Please update",
            message: message,
            preferredStyle: .alert
        )
        
        let updateButtonTitle = alertDialogConfig != nil ? alertDialogConfig?.updateButtonTitle : "Update Now"
        let laterButtonTitle = alertDialogConfig != nil ? alertDialogConfig?.laterButtonTitle : "Later"

        let updateButton = UIAlertAction(title: updateButtonTitle, style: .default, handler: { (action) -> Void in
            onUserUpdate(appId: appId)
        })

        let laterButton = UIAlertAction(title: laterButtonTitle, style: .cancel) { (action) -> Void in
            onUserLater()
        }
        
        alert.addAction(updateButton)
        alert.addAction(laterButton)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true)
    }
    
    private func onUserUpdate(appId: String) {
        debugPrint("App Upgrade: Update Now.")
        
        openAppStore(appId: appId)
    }
    
    private func onUserLater() {
        debugPrint("App Upgrade: Later.")
    }
    
    private func openAppStore(appId: String) {
        if let url = URL(string: "https://apps.apple.com/app/id\(appId)"),
            UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:]) { (opened) in
                if(opened){
                    debugPrint("App Upgrade: Opened App Store.")
                }
            }
        } else {
            debugPrint("App Upgrade: Can't Open App Store on Simulator.")
        }
    }
}
