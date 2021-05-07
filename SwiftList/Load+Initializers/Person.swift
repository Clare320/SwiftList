//
//  Person.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/5/7.
//

import Foundation



class ACollection {
    static var array: [String] = ["ACollection--!"]
    var count: Int?
    class func register(msg: String) {
        array.append(msg)
    }
}

class Animal {
    var name: String
    var age: String
    
    init(name: String, age: String) {
        self.name = name
        self.age = age
    }
    
    class func load() {
        ACollection.register(msg: "Animal---!")
    }
}

class Dog: Animal {
    override class func load() {
        ACollection.register(msg: "Dog---!")
    }
}

class Cat: Animal {
    override class func load() {
        ACollection.register(msg: "Cat---!")
    }
}
