
//
//  LotteryCollectionViewController.swift
//  Lottery
//
//  Created by 薛永伟 on 2018/12/17.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import UIKit


class LotteryCollectionViewController: UICollectionViewController {

    var lotteryList = [HomeFeedCollectionViewController.Lottery]()
    
    var cate:LotteryCategory = .ssc
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.bounces = false

        self.collectionView.backgroundColor = UIColor.white
        

        // Register cell classes
        self.collectionView!.register(HomeLotteryCollectionCell.self, forCellWithReuseIdentifier: "HomeLotteryCollectionCell")

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.lotteryList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeLotteryCollectionCell", for: indexPath) as! HomeLotteryCollectionCell
        let lottery = self.lotteryList[indexPath.item]
        cell.titleLabel.text = lottery.name
        cell.imgView.sd_setImage(with: URL.init(string: lottery.icon), placeholderImage: UIImage.init(named: "placeholder"))
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
extension LotteryCollectionViewController{
    class HomeLotteryCollectionCell:CodeLayoutCollectionViewCell{
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
                make.height.equalTo(45)
                make.width.equalTo(45)
            }
            contentView.addSubview(titleLabel)
            titleLabel.snp.makeConstraints { (make) in
                make.bottom.left.right.equalToSuperview()
            }
        }
        
    }
}
