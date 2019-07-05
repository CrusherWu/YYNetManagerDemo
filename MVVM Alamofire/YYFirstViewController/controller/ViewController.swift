//
//  ViewController.swift
//  MVVM Alamofire
//
//  Created by Arifin Firdaus on 7/12/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton! //可以隐形获取可选值
    
    @IBAction func nextBtnDidClick(_ sender: Any) {
        
        self.navigationController?.pushViewController(YYSecondViewController.init(), animated: true)
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewModel = YYPhotoViewModel()
        viewModel.fetchModel(withSuccess: { (photoModel: YYPhotoModel, YYNetworkingResult) in
            self.titleLabel.text = viewModel.model?.title
            self.subtitleLabel.text = "id: \(photoModel.albumId ?? -1)"
            self.headerImageView.sd_setImage(with:URL.init(string: photoModel.originalUrl ?? "") , completed: nil)
            
            if let photoModel = viewModel.basicModel as? YYPhotoModel {
                print(photoModel)
//                (viewModel.basicModel as? YYPhotoModel)?.albumId
            }
        }) { (String, YYNetworkingResult) in
            
        }
    }
}

