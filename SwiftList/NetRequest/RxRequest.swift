//
//  RxRequest.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/3/22.
//

import Foundation
import RxSwift
import Moya

struct RxRequest<T> where T : Decodable {
    // 这里Observable可换成Signal
    /* 第一版
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
    */
    
    static func request(service: MyService) -> Observable<T> {
        return Observable.create { (observer) -> Disposable in
            let provider = MoyaProvider<MyService>()
            provider.request(service) { (result) in
                let decoder = JSONDecoder()
                let resp = try! decoder.decode(T.self, from: result.get().data)
                
                observer.onNext(resp)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
}


/**
 对一个func来说，可以通过泛型来控制方法内部变量的具体类型，比如request()来说不传type类型，decode方法里面直接使用泛型来处理，这种需求能这样做吗？能的话如何去做？
 目前decode第一个参数使用T.self, 在外面调用这个方法的时候泛型该怎么写
 这种情况如果把泛型放到方法里，不传参的话没法推断出泛型的具体类型。可以上移约束，放到Struct约束，比如：
 struct RxRequest<T> where T : Decodable  参考Array的定义
 */

/**
 问题：
 1. 一个页面销毁时，如何将在此页面上已发起的请求取消掉？
 2. 页面有多个请求，如何等请求全部结束后一起响应
 3. 两个请求，一个请求需要另一个请求的参数和响应结果才能发起
 
 */
