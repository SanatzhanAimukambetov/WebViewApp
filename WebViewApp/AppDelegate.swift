//
//  AppDelegate.swift
//  WebViewApp
//
//  Created by Sanatzhan Aimukambetov on 09.12.2020.
//

import UIKit
import OneSignal
import UserNotificationsUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let notificationCenter = UNUserNotificationCenter.current()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let vc = ViewController()
        window?.rootViewController = vc
        
//        //Remove this method to stop OneSignal Debugging
//        OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)
//
//        //START OneSignal initialization code
//        let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false, kOSSettingsKeyInAppLaunchURL: false]
//
//        // Replace 'YOUR_ONESIGNAL_APP_ID' with your OneSignal App ID.
//        OneSignal.initWithLaunchOptions(launchOptions,
//          appId: "YOUR_ONESIGNAL_APP_ID",
//          handleNotificationAction: nil,
//          settings: onesignalInitSettings)
//
//        OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification;
//
//        // promptForPushNotifications will show the native iOS notification permission prompt.
//        // We recommend removing the following code and instead using an In-App Message to prompt for notification permission (See step 8)
//        OneSignal.promptForPushNotifications(userResponse: { accepted in
//          print("User accepted notifications: \(accepted)")
//        })
//        //END OneSignal initializataion code
        return true
    }
}

