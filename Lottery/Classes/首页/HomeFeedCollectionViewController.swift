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

private let reuseIdentifier = "Cell"

class HomeFeedCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    enum DataType {
        case topBarner
        case winInfo
        case funcItem
        case hotCategory
        case centerBarner
        case lotterys
        
        var identifier:(header:String,cell:String){
            switch self {
            case .topBarner:
                return ("PlaceHolderHeader","")
            case .winInfo:
                return ("PlaceHolderHeader","")
            case .funcItem:
                return ("PlaceHolderHeader","")
            case .hotCategory:
                return ("TitleOnlyHeader","")
            case .centerBarner:
                return ("PlaceHolderHeader","")
            case .lotterys:
                return ("PlaceHolderHeader","")
            }
        }
    }
    
    var topBarnerSource = [TopBarner]()
    var funcItemSource = [FuncItem]()
    var hotLotterySource = [Lottery]()
    var lotterysScource = [Lottery]()
    
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
    /// 中间的插图
    lazy var centerPicView: BigImageView = {
        let view = BigImageView()
        return view
    }()
    /// 轮播信息图
    lazy var winInfoView: WinInfoView = {
        let view = WinInfoView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.backgroundColor = .white
        self.collectionView.alwaysBounceVertical = true
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        // Register SectionHeader classes
        self.collectionView.register(TitleOnlyHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TitleOnlyHeader")
        self.collectionView.register(PlaceHolderHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "PlaceHolderHeader")
        
        // Register SectionFooter classes
        self.collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer")

        self.dataSource = [.topBarner,.winInfo,.funcItem,.hotCategory,.centerBarner,.lotterys]
        
        
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
            footer.backgroundColor = UIColor.green
            return footer
        }
    }
    
    //MARK: -
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 18, bottom: 0, right: 18)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let info = self.infoOf(section: section)
        return CGSize.init(width: collectionView.width, height: info.headerHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let info = self.infoOf(section: section)
        
        return CGSize.init(width: collectionView.width, height: info.footerHeight)
    }
    

}

//MARK: - --------------辅助方法--------------
extension HomeFeedCollectionViewController{
    
    /// 获取分组的信息
    func infoOf(section:Int) -> (dataCount:Int,headerHeight:CGFloat,footerHeight:CGFloat){
        let type = self.dataSource[section]
        switch  type{
        case .topBarner:
            let height = (321.0/720.0 )*YYScreenSize().width
            return (0,height,0)
        case .winInfo:
            return (0,42,9)
        case .funcItem:
            return (funcItemSource.count,0,0)
        case .hotCategory:
            return (4,55,0)
        case .centerBarner:
            return (0,91,9)
        case .lotterys:
            return (lotterysScource.count,62,0)
        }
    }
    
    /// 定制某section的内容
    func customHeader(_ header:UICollectionReusableView,type:HomeFeedCollectionViewController.DataType){
        switch type {
        case .topBarner:
            showContent(barnerCycleView, in: header)
            break
        case .centerBarner:
            showContent(centerPicView, in: header)
            break
        case .winInfo:
            showContent(winInfoView, in: header)
        case .lotterys:
            showContent(lotteryCatsView, in: header)
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
}


//MARK: - --------------类中类--------------
extension HomeFeedCollectionViewController{
    //MARK: ----模型
    struct TopBarner {
        var name:String?
        var imgUrl:String?
        var clickUrl:String?
    }
    struct FuncItem {
        var name:String?
        var imgUrl:String?
    }
    
    struct Lottery {
        var name:String
        var imgUrl:String
        var type:Int
        var timeCycle:Int
        var lossPerCent:Float
    }
    //MARK: ----ReusableView
    class PlaceHolderHeader:CodeLayoutReusableView{
        override func codeCustomSubviews() {
            self.backgroundColor = UIColor.red
        }
    }
    class TitleOnlyHeader:CodeLayoutReusableView{
        lazy var titleLabel: UILabel = {
            let view = UILabel()
            view.textAlignment = .left
            view.text = "热门彩票"
            view.font = UIFont.systemFont(ofSize: 17)
            return view
        }()
        
        //MARK: ----
        override func codeCustomSubviews(){
            addSubview(titleLabel)
            titleLabel.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(18)
            }
        }
    }
    //MARK: ----CollectionCell
    
    //MARK: ----View
    
    /// 信息公告
    class WinInfoView: CodeLayoutView{
        lazy var iconView: UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            view.image = UIImage.init(named: "home_公告")
            return view
        }()
        override func codeCustomSubviews(){
            addSubview(iconView)
            iconView.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(17)
                make.width.equalTo(17)
                make.height.equalTo(17)
            }
        }
    }
    
    /// 大图View
    class BigImageView: CodeLayoutView{
        lazy var iconView: UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFill
            view.image = UIImage.init(named: "home_注单点击")
            view.clipsToBounds = true
            return view
        }()
        override func codeCustomSubviews(){
            addSubview(iconView)
            iconView.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        }
    }
    
   /// 彩票分类
    class LotterCatsView:CodeLayoutView{
        lazy var titleLabel: UILabel = {
            let view = UILabel()
            view.textAlignment = .center
            view.text = "热门彩票"
            view.font = UIFont.systemFont(ofSize: 17)
            return view
        }()
        
        override func codeCustomSubviews(){
            addSubview(titleLabel)
            titleLabel.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(18)
            }
        }
    }
    
    
}

//MARK: - --------------SDCycleScrollViewDelegate--------------
extension HomeFeedCollectionViewController:SDCycleScrollViewDelegate{
    
}
