//
//  ServiceTableViewCell.swift
//  PAVietNam
//
//  Created by SSN on 4/13/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.frame = CGRect.init(x: MARGIN*2, y: MARGIN/2,
                                      width: self.width - MARGIN*2, height: nameLabel.height)
        infoLabel.frame = CGRect.init(x: MARGIN*2, y: nameLabel.bottom + MARGIN/2,
                                             width: nameLabel.width, height: infoLabel.height)
        dateLabel.frame = CGRect.init(x: MARGIN*2, y: infoLabel.bottom + MARGIN/2,
                                       width: nameLabel.width, height: dateLabel.height)
    }
    
    func adjustView(name: String, info: String, startDate: String, endDate: String) {
        nameLabel.text = name
        infoLabel.text = info
        dateLabel.text = String(format: "%@ - %@", startDate, endDate)
    }
    
    func adjustView(name: String, code: String, level: String) {
        nameLabel.text = name
        infoLabel.text = code
        dateLabel.text = level
    }
}

