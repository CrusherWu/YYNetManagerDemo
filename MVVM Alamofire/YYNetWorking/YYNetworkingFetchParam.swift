//
//  YYNetworkingFetchParam.swift
//  MVVM Alamofire
//
//  Created by 星火教育 on 2019/6/20.
//  Copyright © 2019 Arifin Firdaus. All rights reserved.
//

import Foundation

enum YYNetworkingMethod: Int, CustomStringConvertible {
    case get = 0
    case post
    case delete
    case put
    
    var description: String{
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .delete:
            return "DELETE"
        case .put:
            return "PUT"
        }
    }
}

struct YYNetworkingFetchParam {
    
    var urlString: String = ""
    var networkingMethod: YYNetworkingMethod = .get
    var otherParam: [String:Any]?
    var allParam: [String:Any]?
}
