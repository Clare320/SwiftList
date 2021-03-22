//
//  MyService.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/3/22.
//

import Foundation
import Moya

enum MyService {
    case latest
    case newsDetail(id: String)
}

extension MyService: TargetType {
    var sampleData: Data {
        return Data()
    }
    
    
    var task: Task {
        switch self {
        case .latest, .newsDetail:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var baseURL: URL { return URL(string: "http://news-at.zhihu.com")! }
    var path: String {
        switch self {
        case .latest:
            return "/api/3/stories/latest"
        case .newsDetail(let id):
            return "/api/3/news/\(id)"
        }
    }
    var method: Moya.Method {
        switch self {
        case .latest, .newsDetail:
            return .get
        }
    }
}

