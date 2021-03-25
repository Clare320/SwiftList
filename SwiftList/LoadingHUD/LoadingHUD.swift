//
//  LoadingHUD.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/3/25.
//

import UIKit

struct HudConfiguring {
    var showMask: Bool = true
    var color: UIColor = .red
    var contentViewBackgroundColor: UIColor = .white
    /// 默认居中显示，> 0 向下，<0向上
    var offsetY: CGFloat = 0
    var isCoverNavigationBar: Bool = true
}

public final class LoadingHUD: UIView {
    static let hud = LoadingHUD(frame: .zero)
    
    // backgroundView
    private lazy var backgroundView: UIView = {
        let maskView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        maskView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        return maskView
    }()
    
    // contentView
    private lazy var contentView: UIView = {
        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = .white
        contentView.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        return contentView
    }()
    
    // activityIndicator
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .large)
        activity.color = .red
        activity.hidesWhenStopped = false
        activity.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        return activity
    }()
    
    private var hudConfiguring: HudConfiguring
    
    // 这种convenience构造方法如何避免调用两次setupLoadingHUD
    // 就是即支持init(frame:)又支持init(frame:,configuring:)
    // convenience构造方法不要滥用，
    init(frame: CGRect, configuring: HudConfiguring) {
        hudConfiguring = configuring;
        super.init(frame: frame)
        setupLoadingHUD()
    }
    
    override init(frame: CGRect) {
        hudConfiguring = HudConfiguring()
        super.init(frame: frame)
        
        setupLoadingHUD()
    }
    
    required init?(coder: NSCoder) {
        hudConfiguring = HudConfiguring()
        super.init(coder: coder)
        
        setupLoadingHUD()
    }
    
    private func setupLoadingHUD() {
        let bounds = UIScreen.main.bounds
        
        if !hudConfiguring.isCoverNavigationBar {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let statusBarHeight = windowScene?.statusBarManager?.statusBarFrame.height ?? 20
            let navigationController = (windowScene?.windows.first?.rootViewController)! as! UINavigationController
            let navigationBarHeight = navigationController.navigationBar.frame.height
            let placeHeight = statusBarHeight + navigationBarHeight
            
//            backgroundView.frame = CGRect(x: 0, y: placeHeight, width: bounds.width, height: bounds.height - placeHeight)
            self.frame = CGRect(x: 0, y: placeHeight, width: bounds.width, height: bounds.height - placeHeight)
        } else {
            self.frame = bounds
        }
        
        if hudConfiguring.showMask {
            self.addSubview(backgroundView)
        }
       
        self.addSubview(contentView)
        contentView.backgroundColor = hudConfiguring.contentViewBackgroundColor
        
        self.addSubview(activityIndicator)
        activityIndicator.color = hudConfiguring.color
        
    }
    
    public func show() {
        let scene = UIApplication.shared.connectedScenes.first
        guard let sceneDelegate = scene?.delegate as? SceneDelegate else {
            return
        }
        activityIndicator.startAnimating()
        sceneDelegate.window?.addSubview(self)
    }
    
    public func dismiss() {
        self.removeFromSuperview()
        activityIndicator.stopAnimating()
    }
}

// 如何监听到触发导航返回按钮
