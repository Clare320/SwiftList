//
//  CustomLayerView.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/3/25.
//

import UIKit

class CustomLayerView: UIView {
    
//    var circleShapeLayer: CAShapeLayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        self.backgroundColor = .cyan
        
        let cube = CGRect(x: 20, y: 20, width: 40, height: 40)

        let circle = UIBezierPath(roundedRect: cube, cornerRadius: 20)
        let shape1 = CAShapeLayer()
        shape1.path = circle.cgPath
        shape1.lineWidth = 5
        shape1.strokeColor = UIColor.white.cgColor
        shape1.fillColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
        layer.addSublayer(shape1)
       
        let processCircle = UIBezierPath(arcCenter: CGPoint(x: 20, y: 20), radius: 20, startAngle: CGFloat.pi * -0.5, endAngle: CGFloat.pi * 0, clockwise: true)
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.frame = CGRect(x: 20, y: 20, width: 40, height: 40)
        shapeLayer2.path = processCircle.cgPath
        shapeLayer2.lineWidth = 5
        shapeLayer2.strokeColor = UIColor.green.cgColor
        shapeLayer2.fillColor = UIColor.clear.cgColor
        layer.addSublayer(shapeLayer2)
        
//        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
//        animation.keyTimes = [0, 0.5, 1]
//        animation.values = [0, Double.pi, Double.pi * 2]
//        animation.duration = 0.6
//        animation.repeatCount = HUGE
//        animation.isRemovedOnCompletion = false
//        shapeLayer2.add(animation, forKey: "animation")
        
        let basicAnimation = CABasicAnimation(keyPath: "transform.rotation")
        basicAnimation.fromValue = 0
        basicAnimation.toValue = Double.pi * 2
        basicAnimation.repeatCount = Float.infinity
        basicAnimation.duration = 0.6
        shapeLayer2.add(basicAnimation, forKey: "animation")
        
    }
    
}

/**
 1. 控制划圈的进度
 
 */
