//
//  FFsscViewController.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/10.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit

class FFsscViewController:UIViewController,BettingTitleViwable ,BettingPayBoardViwable {
    
    var payBoardVC: PayBoardViewController?
    
    
    var playMethod: PlayMethod = PlayMethod.init(type: .wuxing, way: .fushi)
    
    var payBoardHeight: CGFloat = 120
    
    func onRightItemClick() {
        print("点击了更多")
    }
    
    func onTitleViewClick() {
        print("点击了标题")
    }
    
    var selectedIndex = [Int:[Int]]()

    class func loadFormStb() ->FFsscViewController{
        let stb = UIStoryboard.init(name: "FFSSCS", bundle: nil)
        let vc = stb.instantiateInitialViewController() as! FFsscViewController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.customContentView()
        
        self.customComonView()
    }
    /// 定制通用视图控制器
    func customComonView(){
        self.setRightMoreItem()
        self.setNaviTitleView()
        self.addPayBoard()
    }

    /// 定制内容控制器
    func customContentView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize.init(width: 50, height: 50)
        let content = FfsscStarCollectionViewController.init(collectionViewLayout: layout)
        self.addChild(content)
        content.didMove(toParent: self)
        self.view.addSubview(content.view)
        content.view.snp.makeConstraints { (make) in
            make.top.right.bottom.left.equalToSuperview()
        }
        content.choseDelegate = self
        content.collectionView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: payBoardHeight, right: 0)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
     // Pass the selected object to the new view c@objc ontroller.
    }
    */

}

//MARK: - --------------CollectionSelectedChangedProtocol--------------
extension FFsscViewController:CollectionSelectedChangedProtocol,SSCCountCountable{
    
    func betCountDidChanged(count: Int) {
        self.payBoardVC?.msgLabel.text = "已选择\(count)注"
    }
    
    func selectedChanged(in collectionView: UICollectionView) {
        
        let selectedIndexPaths = collectionView.indexPathsForSelectedItems
        
        self.updateSelectedIndex(with: selectedIndexPaths)
        
    }

    
    
}

//MARK: - --------------类中类--------------
extension FFsscViewController{
    struct PlayMethod {
        /// 玩法类型
        var type:BetMethod
        /// 投注方式
        var way:BetWay
    }
    
    /// 玩法类型
    enum BetMethod {
        case wuxing
        case sixing
        case sanxing
        case erxing
        case douniu
        case teshuhao
        case daxiaodanshuang
        case longhu
        case quwei
        case renxuan
        case budingwei
        case dingweidan
        var name:String{
            switch self {
            case .wuxing:
                return "五星"
            case .sixing:
                return "四星"
            case .sanxing:
                return "三星"
            case .erxing:
                return "二星"
            case .douniu:
                return "斗牛"
            case .teshuhao:
                return "特殊号"
            case .daxiaodanshuang:
                return "大小单双"
            case .longhu:
                return "龙虎"
            case .quwei:
                return "趣味"
            case .renxuan:
                return "任选"
            case .budingwei:
                return "不定号"
            case .dingweidan:
                return "定位胆"
            }
        }
        /// 是几星的玩法（五星，四星等）
        var starCount:Int{
            switch self {
            case .wuxing:
                return 5
            case .sixing:
                return 4
            case .sanxing:
                return 3
            case .erxing:
                return 2
            default:
                return 0
            }
        }
    }
    
    /// 投注方式
    enum BetWay {
        case fushi
        case zuhe
        var name:String{
            switch self {
            case .fushi:
                return "复式"
            default:
                return "复式"
            }
        }
        
        var groupName:String{
            switch self {
            case .fushi,.zuhe:
                return "五星直选"
            default:
                return "直选"
            }
        }
    }
//
//    enum Wanfa {
//
//        enum Wuxing {
//            enum Wuxingzhixuan {
//                case fushi
//                case danshi
//                case zuhe
//
//                func contentViewController() -> UIViewController {
//                    switch self {
//                    case .fushi:
//                        return
//                    default:
//                        <#code#>
//                    }
//                }
//            }
//            enum Wuxingzuxuan {
//                case zuxuan120
//                case zuxuan60
//                case zuxuan30
//                case zuxuan20
//                case zuxuan10
//                case zuxuan5
//            }
//        }
//
//        enum Sixing {
//            enum Housizhixuan {
//                case fushi
//                case danshi
//                case zuhe
//            }
//            enum Housizuxuan {
//                case zu24
//                case zu12
//                case zu6
//                case zu4
//            }
//            enum Qiansizhixuan {
//                case fushi
//                case danshi
//                case zuhe
//            }
//            enum Qiansizuxuan {
//                case zuxuan24
//                case zuxuan12
//                case zuxuan6
//                case zuxuan4
//            }
//        }
//
//    }
    
    
    
}
