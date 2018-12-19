//
//  ComeLotteryTableViewController.swift
//  Lottery
//
//  Created by 薛永伟 on 2018/12/18.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import UIKit

class ComeLotteryTableViewController: UITableViewController {

    
    var LotteryComeSource = [LotteryCome]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        self.tableView.register(BaseComeLotteryCell.self, forCellReuseIdentifier: "BaseComeLotteryCell")
        self.tableView.register(ComeRedBullNumberCollectionCell.self, forCellReuseIdentifier: "ComeRedBullNumberCollectionCell")
        self.tableView.register(ComePK10CollectionCell.self, forCellReuseIdentifier: "ComePK10CollectionCell")
        self.tableView.register(Come11xuan5CollectionCell.self, forCellReuseIdentifier: "Come11xuan5CollectionCell")
        self.tableView.register(ComeTouziSumCollectionCell.self, forCellReuseIdentifier: "ComeKuaisanCollectionCell")
        self.tableView.register(Come6add1CollectionCell.self, forCellReuseIdentifier: "Come6add1CollectionCell")
        self.tableView.register(ComePcdandanCollectionCell.self, forCellReuseIdentifier: "ComePcdandanCollectionCell")
        self.tableView.register(ComeAdd3Equal1CollectionCell.self, forCellReuseIdentifier: "ComeAdd3Equal1CollectionCell")
        
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
        return self.LotteryComeSource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = self.reuseIdentifierOf(indexPath: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! BaseComeLotteryCell
        
        let model = self.LotteryComeSource[indexPath.row]
        cell.titleLabel.text = model.name
        cell.timeLabel.text = model.lastPrizeTime.description
        cell.iconImgView.sd_setImage(with: URL.init(string: model.imageUrl), placeholderImage: UIImage.init(named: "palceholder"))
        cell.descLabel.text = model.lastIssueNo
        cell.lastPrizeNumber = model.lastPrizeNumber
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
//MARK: - --------------数据请求--------------
extension ComeLotteryTableViewController{
    @objc func requestData(){
        Service.Lottery.getLotteryCategory(sucess: {[weak self] (response) in
            
            self?.tableView.mj_header.endRefreshing()
            self?.LotteryComeSource.removeAll()
            if response.status == 1 {
                let datas = response.data.arrayValue
                for itm in datas{
                    let model = LotteryCome.init(categoryId: itm["categoryId"].intValue,
                                                   imageUrl: itm["imageUrl"].stringValue,
                                                   lastIssueNo: itm["lastIssueNo"].stringValue,
                                                   lastPrizeNumber: itm["lastPrizeNumber"].stringValue,
                                                   name: itm["name"].stringValue,
                                                   lastPrizeTime: itm["lastPrizeTime"].intValue,
                                                   lotteryId: itm["lotteryId"].intValue)
                    self?.LotteryComeSource.append(model)
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
    /// 获取重用符
    func reuseIdentifierOf(indexPath:IndexPath)->String{
        let model = self.LotteryComeSource[indexPath.row]
        if let category = LotteryCategory.init(rawValue: model.categoryId) {//特别定制
            switch category {
            case .ssc,.pk10,.shiyixuan5:
                return "ComeRedBullNumberCollectionCell"
            case .fenfen28:
                return "ComeAdd3Equal1CollectionCell"
            case .kuai3:
                return "ComeKuaisanCollectionCell"
            case .liuhecai:
                return "Come6add1CollectionCell"
            case .pcdandan:
                return "ComePcdandanCollectionCell"
            }
        }else{
            return "BaseComeLotteryCell"
        }
        
    }
    /// 定制cell的内容
    func config(cell:BaseComeLotteryCell,at indexPath:IndexPath){
        let model = self.LotteryComeSource[indexPath.row]
        if let category = LotteryCategory.init(rawValue: model.categoryId) {//特别定制
//            switch category {
//            case .ssc,.pk10,.shiyixuan5:
//                let theCell = cell as! ComeRedBullNumberCollectionCell
//
////                return "ComeRedBullNumberCollectionCell"
//            case .fenfen28:
////                return "ComeFenfen28CollectionCell"
//            case .kuai3:
////                return "ComeKuaisanCollectionCell"
//            case .liuhecai:
////                return "Come6hecaiCollectionCell"
//            case .pcdandan:
////                return "ComePcdandanCollectionCell"
//            }
        }
        
        
    }
}

extension ComeLotteryTableViewController{
    struct LotteryCome {
        var categoryId: Int
        var imageUrl: String
        var lastIssueNo: String
        var lastPrizeNumber: String
        var name: String
        var lastPrizeTime: Int
        var lotteryId: Int
    }
}
