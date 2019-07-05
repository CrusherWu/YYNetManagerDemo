//
//  YYUsePageViewModel.swift
//  MVVM Alamofire
//
//  Created by 星火教育 on 2019/6/28.
//  Copyright © 2019 Arifin Firdaus. All rights reserved.
//

import UIKit

class YYUsePageViewModel: YYPageViewModel {
    
    override func requestParameter() -> YYNetworkingFetchParam {
        let fetchParam = YYNetworkingFetchParam(urlString: "https://jsonplaceholder.typicode.com/todos", networkingMethod: .get, otherParam: nil, allParam: ["token":"nil"])
            //YYNetworkingFetchParam(url: "https://jsonplaceholder.typicode.com/todos", method: YYNetworkingMethod.get, otherParam: nil, allParam: ["token":"nil"])
        
        return fetchParam
    }
}
