//
//  RxRequest.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/3/22.
//

import Foundation
import RxSwift
import Moya

struct RxRequest {
    // 这里Observable可换成Signal
    static func request<T>(service: MyService, type: T.Type) -> Observable<T>  where T : Decodable {
        return Observable.create { (observer) -> Disposable in
            let provider = MoyaProvider<MyService>()
            provider.request(service) { (result) in
                let decoder = JSONDecoder()
                let resp = try! decoder.decode(type, from: result.get().data)
                
                observer.onNext(resp)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
}
