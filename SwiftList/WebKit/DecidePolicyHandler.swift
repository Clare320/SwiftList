//
//  DecidePolicyHandler.swift
//  SwiftList
//
//  Created by lingjie on 2021/4/10.
//

import Foundation
import WebKit

struct DecidePolicyHandler {
    static func checkNavigationAction(webView: WKWebView, action: WKNavigationAction) -> WKNavigationActionPolicy {
        let url = action.request.url
        guard let tempUrl = url else { return  .allow }
        guard tempUrl.scheme!.hasPrefix("sl") else {
            return .allow
        }
        
        self.handleUrl(webView, url: tempUrl)
        
        return .cancel
    }
    
    static func handleUrl(_ webView: WKWebView, url: URL) {
        guard let params = url.params else {
            return;
        }
        
        let paramStr = params["param"]
        guard let jsonStr = paramStr as? Substring else { return }
        var str = String(jsonStr)
        str = str.removingPercentEncoding!
    
        let alertController = UIAlertController(title: nil, message: str, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        let vc = UIApplication.shared.visibleControlelr
        vc?.present(alertController, animated: true, completion: nil)
        
        if (url.path == "/login" ) {
            let dict = try! JSONSerialization.jsonObject(with: str.data(using: .utf8)!, options: .allowFragments) as! [String: Any]
            let key = dict["key"] as! String
            
            DispatchQueue.main.async {
                webView.evaluateJavaScript("window.nativeAction('\(key)', 'login success')") { (result, error) in
                    print("js result--->\(error)")
                }
            }
        }
        
    }
    
}

extension URL {
    var params: [String: Any]? {
        guard let query = query else {
            return nil
        }
        
        guard query.count != 0 else {
            return nil
        }
        
        var dict: [String: Any] = [:]
        query.split(separator: "&").forEach {
            let array = $0.split(separator: "=")
            dict[String(array[0])] = array[1]
        }
        return dict
    }
}

extension UIApplication {
    var visibleControlelr: UIViewController? {
        let scene = connectedScenes.first
        guard let windowScene = scene as? UIWindowScene else { return nil }
        let window = windowScene.windows.first
        let vc = window?.rootViewController
        return vc
    }
}
