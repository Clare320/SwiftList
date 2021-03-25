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
        backgroundColor = .cyan
        
        let cube = CGRect(x: 20, y: 20, width: 40, height: 40)

        let circle = UIBezierPath(roundedRect: cube, cornerRadius: 20)
        UIColor.red.set()
        circle.stroke()
        UIColor.white.set()
        circle.fill()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circle.cgPath
        
        layer.addSublayer(shapeLayer)
        
    }
    
}
