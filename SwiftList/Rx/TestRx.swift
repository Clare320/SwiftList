//
//  TestRx.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/3/23.
//

import Foundation
import RxSwift

struct TestRx {
    func test() {
        let observable = Observable<Int>.create { (observer) -> Disposable in
            return Disposables.create {
                print("---disposable---")
            }
        }
    }
}

class Person {
    static var smallName: String = ""
}
