//
//  NotificationManager.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/5/6.
//

import Foundation
import UIKit
import UserNotifications


struct NotificationManager {
    static let shared = NotificationManager()
    
    func requestAuthorization() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            if let error = error {
                print("un error: \(error)")
            }
            
            //NOTE: -- 这里是在Background Thread来处理的
            if !granted {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Prompt", message: "send notification", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    alert.addAction(UIAlertAction(title: "Go", style: .default, handler: { action in
                        goToAppSetting()
                    }))
                    if let rootVC = UIApplication.shared.rootViewController {
                        rootVC.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    private func goToAppSetting() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
    }
}

/**
 现在跳到设置页方式？
 1. 使用openSettingURLString来处理，跳转到当前应用的设置页，iOS8.0后可用
 2. 
 */

/**
 Xcode安装app时提示
 */
