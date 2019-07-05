//
//  YYViewModel.swift
//  MVVM Alamofire
//
//  Created by 星火教育 on 2019/6/25.
//  Copyright © 2019 Arifin Firdaus. All rights reserved.
//

import Foundation
import Alamofire

typealias YYViewModelSuccessBlock = (_ newModels: [Any]?, _ result: YYNetworkingResult) -> Void
typealias YYViewSingleModelSuccessBlock = (_ model: Any?, _ result: YYNetworkingResult) -> Void
typealias YYViewModeFailBlock = (_ errorMessage: String, _ result: YYNetworkingResult) -> Void


class YYViewModel {
    
    var operation: DataRequest?
    
    func requestParameter() -> YYNetworkingFetchParam {
        return YYNetworkingFetchParam()
    }
    
    func cancel() -> Void {
        self.operation?.cancel()
    }
    
    @discardableResult
    func model(withJsonData: Data) -> Any {
        return NSObject()
    }
    
    @discardableResult
    func typeModel<T: Decodable>(type: T.Type, jsonData: Data) -> Any? {
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(type, from: jsonData)
            return decodedData
            
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
    @discardableResult
    func typeModels<T: Decodable>(type: T.Type, jsonData: Data) -> [Any]? {
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(type, from: jsonData)
            return decodedData as? [Any]
        } catch let error {
            print(error)
        }
        return nil
    }
}
