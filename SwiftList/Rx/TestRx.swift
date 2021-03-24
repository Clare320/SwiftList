//
//  TestRx.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/3/23.
//

import Foundation

struct TestRx {
    let num: Int
    var age: Int
    var borth: Int = 2021
    
    var score: Int {
        set {
            age = newValue
        }
        get {
            return 12
        }
    }
    
    func testClosure() -> String {
        "---->"
    }
    
    func sum(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func test() -> Int {
        
        let sumRet = sum(a: 3, b: 4)
        let result = sumRet - 1
        return result
    }
}

class Person {
    static var smallName: String = ""
}
