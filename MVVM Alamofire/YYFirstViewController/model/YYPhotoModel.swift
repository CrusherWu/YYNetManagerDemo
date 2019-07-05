//
//  YYPhotoModel.swift
//  MVVM Alamofire
//
//  Created by 星火教育 on 2019/6/24.
//  Copyright © 2019 Arifin Firdaus. All rights reserved.
//

//struct YYPhotoModel: Codable,Decodable {
//    var albumId: Int = 0
//    var id: Int = 0
//    var title: String = ""
//}


struct YYPhotoModel: Codable {
    var albumId: Int?
    var id: Int?
    var title: String?
    var originalUrl: String?
    var thumbnailUrl: String?
    
    var hh: String?
    
    enum CodingKeys: String, CodingKey {
        case albumId
        case id
        case title
        case originalUrl = "url"
        case thumbnailUrl
        
        case hh
    }
}
