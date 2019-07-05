//
//  YYPageViewModel.swift
//  MVVM Alamofire
//
//  Created by 星火教育 on 2019/6/27.
//  Copyright © 2019 Arifin Firdaus. All rights reserved.
//

import UIKit

class YYPageViewModel: YYViewModel {
    
    var pageModels: [Any] = []
    var canLoadMore: Bool = false
    var pageIndex: Int = 0
    var isReload: Bool = false
    
    func loadModels<T: Decodable>(reload: Bool,
                                  success: @escaping(_ mode: [T], _ result: YYNetworkingResult) -> Void,
                                  fail: @escaping YYViewModeFailBlock) -> Void {
        
        if let operation = self.operation {
            operation.cancel()
        }
        
        var param = requestParameter()
        var otherParam: [String:Any] = [:]
        
        if let areadyOtherParam = param.otherParam {
            otherParam.update(other: areadyOtherParam)
        }
        
        var pageIndex = 1
        
        if reload == false {
            pageIndex = self.pageIndex + 1
        }
        otherParam.updateValue(pageIndex, forKey: "page")
        
        param.otherParam = otherParam
        
        self.operation = YYNetWorkingManager.fetch(netParams: param, success: { (networkingResult) in
            
            var models: [T] = []
            
            if let data = networkingResult.responeData {
                let decodedModel = self.typeModels(type: [T].self, jsonData: data)
                for model in decodedModel ?? [] {
                    if let element = model as? T {
                        models.append(element)
                    }
                }
            }
            
            if models.isEmpty {
                self.canLoadMore = false
            } else {
                self.pageIndex = pageIndex
                self.canLoadMore = true
            }
            self.pageModels = models
            
            if reload == true {
                self.pageModels.removeAll()
//                self.pageModels += models
                self.pageModels.append(contentsOf: models)
            } else {
//                self.pageModels += models
                self.pageModels.append(contentsOf: models)
            }
            
            success(models,networkingResult)
            
        }, fail: { (networkingResult) in
            fail(networkingResult.message ?? "msg of error was returned nil😲",networkingResult)
        })
    }
}

extension Dictionary {
    mutating func update(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}
