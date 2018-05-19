//
//  GiftCollectionViewCell.swift
//  PAVietNam
//
//  Created by SSN on 5/8/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class GiftCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //
        self.layer.masksToBounds = true
        self.cornerRadius = MARGIN
        self.borderWidth = 1
        self.borderColor = UIColor.lightGray.withAlphaComponent(0.5)
        //
        productImageView.frame = CGRect.init(x: (self.width - 100)/2, y: MARGIN,
                                             width: 100, height: 100)
        titleLabel.frame = CGRect.init(x: 0, y: productImageView.bottom + MARGIN,
                                       width: self.width, height: titleLabel.height)
        pointLabel.frame = CGRect.init(x: MARGIN/2, y: titleLabel.bottom + MARGIN,
                                       width: self.width/2 , height: pointLabel.height)
        changeButton.frame = CGRect.init(x: self.width/2 + MARGIN/2, y: titleLabel.bottom + MARGIN,
                                         width: self.width/2 - MARGIN, height: changeButton.height)
        changeButton.clipsToBounds = true
        changeButton.cornerRadius = MARGIN
    }
    
    func adjustView(image: String, title: String, point: String) {
        productImageView.image = UIImage.init(named: image)
        titleLabel.text = title
        pointLabel.text = point + " Điểm"
    }

}
