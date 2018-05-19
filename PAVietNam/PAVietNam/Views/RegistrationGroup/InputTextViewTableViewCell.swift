//
//  InputTextViewTableViewCell.swift
//  PAVietNam
//
//  Created by SSN on 4/24/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

protocol InputTextViewTableViewCellDelegate: class {
    func updateTextView(value: String, input: InputModel)
}

class InputTextViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    weak var delegate: InputTextViewTableViewCellDelegate?
    var input = InputModel()
    
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
        // textView
        textView.frame = CGRect.init(x: MARGIN, y: titleLabel.bottom + MARGIN/2, width: self.width - MARGIN*2, height: textView.height)
        textView.clipsToBounds = true
        textView.layer.cornerRadius = MARGIN
        textView.borderWidth = 0.5
        textView.borderColor = AppColor.GRAY_COLOR
    }
    
    func adjustView(input: InputModel) {
        self.input = input
        // titleLabel
        let attributedString = NSMutableAttributedString(string: input.title)
        attributedString.addAttributes([NSAttributedStringKey.foregroundColor: AppColor.MAIN_COLOR], range: (input.title as NSString).range(of: "*"))
        titleLabel.attributedText = attributedString
        // textView
        textView.toolbarPlaceholder = input.title.replacingOccurrences(of: " *", with: "")
        textView.delegate = self
        textView.text = input.placeholder
        textView.textColor = AppColor.GRAY_COLOR
    }
    
    @objc func textViewDidEndTyping(textView: UITextView){
        guard let _text = textView.text else {
            return
        }
        delegate?.updateTextView(value: _text, input: self.input)
    }
}

extension InputTextViewTableViewCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(textViewDidEndTyping), object: textView)
        self.perform(#selector(textViewDidEndTyping), with: textView, afterDelay: 0.5)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.textColor == AppColor.GRAY_COLOR) {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text.isEmpty) {
            textView.text = self.input.placeholder
            textView.textColor = AppColor.GRAY_COLOR
        }
    }
}
