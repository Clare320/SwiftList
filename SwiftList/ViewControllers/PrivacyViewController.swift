//
//  PrivacyViewController.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/5/6.
//

import UIKit

class PrivacyViewController: BaseViewController {

    @IBOutlet weak var lightSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lightSlider.value = Float(UIScreen.main.brightness)
    }
    
    @IBAction func requestNotification(_ sender: Any) {
        let manager = NotificationManager.shared
        manager.requestAuthorization()
    }
    
    
    @IBAction func changeScreenLight(_ sender: UISlider) {
        UIScreen.main.brightness = CGFloat(sender.value)
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
