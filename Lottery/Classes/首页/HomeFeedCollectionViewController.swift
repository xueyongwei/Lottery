//
//  HomeFeedCollectionViewController.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/12.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit
import YYKit
import SDCycleScrollView
import Alamofire
import SwiftyJSON
import CodableAlamofire
import SDWebImage

private let reuseIdentifier = "Cell"

class HomeFeedCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    enum DataType :Int{
        case topBarner = 1
        case notiInfo = 2
        case funcItem = 3
        case hotCategory = 4
        case centerBigImg = 5
        case lotterys = 6
        
        var identifier:(header:String,cell:String){
            switch self {
            case .topBarner:
                return ("PlaceHolderHeader","")
            case .notiInfo:
                return ("PlaceHolderHeader","")
            case .funcItem:
                return ("PlaceHolderHeader","")
            case .hotCategory:
                return ("TitleOnlyHeader","")
            case .centerBigImg:
                return ("PlaceHolderHeader","")
            case .lotterys:
                return ("PlaceHolderHeader","")
            }
        }
    }
    
    var topBarnerSource = [TopBarner](){
        didSet{
//            let imgurls = ["https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544888547694&di=f160717912085599b315cfedb03d27f1&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180324%2F1736819eb11340dd9aaffc7b6f92c318.jpeg","http://123.59.124.153/others/upload/20181212/1544606023935_u_1394504918,2596470686_fm_26_gp_0.jpg","http://123.59.124.153/others/upload/20181212/1544606023935_u_1394504918,2596470686_fm_26_gp_0.jpg"]
            let imgurls = topBarnerSource.map({return $0.imageUrl})
            self.barnerCycleView.imageURLStringsGroup = imgurls
        }
    }
    var notiInfo = ""{
        didSet{
            self.notifoView.message = notiInfo
        }
    }
    var funcItemSource = [FuncItem]()
    var hotLotterySource = [HotLottery]()
    var bigImgItm:BigImg?{
        didSet{
            centerPicView.imgView.sd_setImage(with: URL.init(string: (bigImgItm?.imageUrl)!), placeholderImage: UIImage.init(named: "placeholder"))
        }
    }
    var lotterycategorScource = [Lotterycategor](){
        didSet{
            self.lotteryCatsVC.lotterycategorScource = lotterycategorScource
        }
    }
    
    var dataSource  = [DataType]()
    
    /// 轮播头视图
    lazy var barnerCycleView: SDCycleScrollView = {
        let view = SDCycleScrollView.init(frame: CGRect.zero)
        view.delegate = self
        return view
    }()
    
    /// 彩票分类视图
    lazy var lotteryCatsView: LotterCatsView = {
        let view = LotterCatsView()
        return view
    }()
    /// 彩票分类视图
    lazy var lotteryCatsVC: LotteryListViewController = {
        let vc = LotteryListViewController()
        self.addChild(vc)
        vc.didMove(toParent: self)
        return vc
    }()
    /// 中间的插图
    lazy var centerPicView: BigImageView = {
        let view = BigImageView()
        return view
    }()
    /// 通知跑马灯
    lazy var notifoView: NotiInfoView = {
        let view = NotiInfoView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.backgroundColor = .white
        self.collectionView.alwaysBounceVertical = true
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.register(FuncItemCollectionCell.self, forCellWithReuseIdentifier: "FuncItemCollectionCell")
        self.collectionView!.register(HotBLotteryCollectionCell.self, forCellWithReuseIdentifier: "HotBLotteryCollectionCell")
        
        // Register SectionHeader classes
        self.collectionView.register(TitleOnlyHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TitleOnlyHeader")
        self.collectionView.register(PlaceHolderHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "PlaceHolderHeader")
        
        
        // Register SectionFooter classes
        self.collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer")
        
        self.collectionView.showsVerticalScrollIndicator = false
        self.dataSource = [.topBarner,.notiInfo,.funcItem,.hotCategory,.centerBigImg,.lotterys]
        let header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(requestData))
        header?.lastUpdatedTimeLabel.isHidden = true
        header?.isAutomaticallyChangeAlpha = true
        self.collectionView.mj_header = header
        
//        let refreshControl = UIRefreshControl.init()
//        refreshControl.tintColor = UIColor.darkGray
//        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
//        self.collectionView.refreshControl = refreshControl
        requestData()
    }



    //MARK: - --------------UICollectionViewDataSource--------------

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return self.dataSource.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let info = self.infoOf(section: section)
        
        return info.dataCount
      
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = self.dataSource[indexPath.section]
        if type == .funcItem{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FuncItemCollectionCell", for: indexPath) as! FuncItemCollectionCell
            let data = self.funcItemSource[indexPath.item]
            cell.titleLabel.text = data.name
            
            cell.imgView.sd_setImage(with: URL.init(string: data.imageUrl), placeholderImage: UIImage.init(named: "placeholder"))
            return cell
            
        }else if type == .hotCategory{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotBLotteryCollectionCell", for: indexPath) as! HotBLotteryCollectionCell
            let data = self.hotLotterySource[indexPath.item]
            cell.titleLabel.text = data.name
            cell.betMaxLabel.text = data.betMax
            cell.introductionLabel.text = data.introduction
            cell.imgView.sd_setImage(with: URL.init(string: data.imageUrl), placeholderImage: UIImage.init(named: "placeholder"))
            return cell
            
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        cell.backgroundColor = UIColor.darkGray
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let data = self.dataSource[indexPath.section]
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: data.identifier.header, for: indexPath)
            customHeader(header, type: data)
            return header
            
        }else{
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath)
            footer.backgroundColor = UIColor.init(rgb: 0xF5F5F5)
            return footer
        }
    }
    
    //MARK: -
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let info = self.infoOf(section: indexPath.section)
        return info.itemSize
//        return CGSize.init(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let info = self.infoOf(section: section)
        return info.sectionInset
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let info = self.infoOf(section: section)
        return CGSize.init(width: collectionView.width, height: info.headerHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let info = self.infoOf(section: section)
        
        return CGSize.init(width: collectionView.width, height: info.footerHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let type = self.dataSource[section]
        if type == .funcItem {
            return 5
        }else if type == .hotCategory{
            return 3
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let type = self.dataSource[section]
        if type == .hotCategory{
            return 3
        }
        return 0
    }
    

}
//MARK: - --------------请求数据--------------
extension HomeFeedCollectionViewController{
    /// 请求首页的数据
    @objc func requestData(){
        
        Service.Lottery.index(sucess: { (response) in
            self.collectionView.mj_header.endRefreshing()
            guard response.status == 1 else {
                MBProgressHUD.showFailImage(response.message)
                return
            }
            guard let datas = response.data.array else {
                return
            }
            self.dataSource.removeAll()
            for type in datas{
                let itemType = type["itemType"].intValue
                let itemDatas = type["itemDatas"].arrayValue
                
                if let type = DataType.init(rawValue: itemType),itemDatas.count > 0{
                    self.dataSource.append(type)
                    self.handleDatas(itemDatas, of: type)
                }else{
                    XYWDebugLog("\(type)类型不支持", type: .error)
                }
            }
            self.collectionView.reloadData()
        }) { (error) in
            self.collectionView.mj_header.endRefreshing()
            MBProgressHUD.showFailImage(error.localizedDescription)
        }
        
    }
}
//MARK: - --------------辅助方法--------------
extension HomeFeedCollectionViewController{
    
    /// 获取分组的信息
    func infoOf(section:Int) -> (dataCount:Int,headerHeight:CGFloat,footerHeight:CGFloat,sectionInset:UIEdgeInsets,itemSize:CGSize){
        let type = self.dataSource[section]
        
        var sectionHeight:CGFloat = 0
        
        switch  type{
        case .topBarner:
            let height = (321.0/720.0 )*YYScreenSize().width
            return (0,height,0,UIEdgeInsets.zero,CGSize.zero)
        case .notiInfo:
            if self.notiInfo.count > 0 {
                sectionHeight = 42.0
            }
            return (0,sectionHeight,9.0,UIEdgeInsets.zero,CGSize.zero)
        case .funcItem:
            let sectionInset = UIEdgeInsets.init(top: 18, left: 18, bottom: 18, right: 18)
            
            let widht = (self.collectionView.width - sectionInset.left - sectionInset.right - 15)*0.25
            let size = CGSize.init(width: widht, height: 62)
            return (funcItemSource.count,0,0,sectionInset,size)
        case .hotCategory:
            if self.hotLotterySource.count > 0 {
                sectionHeight = 56
            }
            let sectionInset = UIEdgeInsets.init(top: 0, left: 14, bottom: 12, right: 14)
            let width = (self.collectionView.width - sectionInset.left - sectionInset.right-3)*0.5
            let height = (100.0 / 173.0) * width
            
            return (self.hotLotterySource.count,sectionHeight,9,sectionInset,CGSize.init(width: width, height: height))
        case .centerBigImg:
            if let itm = self.bigImgItm,itm.imageUrl.count > 0 {
                sectionHeight = 91
            }
            return (0,sectionHeight,9,UIEdgeInsets.zero,CGSize.zero)
        case .lotterys:
            if self.lotterycategorScource.count > 0 {
                sectionHeight = 250
            }
            return (0,sectionHeight,0,UIEdgeInsets.zero,CGSize.zero)
//            return (lotterycategorScource.count,62,0,UIEdgeInsets.zero,CGSize.init(width: 100, height: 100))
        }
    }
    
    /// 定制某section的内容
    func customHeader(_ header:UICollectionReusableView,type:HomeFeedCollectionViewController.DataType){
        switch type {
        case .topBarner:
            showContent(barnerCycleView, in: header)
            break
        case .hotCategory:
            let view = header as! TitleOnlyHeader
//            view.spLine.isHidden = false
            view.titleLabel.text = "热门彩种"
        case .centerBigImg:
            showContent(centerPicView, in: header)
            break
        case .notiInfo:
            showContent(notifoView, in: header)
        case .lotterys:
            showContent(lotteryCatsVC.view, in: header)
//            showContent(lotteryCatsView, in: header)
        default:
            break
        }
    }
    
    /// 将内容view添加到header上
    func showContent(_ conent:UIView,in header:UIView){
        header.removeAllSubviews()
        header.addSubview(conent)
        conent.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        header.layoutIfNeeded()
    }
    
    func handleDatas(_ datas:[JSON],of type:DataType){
        switch type {
        case .topBarner:
            self.topBarnerSource = TopBarner.getListFrom(datas)
            break
        case .notiInfo:// 通知只取第一条
            let noti = datas.first!
            self.notiInfo = noti["content"].stringValue
        case .funcItem:
            self.funcItemSource = FuncItem.getListFrom(datas)
        case .hotCategory:
            self.hotLotterySource = HotLottery.getListFrom(datas)
        case .centerBigImg:
            self.bigImgItm = BigImg.getListFrom(datas).first!
        case .lotterys:
            self.lotterycategorScource = Lotterycategor.getListFrom(datas)
            break
        default:
            break
        }
    }
}



//MARK: - --------------SDCycleScrollViewDelegate--------------
extension HomeFeedCollectionViewController:SDCycleScrollViewDelegate{
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        let itm = self.topBarnerSource[index]
        XYWDebugLog("点击了\(itm.webViewUrl)", type: .warning)
    }
}
