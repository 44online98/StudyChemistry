//
//  DomainTableViewCell.swift
//  PAVietNam
//
//  Created by SSN on 4/6/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

protocol DomainTableViewCellDelegate : class {
    func delete(domain: DomainModel)
    func update(value: String, domain: DomainModel)
}

class DomainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var deleteButton: UIButton!
    
    weak var delegate : DomainTableViewCellDelegate?
    var domain = DomainModel()
    var indexPath = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        // textField
        textField.frame = CGRect.init(x: MARGIN, y: MARGIN, width: self.width - SIZE_BUTTON - MARGIN*3,
                                      height: textField.height)
        textField.addBottomBorderWithColor(color: AppColor.GRAY_COLOR, width: 0.5)
        // leftView
        let leftView = UIView.init(frame: CGRect.init(x: 0, y: 0,
                                                      width: MARGIN, height: textField.height))
        textField.leftView = leftView
        textField.leftViewMode = .always
        // add Action
        textField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        //deleteButton
        deleteButton.frame = CGRect.init(x: self.width - SIZE_BUTTON - MARGIN, y: (self.height - SIZE_BUTTON)/2,
                                         width: SIZE_BUTTON, height: SIZE_BUTTON)
    }
    
    func adjustView(domain: DomainModel, placeholder: String) {
        self.domain = domain
        self.textField.placeholder = placeholder
        self.textField.text = domain.domain
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        self.deleteButton.isHidden = (textField.text?.count == 0)
    }
    
    @objc func textFieldDidEndTyping(textField: UITextField){
        guard let _text = textField.text else {
            return
        }
        delegate?.update(value: _text, domain: self.domain)
    }
    
    @IBAction func onPressDeleteButton(_ sender: Any) {
        delegate?.delete(domain: self.domain)
    }
}

extension DomainTableViewCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(textFieldDidEndTyping), object: textField)
        self.perform(#selector(textFieldDidEndTyping), with: textField, afterDelay: 0.5)
        return true
    }
}
