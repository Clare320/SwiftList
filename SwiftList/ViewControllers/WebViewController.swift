//
//  WebViewController.swift
//  SwiftList
//
//  Created by lingjie on 2021/4/8.
//

import UIKit
import WebKit

class WebViewController: BaseViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = URL(string: "http:192.168.1.102:3000/")
        let request = URLRequest(url: url!)
        self.webView.load(request)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
