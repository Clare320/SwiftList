//
//  WebViewController.swift
//  SwiftList
//
//  Created by lingjie on 2021/4/8.
//

import UIKit
import WebKit
import JavaScriptCore

class WebViewController: BaseViewController {

    @IBOutlet weak var webView: WKWebView!
    
    private let scriptHandler = LJScriptMessageHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUserContentController()
        configureWebView()
        
        let url = URL(string: "http:192.168.1.102:3000/")
        let request = URLRequest(url: url!)
        self.webView.load(request)
    }
    
    
    func setUserContentController() {
        let userContentController = webView.configuration.userContentController
        // post message
        userContentController.add(scriptHandler, name: "test")
//        userContentController.add(scriptHandler, name: "finish")
        
        // inject script
        let scriptStr = """
            (() => {
                console.log('inject script');
            })();
        """
        let script = WKUserScript(source: scriptStr, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        userContentController.addUserScript(script)
    }
    
    func configureWebView() {
        webView.navigationDelegate = self
        
        
    }
    
    func configureJSCoreBlock() {
        // 获取当前WebView的JSContext
//        JSContext
    }
    
    
    deinit {
        webView.configuration.userContentController.removeAllScriptMessageHandlers()
    }

}

extension WebViewController {
    func printName(name: String) {
        print("name: \(name)")
    }
    
    func test() {
        
    }
}

// WKNavigationDelegate

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("\(#line)--\(#function)")
    }
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            // URL
        let result = DecidePolicyHandler.checkNavigationAction(webView: webView, action: navigationAction)
        decisionHandler(result)
    }
}

