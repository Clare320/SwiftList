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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var showHUDButton: UIButton!
    @IBOutlet weak var customHudButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bindControls()
        setButtonEvents()
       
        _ = LoadingHUD(frame: .zero, configuring: HudConfiguring())
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
        
        stepper.rx.value.map({ "\($0)" })
            .bind(to: stepperLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    // 响应按钮事件
    func setButtonEvents() {
        
//        showButton.rx.tap.subscribe { [self] (event) in
//            if activityIndicator.isAnimating {
//                activityIndicator.stopAnimating()
//            } else {
//                activityIndicator.startAnimating()
//            }
//
//        }.disposed(by: disposeBag)
        
        let ret = showButton.rx.tap
            .map {
                !self.activityIndicator.isAnimating
            }
        // 按钮事件与按钮标题关联在一起
        ret.map {
            $0 ? "stop" : "start"
        }.bind(to: showButton.rx.title())
        .disposed(by: disposeBag)
        ret.bind(to: activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        //
        
        showHUDButton.rx.tap.subscribe({ _ in
            LoadingHUD.hud.show()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                LoadingHUD.hud.dismiss()
            }
        }).disposed(by: disposeBag)
        
        customHudButton.rx.tap.subscribe { (_) in
            let configuration = HudConfiguring(showMask: true, color: .blue, contentViewBackgroundColor: .white, offsetY: 0, isCoverNavigationBar: false)
            let hud = LoadingHUD(frame: .zero, configuring: configuration)
            hud.show()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                hud.dismiss()
            }
        }.disposed(by: disposeBag)
    }
}

/**
 Observable
 Observer
  Operator
 Schedule
 Disposable
 
 ControlEvent
ControlProperty
 */

// Observable
/**
 Single
 Completed
 Maybe
 Singal
 Driver : 不会发出error，在主线程，共享附加作用（没弄懂）
 */

// Observer都有那些
/**
 AnyObserver
 Binder
 */
// Observable && Observer
/**
 AsyncSubject  在源Observable发送完成事件后发送最后一个元素
 PublishSubject 发送订阅以后的元素
 ReplaySubject 不管何时订阅，对观察者发送全部元素
 BehaviorSubject 对其订阅时都会将最新的一个元素发出来，
 ControlProperty
 */

// flatMapLatest
