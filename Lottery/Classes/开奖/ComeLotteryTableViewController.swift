//
//  ComeLotteryTableViewController.swift
//  Lottery
//
//  Created by 薛永伟 on 2018/12/18.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import UIKit

class ComeLotteryTableViewController: UITableViewController {

    
    var LotteryListVoSource = [LotteryListVo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        self.tableView.register(BaseComeLotteryCell.self, forCellReuseIdentifier: "BaseComeLotteryCell")
        self.tableView.tableFooterView = UIView()
        
        let header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(requestData))
        header?.lastUpdatedTimeLabel.isHidden = true
        header?.isAutomaticallyChangeAlpha = true
        self.tableView.mj_header = header
        
        self.tableView.mj_header.beginRefreshing()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.LotteryListVoSource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.LotteryListVoSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BaseComeLotteryCell", for: indexPath) as! BaseComeLotteryCell
        cell.titleLabel.text = model.name
        cell.timeLabel.text = model.lastPrizeTime.description
        cell.iconImgView.sd_setImage(with: URL.init(string: model.imageUrl), placeholderImage: UIImage.init(named: "palceholder"))
        cell.descLabel.text = model.lastIssueNo
        
//        guard let category = LotteryCategory.init(rawValue: model.categoryId) else {
//            return cell
//        }
//        switch category {
//        case .ssc:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "BaseComeLotteryCell", for: indexPath)
//            return cell
//        case .kuai3:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "BaseComeLotteryCell", for: indexPath)
//            return cell
//        default:
//            break
//        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
//MARK: - --------------数据请求--------------
extension ComeLotteryTableViewController{
    @objc func requestData(){
        Service.Lottery.getLotteryCategory(sucess: {[weak self] (response) in
            
            self?.tableView.mj_header.endRefreshing()
            self?.LotteryListVoSource.removeAll()
            if response.status == 1 {
                let datas = response.data.arrayValue
                for itm in datas{
                    let model = LotteryListVo.init(categoryId: itm["categoryId"].intValue,
                                                   imageUrl: itm["imageUrl"].stringValue,
                                                   lastIssueNo: itm["lastIssueNo"].stringValue,
                                                   lastPrizeNumber: itm["lastPrizeNumber"].stringValue,
                                                   name: itm["name"].stringValue,
                                                   lastPrizeTime: itm["lastPrizeTime"].intValue,
                                                   lotteryId: itm["lotteryId"].intValue)
                    self?.LotteryListVoSource.append(model)
                }
                self?.tableView.reloadData()
            }else{
                MBProgressHUD.showFailImage(response.message)
            }
        }) { (error) in
            MBProgressHUD.showFailImage(error.localizedDescription)
        }
    }
}
//MARK: - --------------辅助方法--------------
extension ComeLotteryTableViewController{
    
    func config(cell:UITableViewCell,at indexPath:IndexPath){
        let model = self.LotteryListVoSource[indexPath.row]
        guard let category = LotteryCategory.init(rawValue: model.categoryId) else {
            return
        }
        switch category {
        case .ssc:
            break
        default:
            break
        }
    }
}
extension ComeLotteryTableViewController{
    struct LotteryListVo {
        var categoryId: Int
        var imageUrl: String
        var lastIssueNo: String
        var lastPrizeNumber: String
        var name: String
        var lastPrizeTime: Int
        var lotteryId: Int
    }
}
