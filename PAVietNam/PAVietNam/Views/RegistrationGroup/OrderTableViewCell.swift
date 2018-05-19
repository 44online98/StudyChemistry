//
//  OrderTableViewCell.swift
//  PAVietNam
//
//  Created by SSN on 4/21/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var label_1: UILabel!
    @IBOutlet weak var label_2: UILabel!
    @IBOutlet weak var label_3: UILabel!
    @IBOutlet weak var label_4: UILabel!
    @IBOutlet weak var label_5: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        label_1.frame = CGRect.init(x: MARGIN, y: MARGIN*2, width: self.width - MARGIN*2, height: label_1.height)
        label_2.frame = CGRect.init(x: MARGIN, y: label_1.bottom + MARGIN, width: label_1.width, height: label_2.height)
        label_3.frame = CGRect.init(x: MARGIN, y: label_2.bottom + MARGIN, width: label_1.width, height: label_3.height)
        label_4.frame = CGRect.init(x: MARGIN, y: label_3.bottom + MARGIN, width: label_1.width, height: label_4.height)
        label_5.frame = CGRect.init(x: MARGIN, y: label_4.bottom + MARGIN, width: label_1.width, height: label_5.height)
    }
    
    func adjutView(text_1: String, text_2: String, text_3: String, text_4: String, text_5: String) {
        label_1.text = text_1
        label_2.text = text_2
        label_3.text = text_3
        label_4.text = text_4
        label_5.text = text_5
    }
}
