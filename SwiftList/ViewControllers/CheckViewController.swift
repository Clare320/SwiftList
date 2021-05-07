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
        
        print("load--->\(ACollection.array)")
    }
    
    func checkInoutAttribute( a: inout Int) {
        a = 6
    }
    
    // 此注解作用：返回的结果不使用，编译器不会提示警告
    @discardableResult
    func add<T: AdditiveArithmetic>(a: T, b: T) -> T {
        return a + b
    }

}
