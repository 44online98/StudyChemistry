//
//  NotifyTableViewCell.swift
//  PAVietNam
//
//  Created by SSN on 4/4/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class NotifyTableViewCell: UITableViewCell {
    @IBOutlet weak var flagView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        let sizeFlagView: CGFloat = 12
        //
        flagView.frame = CGRect.init(x: MARGIN/2, y: MARGIN*3/2 , width: sizeFlagView, height: sizeFlagView)
        flagView.clipsToBounds = true
        flagView.cornerRadius = sizeFlagView/2
        //
        titleLabel.frame = CGRect.init(x: sizeFlagView + MARGIN, y: MARGIN, width: self.width - sizeFlagView - MARGIN*2, height: titleLabel.height)
        //
        descriptionLabel.frame = CGRect.init(x: titleLabel.left, y: titleLabel.bottom, width: titleLabel.width, height: descriptionLabel.height)
    }
    
    func adjustView(notify: NotifyModel) {
        flagView.isHidden = notify.isRead
        titleLabel.text = notify.title
        descriptionLabel.text = notify.description
    }
}
