//
//  CheckViewController.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/4/27.
//

import UIKit

class CheckViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var a = 4
        checkInoutAttribute(a: &a)
        print("a:\(a)")
    }
    
    func checkInoutAttribute( a: inout Int) {
        a = 6
    }

}
