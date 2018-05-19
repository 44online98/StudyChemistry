//  InputTextFieldTableViewCell.swift
//  PAVietNam
//
//  Created by SSN on 4/16/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

protocol InputTextFieldTableViewCellDelegate: class {
    func update(value: String, indexPath: IndexPath)
}

class InputTextFieldTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: InputTextFieldTableViewCellDelegate?
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
        textField.text = input.value
        if (input.kind == "password") {
            textField.isSecureTextEntry = true
            textField.rightButton(showText: "HIỆN", hideText: "ẨN")
        }
        if (input.kind == "number") {
            textField.keyboardType = .numberPad
        }
        if (input.kind == "email") {
            textField.keyboardType = .emailAddress
        }
        if (input.kind == "notEdit") {
            textField.isUserInteractionEnabled = false
            textField.backgroundColor = AppColor.LIGHT_COLOR
        }
    }
    
    @objc func textFieldDidEndTyping(textField: UITextField){
        guard let _text = textField.text else {
            return
        }
        delegate?.update(value: _text, indexPath: self.indexPath)
    }
    
}

extension InputTextFieldTableViewCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(textFieldDidEndTyping), object: textField)
        self.perform(#selector(textFieldDidEndTyping), with: textField, afterDelay: 0.5)
        return true
    }
}
