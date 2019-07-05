//
//  YYObjectViewModel.swift
//  MVVM Alamofire
//
//  Created by 星火教育 on 2019/6/24.
//  Copyright © 2019 Arifin Firdaus. All rights reserved.
//

import Foundation

class YYObjectViewModel: YYViewModel {
    
    var basicModel: Any?
    
    // MARK: - function for fetching data decoded as model type （解析指定 model
    
    func fetchModel<T: Decodable>(withSuccess:@escaping (_ mode: T, _ result: YYNetworkingResult) -> Void , fail:@escaping YYViewModeFailBlock ) -> Void {
        
        if self.operation != nil{
            self.cancel()
        }
        
        self.operation = YYNetWorkingManager.fetch(netParams:requestParameter() , success: { response in
            
            guard let data = response.responeData else { return }
            
            let typeModel = self.typeModel(type: T.self, jsonData: data)
            self.basicModel = typeModel
            if let modelIsGenericType = typeModel as? T {
                withSuccess(modelIsGenericType,response)
            } else {
                
            }
            
        }) { error in
            fail(error.message ?? "msg of error was returned nil😲",error)
        }
    }
    
    // MARK: - function for fetching original data which be decoded by client (自主解析数据
    
    func fetchModel(withSuccess:@escaping YYViewSingleModelSuccessBlock, fail:@escaping YYViewModeFailBlock ) -> Void {
        
        if self.operation != nil {
            self.cancel()
        }
        
        self.operation = YYNetWorkingManager.fetch(netParams:requestParameter() , success: { response in
            
            withSuccess(nil,response)
            
        }) { error in
            fail(error.message ?? "msg of error was returned nil😲",error)
        }
    }
}
