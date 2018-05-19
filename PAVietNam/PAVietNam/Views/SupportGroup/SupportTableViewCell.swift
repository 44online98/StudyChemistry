//
//  SupportTableViewCell.swift
//  PAVietNam
//
//  Created by SSN on 4/11/18.
//  Copyright © 2018 SSN. All rights reserved.
//

class SupportTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCall: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberPhoneLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()

        imageCall.frame = CGRect.init(x: MARGIN*2, y: (self.height - SIZE_BUTTON)/2,
                                      width: SIZE_BUTTON, height: SIZE_BUTTON)
        titleLabel.frame = CGRect.init(x: imageCall.right + MARGIN*2, y: MARGIN,
                                       width: self.width - titleLabel.left, height: titleLabel.height)
        numberPhoneLabel.frame = CGRect.init(x: titleLabel.left, y: titleLabel.bottom + MARGIN/2,
                                             width: titleLabel.width, height: numberPhoneLabel.height)
        detailLabel.frame = CGRect.init(x: titleLabel.left, y: numberPhoneLabel.bottom + MARGIN/2,
                                        width: titleLabel.width, height: detailLabel.height)
    }
    
    func adjustView(title: String, numberPhone: String, detail: String) {
        titleLabel.text = title
        numberPhoneLabel.text = numberPhone
        detailLabel.text = detail
    }
}
