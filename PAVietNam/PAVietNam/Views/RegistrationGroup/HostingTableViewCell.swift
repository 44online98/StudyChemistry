//
//  HostingTableViewCell.swift
//  PAVietNam
//
//  Created by SSN on 4/14/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class HostingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var hostingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        chooseButton.isSelected = selected
        // Configure the view for the selected state
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        // chooseButton
        chooseButton.setImage(UIImage(named: "icon_uncheck"), for: .normal)
        chooseButton.setImage(UIImage(named: "icon_check"), for: .selected)
        chooseButton.setImage(UIImage(named: "icon_check"), for: .highlighted)
        chooseButton.frame = CGRect.init(x: MARGIN, y: (self.height - SIZE_BUTTON)/2, width: SIZE_BUTTON, height: SIZE_BUTTON)
        // hostingLabel
        hostingLabel.frame = CGRect.init(x: SIZE_BUTTON + MARGIN*2, y: MARGIN, width: self.width - SIZE_BUTTON - MARGIN*3, height: hostingLabel.height)
    }
    
    func adjustView(hosting: String) {
        hostingLabel.text = hosting
    }
    
    func adjustView_2(hosting: String) {
        hostingLabel.numberOfLines = 2
        hostingLabel.text = hosting
        hostingLabel.sizeToFit()
    }
}
