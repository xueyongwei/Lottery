//
//  HomeFeedViews.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/15.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import UIKit

extension HomeFeedCollectionViewController{
    //MARK: ----ReusableView
    class PlaceHolderHeader:CodeLayoutReusableView{
        override func codeCustomSubviews() {
            
        }
    }
    class TitleOnlyHeader:CodeLayoutReusableView{
        lazy var spLine: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.init(rgb: 0xEAEAEB)
            return view
        }()
        lazy var titleLabel: UILabel = {
            let view = UILabel()
            view.textAlignment = .left
            view.text = "热门彩票"
            view.font = UIFont.systemFont(ofSize: 17)
            return view
        }()
        
        override func codeCustomSubviews(){
            addSubview(titleLabel)
            titleLabel.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(18)
                make.left.equalToSuperview().offset(18)
            }
            addSubview(spLine)
//            spLine.isHidden = true
            spLine.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(0)
                make.left.equalToSuperview().offset(18)
                make.right.equalToSuperview().offset(-18)
                make.height.equalTo(1)
            }
        }
    }
    //MARK: ----CollectionCell
    
    class FuncItemCollectionCell:CodeLayoutCollectionViewCell{
        lazy var imgView: UIImageView = {
            let imgv = UIImageView()
            imgv.contentMode = .scaleAspectFit
            return imgv
        }()
        lazy var titleLabel: UILabel = {
            let view = UILabel()
            view.textColor = UIColor.init(rgb: 0x333333)
            view.font = UIFont.systemFont(ofSize: 12)
            view.textAlignment = .center
            return view
        }()
        
        override func codeCustomSubviews() {
            contentView.addSubview(imgView)
            imgView.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview()
                make.height.equalTo(36)
                make.width.equalTo(36)
            }
            contentView.addSubview(titleLabel)
            titleLabel.snp.makeConstraints { (make) in
                make.bottom.left.right.equalToSuperview()
            }
        }
        
    }
    class HotBLotteryCollectionCell:CodeLayoutCollectionViewCell{
        lazy var backView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.white
            view.layer.shadowColor = UIColor.init(rgb: 0x999999)?.cgColor
            view.layer.cornerRadius = 5
//            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOffset = CGSize.zero
            view.layer.shadowOpacity = 0.3
            view.layer.shadowRadius = 4
            return view
        }()
        lazy var imgView: UIImageView = {
            let imgv = UIImageView()
            imgv.contentMode = .scaleAspectFit
            return imgv
        }()
        lazy var titleLabel: UILabel = {
            let view = UILabel()
            view.textColor = UIColor.init(rgb: 0x333333)
            view.font = UIFont.systemFont(ofSize: 14)
            view.textAlignment = .left
            return view
        }()
        lazy var introductionLabel: UILabel = {
            let view = UILabel()
            view.textColor = UIColor.init(rgb: 0x999999)
            view.font = UIFont.systemFont(ofSize: 10)
            view.textAlignment = .left
            return view
        }()
        lazy var betMaxLabel: UILabel = {
            let view = UILabel()
            view.textColor = UIColor.init(rgb: 0xD33A31)
            view.font = UIFont.systemFont(ofSize: 11)
            view.textAlignment = .left
            return view
        }()
        
        override func codeCustomSubviews() {
            contentView.addSubview(backView)
            backView.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(5)
                make.right.equalToSuperview().offset(-5)
                make.top.equalToSuperview().offset(5)
                make.bottom.equalToSuperview().offset(-5)
            }
            contentView.addSubview(imgView)
            imgView.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-18)
                make.height.equalTo(45)
                make.width.equalTo(45)
            }
            contentView.addSubview(titleLabel)
            titleLabel.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(19)
                make.left.equalToSuperview().offset(16)
                make.right.equalTo(imgView.snp.left).offset(-5)
                make.height.equalTo(21)
            }
            contentView.addSubview(introductionLabel)
            introductionLabel.snp.makeConstraints { (make) in
                make.top.equalTo(titleLabel.snp.bottom).offset(3)
                make.left.equalTo(titleLabel.snp.left)
                make.width.equalTo(titleLabel.snp.width)
                make.height.equalTo(15)
            }
            contentView.addSubview(betMaxLabel)
            betMaxLabel.snp.makeConstraints { (make) in
                make.top.equalTo(introductionLabel.snp.bottom).offset(9)
                make.left.equalTo(titleLabel.snp.left)
                make.width.equalTo(betMaxLabel.snp.width)
            }
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
//            backView.layer.shadowPath = UIBezierPath.init(roundedRect: backView.bounds, cornerRadius: 5).cgPath
        }
    }
    
    //MARK: ----View
    
    /// 信息公告
    class NotiInfoView: CodeLayoutView{
        var message:String?{
            didSet{
                let view = UILabel()
                view.textAlignment = .center
                view.font = UIFont.systemFont(ofSize: 13)
                view.text = message
                marquequView.contentView = view
            }
        }
        fileprivate lazy var iconView: UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            view.image = UIImage.init(named: "home_公告")
            return view
        }()
        
        fileprivate lazy var marquequView: JXMarqueeView = {
            let marqueeView = JXMarqueeView()
            marqueeView.marqueeType = .left
            marqueeView.pointsPerFrame = 0.4
            
            //            marqueeView.contentMargin = 5
            //            marqueeView.backgroundColor = UIColor.red
            return marqueeView
        }()
        
        fileprivate lazy var righticonView: UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            view.image = UIImage.init(named: "home_右箭头")
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
            addSubview(righticonView)
            righticonView.snp.makeConstraints { (make) in
                make.right.equalToSuperview().offset(-16)
                make.centerY.equalToSuperview()
                make.width.equalTo(9)
                make.height.equalTo(9)
            }
            //            let view = UILabel()
            //            view.textAlignment = .center
            //            view.font = UIFont.systemFont(ofSize: 13)
            //            view.text = "asdfasdfasdfasdfsaf"
            //            marquequView.contentView = view
            addSubview(marquequView)
            marquequView.snp.makeConstraints { (make) in
                make.left.equalTo(iconView.snp.right).offset(7)
                make.right.equalTo(righticonView.snp.left).offset(-9)
                make.top.bottom.equalToSuperview()
            }
        }
        override func layoutSubviews() {
            super.layoutSubviews()
            
        }
    }
    
    /// 大图View
    class BigImageView: CodeLayoutView{
        lazy var imgView: UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            view.image = UIImage.init(named: "home_注单点击")
            view.clipsToBounds = true
            return view
        }()
        override func codeCustomSubviews(){
            addSubview(imgView)
            imgView.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(14)
                make.right.equalToSuperview().offset(-18)
                make.bottom.equalToSuperview().offset(-14)
                make.left.equalToSuperview().offset(18)
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
