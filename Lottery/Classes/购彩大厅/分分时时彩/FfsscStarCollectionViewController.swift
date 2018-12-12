//
//  FfsscStarCollectionViewController.swift
//  Lottery
//
//  Created by 薛永伟 on 2018/12/12.
//  Copyright © 2018年 薛永伟. All rights reserved.
//

import UIKit

class FfsscStarCollectionViewController: UICollectionViewController ,UICollectionViewDelegateFlowLayout,CollectionChoseable{

    enum Star {
        case five
        case four
        case three
        case two
        case one
    }
    
    var dataSource = [Star]()
    
    weak var choseDelegate:CollectionSelectedChangedProtocol?
    
    //MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.backgroundColor = UIColor.white
        dataSource = [.five,.four,.three,.two,.one]
        
        // Register cell classes
        self.collectionView.allowsMultipleSelection = true
        self.collectionView!.register(NumberRoundCollectionViewCell.self, forCellWithReuseIdentifier: "NumberRoundCollectionViewCell")
        self.collectionView.register(QdxdsqCollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "QdxdsqCollectionHeader")
        
        // Do any additional setup after loading the view.
    }


    //MARK: - --------------UICollectionViewDataSource--------------
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.dataSource.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NumberRoundCollectionViewCell", for: indexPath) as! NumberRoundCollectionViewCell
    
        cell.numberBtn.setTitle("\(indexPath.item)", for: .normal)
    
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return section == 0 ? CGSize.init(width: collectionView.width, height: 60.0) : CGSize.init(width: collectionView.width, height: 30.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "QdxdsqCollectionHeader", for: indexPath)
             return header
        }else{
            return UICollectionReusableView()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.choseDelegate?.selectedChanged(in: collectionView)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        self.choseDelegate?.selectedChanged(in: collectionView)
    }

}
//MARK: - --------------类中类--------------
extension FfsscStarCollectionViewController {
    
}
