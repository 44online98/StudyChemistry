//
//  CartTableViewCell.swift
//  PAVietNam
//
//  Created by SSN on 4/10/18.
//  Copyright © 2018 SSN. All rights reserved.
//
protocol CartTableViewCellDelegate : class {
    func delete(cart: CartModel)
    func update(cart: CartModel, indexPath: IndexPath)
}
class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var domainTextField: UITextField!
    @IBOutlet weak var timeTextField: IQDropDownTextField!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var noteButton: UIButton!
    
    weak var delegate : CartTableViewCellDelegate?
    var cart = CartModel()
    var times = ["1 tháng", "3 tháng", "6 tháng", "1 năm", "2 năm"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        // kindLabel
        kindLabel.frame = CGRect.init(x: MARGIN, y: MARGIN, width: self.width - MARGIN*2, height: kindLabel.height)
        // domainTextField
        domainTextField.frame = CGRect.init(x: MARGIN, y: kindLabel.bottom + MARGIN/2,
                                            width: self.width - 60 - SIZE_BUTTON - MARGIN*4,
                                            height: domainTextField.height)
        domainTextField.addBottomBorderWithColor(color: AppColor.GRAY_COLOR, width: 0.5)
        // leftView
        let leftView = UIView.init(frame: CGRect.init(x: 0, y: 0,
                                                      width: MARGIN, height: domainTextField.height))
        domainTextField.leftView = leftView
        domainTextField.leftViewMode = .always
        // add Action
        domainTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        // timeTextField
        timeTextField.frame = CGRect.init(x: domainTextField.right + MARGIN, y: domainTextField.top, width: 60, height: timeTextField.height)
        // textField
        timeTextField.toolbarPlaceholder = "Chọn Thời Gian"
        timeTextField.isOptionalDropDown = false
        timeTextField.itemList = times
        timeTextField.addBottomBorderWithColor(color: AppColor.GRAY_COLOR, width: 0.5)
        // deleteButton
        deleteButton.frame = CGRect.init(x: self.width - SIZE_BUTTON - MARGIN, y: (self.height - SIZE_BUTTON)/2, width: SIZE_BUTTON, height: SIZE_BUTTON)
        // noteButton
        noteButton.frame = CGRect.init(x: MARGIN, y: domainTextField.bottom + MARGIN/2 , width: self.width - MARGIN*2, height: noteButton.height)
    }
    
    func adjustView(cart: CartModel) {
        self.cart = cart
        kindLabel.text = cart.kind
        domainTextField.text = cart.domain
        //timeTextField
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        deleteButton.isHidden = (textField.text?.count == 0)
    }
    
    @IBAction func onPressDeleteButton(_ sender: Any) {
        delegate?.delete(cart: self.cart)
    }
    
    @IBAction func onPressNoteButton(_ sender: Any) {
        print("onPressNoteButton")
    }
}

extension CartTableViewCell : UITextFieldDelegate {
    
}
