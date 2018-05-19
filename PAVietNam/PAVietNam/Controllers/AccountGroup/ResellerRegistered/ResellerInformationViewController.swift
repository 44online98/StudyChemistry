//
//  ResellerInformationViewController.swift
//  PAVietNam
//
//  Created by SSN on 5/10/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class ResellerInformationViewController: BaseSubViewController {
    
    fileprivate lazy var textView: UITextView = {
        $0.isEditable = false
        $0.isSelectable = true
        $0.backgroundColor = nil
        return $0
    }(UITextView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        // title
        self.navigationItem.title = "Thông Tin Đại Lý"
        // viewContainer
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        let text: [AttributedTextBlock] = [
            .normal("Tên đại lý: Nguyễn Trần Hoàng Oanh"),
            .normal("Username: PA-180132"),
            .normal("Mã support: PA-180132"),
            .normal("Điện thoại: 01645330370"),
            .normal("Email: muabantennmien123@gmail.com"),
            .normal("Địa chỉ: Hem 1041, Tran Xuan Soan, Quan 7"),
            .normal("Cấp:  4"),
            .normal("Trạng thái: Active"),
            ]
        textView.attributedText = text.map { $0.text }.joined(separator: "\n")
        textView.frame = CGRect.init(x: 0, y: STATUSBAR_HEIGHT + NAVBAR_HEIGHT, width: self.view.width,
                                     height: self.view.height - STATUSBAR_HEIGHT - NAVBAR_HEIGHT - TABBAR_HEIGHT)
        self.view.addSubview(textView)
    }
}
