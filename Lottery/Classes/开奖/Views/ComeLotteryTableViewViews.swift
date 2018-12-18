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
                make.centerY.equalToSuperview()
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
    
    class ComeSscCollectionCell:BaseComeLotteryCell{
        var numbers = [Int]()
        
        override func codeCustomSubviews() {
            super.codeCustomSubviews()
            for i in 0..<5{
                let btn = UIButton.init(type: .custom)
                
            }
        }
    }
    class ComePK10CollectionCell:BaseComeLotteryCell{
        
    }
    class Come11xuan5CollectionCell:BaseComeLotteryCell{
        
    }
    class ComeKuaisanCollectionCell:BaseComeLotteryCell{
        
    }
    class Come6hecaiCollectionCell:BaseComeLotteryCell{
        
    }
    class ComePcdandanCollectionCell:BaseComeLotteryCell{
        
    }
}

