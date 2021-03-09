//
//  SiftModel.swift
//  SwiftList
//
//  Created by lingjie on 2021/3/9.
//

import Foundation

struct SiftItem: Codable, Hashable {
    var `default`: Bool
    var defaultValue: String
    var id: String
    var name: String
    var placeholder: String
}

struct SiftField: Codable, Hashable {
    var allowDelete: Bool
    var apiName: String
    var associationApiName: String
    var associationStage: String
    var `default`: Bool
    var fieldName: String
    var fieldType: Int
    var list: [SiftItem]
}

struct SiftModel: Codable {
    var addList: [SiftField]
    var unAddList: [SiftField]
}

struct SiftRespModel: Codable {
    var data: SiftModel
}


