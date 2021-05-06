//
//  File.swift
//  SwiftList
//
//  Created by lingjie on 2021/4/9.
//

import Foundation
import WebKit

@objc class LJScriptMessageHandler: NSObject, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("message name: \(message.name) \n, body: \(message.body)")
    }
}
