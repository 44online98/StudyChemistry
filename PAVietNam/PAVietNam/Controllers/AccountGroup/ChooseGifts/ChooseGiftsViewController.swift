//
//  ChooseGiftsViewController.swift
//  PAVietNam
//
//  Created by SSN on 5/8/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class ChooseGiftsViewController: BaseSubViewController {
    
    @IBOutlet weak var pointLabel   : UILabel!
    @IBOutlet weak var collectionView   : UICollectionView!
    
    var kCollectionViewHeight           : CGFloat = 0
    var kCollectionViewWidth            : CGFloat = 0
    
    let gifts = [ ["image": "product1", "title": "Loa", "point": "100"],
                  ["image": "product2", "title": "Dây sạc iPhone", "point": "200"],
                  ["image": "product3", "title": "Balo", "point": "300"],
                  ["image": "product4", "title": "Xá Xị Chương Dương", "point": "400"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupView(){
        // title
        self.navigationItem.title = "Đổi điểm lấy quà tặng"
        // viewContainer
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        // pointLabel
        pointLabel.frame = CGRect.init(x: MARGIN, y: 0, width: self.view.width - MARGIN*2, height: pointLabel.height)
        // setup collectionView
        kCollectionViewHeight = self.view.height - pointLabel.bottom - STATUSBAR_HEIGHT - NAVBAR_HEIGHT - TABBAR_HEIGHT
        kCollectionViewWidth  = self.view.width
        collectionView.frame = CGRect (x: 0 , y: pointLabel.bottom ,
                                       width: kCollectionViewWidth, height: kCollectionViewHeight)
        collectionView.register(UINib(nibName: "GiftCollectionViewCell",bundle: nil), forCellWithReuseIdentifier: "GiftCollectionViewCell")
        collectionView.showsVerticalScrollIndicator = false
    }
}

extension ChooseGiftsViewController : UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gifts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: GiftCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCollectionViewCell", for: indexPath)  as! GiftCollectionViewCell
        cell.adjustView(image: gifts[indexPath.row]["image"]!,
                        title: gifts[indexPath.row]["title"]!,
                        point: gifts[indexPath.row]["point"]!)
        return cell
    }
}

extension ChooseGiftsViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: kCollectionViewWidth/2 - MARGIN*2, height: 206)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
