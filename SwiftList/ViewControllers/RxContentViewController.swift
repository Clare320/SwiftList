//
//  RxContentViewController.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/3/23.
//

import UIKit
import RxSwift

class RxContentViewController: BaseViewController {

    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bindControls()
    }
    
    // 如何让stepperLabel和stepper直接关联起来
    func bindControls() {
//        let _ = stepper.rx.value.subscribe { event in
//            switch event {
//            case .next(let value):
//                self.stepperLabel.text = "\(value)"
//            default :
//                break
//            }
//        }
        
//        let _ = stepper.rx.value.bind { (value) in
//            self.stepperLabel.text = "\(value)"
//        }
        
        let _ = stepper.rx.value.map({ "\($0)" }).bind(to: stepperLabel.rx.text)        
    }
}

/**
 Observable
 Observer
  Operator
 Schedule
 Disposable
 */
