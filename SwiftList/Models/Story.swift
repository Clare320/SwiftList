//
//  Story.swift
//  SwiftList
//
//  Created by lingjie.li on 2021/3/22.
//

import Foundation

struct Story: Codable, Hashable {
    var imageHue: String
    var title: String
    var url: String
    var hint: String
    var gaPrefix: String
    var images: [String]
    var type: Int
    var id: CLongLong
    
    enum CodingKeys: String, CodingKey {
        case imageHue = "image_hue"
        case gaPrefix = "ga_prefix"
        
        case title
        case url
        case hint
        case images
        case id
        case type
    }
}

struct StoryResp: Codable {
    var date: String
    var stories: [Story]
}
