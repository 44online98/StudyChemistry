//
//  ChangeLanguageTableViewCell.swift
//  PAVietNam
//
//  Created by SSN on 5/7/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class ChangeLanguageTableViewCell: UITableViewCell {
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectedButton: UIButton!
    
    var isChecked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectedButton.isSelected = selected
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        flagImageView.frame = CGRect.init(x: MARGIN, y: MARGIN, width: SIZE_BUTTON, height: SIZE_BUTTON)
        titleLabel.frame = CGRect.init(x: SIZE_BUTTON + MARGIN*2, y: 0, width: 200, height: titleLabel.height)
        selectedButton.frame = CGRect.init(x: self.width - MARGIN*2 - 20, y: (self.height - 20)/2, width: 20, height: 20)
        selectedButton.setImage(UIImage(named: "icon_uncheck"), for: .normal)
        selectedButton.setImage(UIImage(named: "icon_check"), for: .selected)
        selectedButton.setImage(UIImage(named: "icon_check"), for: .highlighted)
    }
    
    func adjustView(flagImage: String, title: String) {
        flagImageView.image = UIImage.init(named: flagImage)
        titleLabel.text = title
    }
}
