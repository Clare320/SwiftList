//
//  GCDExample.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/4/27.
//

import Foundation
import UIKit

struct GCDExample {
    static func asyncExcute() {
        let queue = DispatchQueue(label: "test", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
        queue.async {
            print("---->1")
        }
        queue.async {
            print("----->2")
        }
        queue.async {
            print("----->3")
        }
    }
}


/**
 Module在Swift中什么作用，如何加载，以及OC库如何支持Module
 */
