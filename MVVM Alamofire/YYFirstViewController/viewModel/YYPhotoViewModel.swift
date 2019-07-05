//
//  YYPhotoViewModel.swift
//  MVVM Alamofire
//
//  Created by 星火教育 on 2019/6/27.
//  Copyright © 2019 Arifin Firdaus. All rights reserved.
//

import UIKit

class YYPhotoViewModel: YYObjectViewModel {
    
    // MARK: - property
    
    var model: YYPhotoModel? {
        didSet {
            guard let p = model else { return }
            print(p)
        }
    }
    
    // MARK: - life cycle
    
    override func requestParameter() -> YYNetworkingFetchParam {
        let fetchParam = YYNetworkingFetchParam(urlString: "https://jsonplaceholder.typicode.com/photos/8", networkingMethod: .get, otherParam: nil, allParam: ["token":"nil"])
        return fetchParam
    }
    
    override var basicModel: Any? {
        didSet {
            if let photoModel = basicModel as? YYPhotoModel {
                self.model = photoModel
            }
        }
    }
    
    // MARK: - photoModel （optional function
    
    func fetchPhotoModel(withSuccess:@escaping(_ mode: YYPhotoModel, _ result: YYNetworkingResult) -> Void , fail:@escaping YYViewModeFailBlock ) -> Void {
        fetchModel(withSuccess: withSuccess, fail: fail)
    }
}
