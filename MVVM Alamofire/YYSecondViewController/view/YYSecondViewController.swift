//
//  YYSecondViewController.swift
//  MVVM Alamofire
//
//  Created by 星火教育 on 2019/6/30.
//  Copyright © 2019 Arifin Firdaus. All rights reserved.
//

import UIKit

class YYSecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataSource = NSMutableArray()
    var viewModel = YYUsePageViewModel()
    
    var tableView: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        
        let tableViewY = CGFloat.init(100.5)
        let tableViewH = UIScreen.main.bounds.size.height - tableViewY
        
        let tableView = UITableView(frame: CGRect(x: 0, y: tableViewY, width: UIScreen.main.bounds.size.width, height: tableViewH), style: .plain)
        self.tableView = tableView
        self.view.addSubview(tableView)
        tableView.backgroundColor = UIColor.green
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.loadModels(reload: true, success: { (newModels: [YYUserModel], YYNetworkingResult) in
            print(newModels)
            for item in self.viewModel.pageModels{
                if item is YYUserModel {
                    let model: YYUserModel = item as! YYUserModel
                    self.dataSource.add(model)
                }
            }
            
            self.tableView?.reloadData()
            
        }) { (String, YYNetworkingResult) in
            
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "cell"
        
        // 1.创建cell,此时cell是可选类型
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        // 2.判断cell是否为nil
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // 3.设置cell数据
        cell?.textLabel?.text = (dataSource[indexPath.row] as? YYUserModel)?.title
        
        return cell!
    }
}
