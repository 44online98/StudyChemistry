//
//  InputSegmentTableViewCell.swift
//  PAVietNam
//
//  Created by SSN on 4/19/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

protocol InputSegmentTableViewCellDelegate: class {
    func updateSegment(value: String, indexPath: IndexPath)
}

class InputSegmentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var segmented: UISegmentedControl!
    
    weak var delegate: InputSegmentTableViewCellDelegate?
    var input = InputModel()
    var indexPath = IndexPath()
    
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
        // titleLabel
        titleLabel.frame = CGRect.init(x: MARGIN, y: MARGIN/2, width: self.width - MARGIN*2, height: 18)
        // segmented
        segmented.tintColor = AppColor.MAIN_COLOR
        segmented.frame = CGRect.init(x: (self.width - 250)/2, y: titleLabel.bottom + MARGIN/2, width: 250, height: segmented.height)
        segmented.addTarget(self, action: #selector(segmentedDidChange(segmented:)), for: .valueChanged)
    }
    
    func adjustView(input: InputModel, indexPath: IndexPath) {
        self.input = input
        self.indexPath = indexPath
        // titleLabel
        let attributedString = NSMutableAttributedString(string: input.title)
        attributedString.addAttributes([NSAttributedStringKey.foregroundColor: AppColor.MAIN_COLOR], range: (input.title as NSString).range(of: "*"))
        titleLabel.attributedText = attributedString
        // segmented
        segmented.segmentTitles = input.datas
        let index = self.input.datas.index(of: input.value)
        segmented.selectedSegmentIndex = (index != nil) ? index! : 0
    }
    
    @objc func segmentedDidChange(segmented: UISegmentedControl){
        let index = segmented.selectedSegmentIndex
        delegate?.updateSegment(value: input.datas[index], indexPath: self.indexPath)
    }
}
