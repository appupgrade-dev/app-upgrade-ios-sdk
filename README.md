# App Upgrade: iOS SDK

Official iOS SDK for [App Upgrade](https://appupgrade.dev)

App Upgrade is a service let your users know when to upgrade your apps or force them to upgrade the app.

[![Twitter](https://img.shields.io/twitter/follow/app_upgrade?style=social)](https://twitter.com/app_upgrade)
[![YouTube](https://img.shields.io/youtube/channel/subscribers/UC0ZVJPYHFVuMwEsro4VZKXw?style=social)](https://www.youtube.com/channel/UC0ZVJPYHFVuMwEsro4VZKXw)

Many times we need to force upgrade mobile apps on users' mobile. Having faced this issue multiple times decided to find a better way to tackle this problem. After doing some research on how people are doing this there are so many custom solutions or checking with the play store or AppStore API if there is a new version available. Although this works if we just want to nudge users that there is a new version available. It doesn't solve the problem where we want to make a decision.. whether it's a soft graceful update or we want to force update. So here is this product that will make developers' life easy. We can set custom messages.. see the versions in beautify dashboard, and many exciting features in the roadmap ahead.

This SDK communicate with App Upgrade and check the version with store version information in App Upgrade. Based on response it will:
- If app needs force update will show a non-dismissable popup for update. On click it will launch app in app store for user to update.
- If app needs to be updated but not a force update, it will show a dismissable popup.
- If no action is required it won't do anything.

## Installation
Install via Swift Package Manager (SPM)

1. File > Add Packages > Add Package Dependency
2. Add `https://github.com/appupgrade-dev/app-upgrade-ios-sdk.git`
3. Select "Up to Next Major" with 1.0.0

## How to use it.
1. Register on App Upgrade and follow the instructions to create project and get the x-api-key.
2. Use the SDK.

#### Import Library
```
import AppUpgrade
```

Usages:
```
let appUpgrade: AppUpgrade = AppUpgrade()
            
let xApiKey = "ZWY0ZDhjYjgtYThmMC00NTg5LWI0NmUtMjM5OWZkNjkzMzQ5";

let appInfo = AppInfo(
    appId: "1234",
    appName: "Wallpaper app",
    appVersion: "1.0.0",
    platform: "ios",
    environment: "production",
    appLanguage: "es" //Optional
)

// Optional
let alertDialogConfig = AlertDialogConfig(
    title: "Update Require", // Optional
    updateButtonTitle: "Update Now", // Optional
    laterButtonTitle: "Later" // Optional
)

appUpgrade.checkForUpdates(xApiKey: xApiKey, appInfo: appInfo, alertDialogConfig: alertDialogConfig)
```

### Note:
1. For opening the app store the app should be live.
2. It might not be able to open the app store in simulator. You can try it in physical device.
3. You can find a sample app from here [app-upgrade-ios-demo-app](https://github.com/appupgrade-dev/app-upgrade-ios-swift-demo-app)
4. Read detailed blog on how to integrate from here [How to upgrade/force upgrade iOS Swift app](https://appupgrade.dev/blog/how-to-force-upgrade-ios-swift-app)

## Screenshot
 ![forceupgrade_ios_swift](https://raw.githubusercontent.com/appupgrade-dev/app-upgrade-assets/main/images/forceupgrade_ios_swift.png)

## App Upgrade Docs
For more information visit [App Upgrade](https://appupgrade.dev)

### Changelog

Please see [CHANGELOG](CHANGELOG.md) for more information what has changed recently.

### Contributing

Please see [CONTRIBUTING](CONTRIBUTING.md) and [CODE OF CONDUCT](CODE_OF_CONDUCT.md) for details.

### License

The MIT License (MIT). Please see [License File](LICENSE) for more information.

## Need help?

If you're looking for help, try our [Documentation](https://appupgrade.dev/docs/) or our [FAQ](https://appupgrade.dev/docs/app-upgrade-faq).
If you need support please write to us at support@appupgrade.dev

### Happy Coding!!!

