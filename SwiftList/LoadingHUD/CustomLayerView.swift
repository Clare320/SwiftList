//
//  CustomLayerView.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/3/25.
//

import UIKit

class CustomLayerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        
        let cube = CGRect(x: 20, y: 20, width: 40, height: 40)

        let circle = UIBezierPath(roundedRect: cube, cornerRadius: 20)
        circle.lineWidth = 10
        UIColor.white.set()
        circle.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circle.cgPath
        
        layer.addSublayer(shapeLayer)
       
        let processCircle = UIBezierPath(arcCenter: CGPoint(x: 40, y: 40), radius: 20, startAngle: CGFloat.pi * -0.5, endAngle: CGFloat.pi * 0, clockwise: true)
        processCircle.lineWidth = 10
        UIColor.green.set()
        processCircle.stroke()
        UIColor.white.set()
        processCircle.fill()
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.path = processCircle.cgPath
        
        layer.addSublayer(shapeLayer2)
        
    }
    
}

/**
 1. 控制划圈的进度
 
 */
