//
//  UIApplication+TopViewController.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/5/6.
//

import Foundation
import UIKit

extension UIApplication {
    var rootViewController: UIViewController? {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            let windowScene = scene as? UIWindowScene
            return windowScene?.windows.first?.rootViewController
        } else {
            return UIApplication.shared.keyWindow?.rootViewController
        }
    }
}

