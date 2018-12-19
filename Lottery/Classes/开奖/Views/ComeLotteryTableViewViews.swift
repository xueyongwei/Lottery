//
//  ComeLotteryTableViewViews.swift
//  Lottery
//
//  Created by 黄丹 on 2018/12/18.
//  Copyright © 2018 薛永伟. All rights reserved.
//

import Foundation

//MARK: - --------------类中类--------------
extension ComeLotteryTableViewController{
    class BaseComeLotteryCell:CodeLayoutTableViewCell{
        /// 上期开奖数据
        var lastPrizeNumber: String = ""{
            didSet{
                let numbers:[String] = lastPrizeNumber.components(separatedBy: ",")
                XYWDebugLog(numbers, type: .info)
                updateUIWith(datas: numbers)
            }
        }
        
        func updateUIWith(datas:[String]){
            
        }
        /// 添加一个气泡button
        fileprivate func resultViewAddBubbleBtn(frame:CGRect,tag:Int){
            let btn = UIButton.bubbleBtn(frame: frame)
            btn.isUserInteractionEnabled = false
            btn.tag = tag
            resultView.addSubview(btn)
        }
        
        lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.text = "这里是标题"
            label.textColor = UIColor.init(rgb: 0x333333)
            label.font = UIFont.systemFont(ofSize: 14)
            return label
        }()
        lazy var iconImgView: UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            view.image = UIImage.init(named: "placeholder")
            return view
        }()
        lazy var timeLabel: UILabel = {
            let label = UILabel()
            label.text = "2018-12-10 21:40:30"
            label.textColor = UIColor.init(rgb: 0x999999)
            label.font = UIFont.systemFont(ofSize: 10)
            return label
        }()
        lazy var descLabel: UILabel = {
            let label = UILabel()
            label.text = "第20181010期"
            label.font = UIFont.systemFont(ofSize: 10)
            label.textColor = UIColor.init(rgb: 0x999999)
            return label
        }()
        lazy var resultView: UIView = {
            let view = UIView()
            return view
        }()
        
        override func codeCustomSubviews() {
            contentView.addSubview(iconImgView)
            iconImgView.snp.makeConstraints { (make) in
//                make.centerY.equalToSuperview()
                make.top.equalToSuperview().offset(10)
                make.left.equalToSuperview().offset(18)
                make.width.height.equalTo(50)
            }
            
            contentView.addSubview(titleLabel)
            titleLabel.snp.makeConstraints { (make) in
                make.left.equalTo(iconImgView.snp.right).offset(5)
                make.top.equalTo(iconImgView.snp.top).offset(0)
                make.height.equalTo(22)
            }
            
            contentView.addSubview(timeLabel)
            timeLabel.snp.makeConstraints { (make) in
                make.right.equalToSuperview().offset(-5)
                make.top.equalTo(titleLabel.snp.top).offset(0)
                make.height.equalTo(22)
            }
            
            contentView.addSubview(descLabel)
            descLabel.snp.makeConstraints { (make) in
//                make.top.equalTo(titleLabel.snp.bottom).offset(5)
                make.bottom.equalTo(iconImgView.snp.bottom).offset(0)
                make.left.equalTo(titleLabel.snp.left).offset(0)
                make.height.equalTo(15)
            }
            
            contentView.addSubview(resultView)
            resultView.snp.makeConstraints { (make) in
                make.top.equalTo(descLabel.snp.bottom).offset(5)
                make.left.equalTo(titleLabel.snp.left).offset(0)
                make.right.equalToSuperview().offset(0)
                make.bottom.equalToSuperview().offset(0)
            }
        }
        
    }
    
    /// 时时彩
    class ComeRedBullNumberCollectionCell:BaseComeLotteryCell{
        
        override func updateUIWith(datas: [String]) {
            for i in 0..<10 {
                let btn = self.resultView.viewWithTag(100 + i) as! UIButton
                if i < datas.count - 1{
                    btn.isHidden = false
                    btn.setTitle(datas[i], for: .normal)
                }else{
                    btn.isHidden = true
                }
            }
        }
        
        override func codeCustomSubviews() {
            super.codeCustomSubviews()
            for i in 0..<10{
                let frame = CGRect.init(x: 25 * i, y: 0, width: 20, height: 20)
                
                let btn = UIButton.bubbleBtn(frame: frame)
                btn.tag = 100 + i
                btn.isUserInteractionEnabled = false
                resultView.addSubview(btn)
            }
        }
        
    }
    /// PK10
    class ComePK10CollectionCell:BaseComeLotteryCell{
        
    }
    /// 11选5
    class Come11xuan5CollectionCell:BaseComeLotteryCell{
        
    }
    /// 快3
    class ComeKuaisanCollectionCell:BaseComeLotteryCell{
        
    }
    /// 六合彩
    class Come6hecaiCollectionCell:BaseComeLotteryCell{
        
    }
    /// PC蛋蛋
    class ComePcdandanCollectionCell:BaseComeLotteryCell{
        
    }
    /// 分分28
    class ComeAdd3Equal1CollectionCell:BaseComeLotteryCell{
        override func updateUIWith(datas: [String]) {
            for i in 0..<datas.count{
                let data = datas[i]
                let btn = self.resultView.viewWithTag(100 + i) as! UIButton
                btn.setTitle(data, for: .normal)
            }
        }
        override func codeCustomSubviews() {
            super.codeCustomSubviews()
            var frame = CGRect.init(x: 0, y: 0, width: 20, height: 20)
            
            resultViewAddBubbleBtn(frame: frame, tag: 100)
            frame = frame.offsetBy(dx: 20, dy: 0)
            
            resultView.addSubview(UILabel.opreateLabel(frame: frame, text: "+"))
            frame = frame.offsetBy(dx: 20, dy: 0)
            resultViewAddBubbleBtn(frame: frame, tag: 101)
            frame = frame.offsetBy(dx: 20, dy: 0)
            
            resultView.addSubview(UILabel.opreateLabel(frame: frame, text: "+"))
            frame = frame.offsetBy(dx: 20, dy: 0)
            resultViewAddBubbleBtn(frame: frame, tag: 102)
            frame = frame.offsetBy(dx: 20, dy: 0)
            
            resultView.addSubview(UILabel.opreateLabel(frame: frame, text: "="))
            frame = frame.offsetBy(dx: 20, dy: 0)
            resultViewAddBubbleBtn(frame: frame, tag: 103)
            frame = frame.offsetBy(dx: 20, dy: 0)
            
        }
    }
    
    
}



