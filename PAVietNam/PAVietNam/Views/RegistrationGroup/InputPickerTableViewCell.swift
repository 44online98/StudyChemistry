//
//  InputPickerTableViewCell.swift
//  PAVietNam
//
//  Created by SSN on 4/19/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

protocol InputPickerTableViewCellDelegate: class {
    func updatePicker(value: String, indexPath: IndexPath)
}

class InputPickerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: IQDropDownTextField!
    
    weak var delegate: InputPickerTableViewCellDelegate?
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
        // textField
        textField.frame = CGRect.init(x: MARGIN, y: titleLabel.bottom + MARGIN/2, width: self.width - MARGIN*2, height: textField.height)
        textField.addBottomBorderWithColor(color: AppColor.GRAY_COLOR, width: 0.5)
    }
    
    func adjustView(input: InputModel, indexPath: IndexPath) {
        self.input = input
        self.indexPath = indexPath
        // titleLabel
        let attributedString = NSMutableAttributedString(string: input.title)
        attributedString.addAttributes([NSAttributedStringKey.foregroundColor: AppColor.MAIN_COLOR], range: (input.title as NSString).range(of: "*"))
        titleLabel.attributedText = attributedString
        // textField
        textField.toolbarPlaceholder = input.title.replacingOccurrences(of: " *", with: "")
        textField.placeholder = input.placeholder
        if (input.kind == "picker") {
            textField.isOptionalDropDown = false
            textField.itemList = input.datas
            // TODO
            // set value default for textField
//            textField.selectedItem = input.value
        } else {
            textField.dropDownMode = .datePicker
        }
    }
}

extension InputPickerTableViewCell : IQDropDownTextFieldDelegate {
    func textField(_ textField: IQDropDownTextField, didSelect date: Date?) {
        guard let _date = date else {
            return
        }
        print(_date as Any)
        self.delegate?.updatePicker(value: _date.dateString(), indexPath: self.indexPath)
    }
    func textField(_ textField: IQDropDownTextField, didSelectItem item: String?) {
        guard let _item = item else {
            return
        }
        print(_item as Any)
        self.delegate?.updatePicker(value: _item, indexPath: self.indexPath)
    }
}
