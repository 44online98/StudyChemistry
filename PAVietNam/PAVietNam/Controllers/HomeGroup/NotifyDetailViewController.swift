//
//  NotifyDetailViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/4/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class NotifyDetailViewController: BaseSubViewController {

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
        self.navigationItem.title = TEXT.TITLE_DETAIL_NOTIFY
        // viewContainer
        self.view.backgroundColor = .white
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        let text: [AttributedTextBlock] = [
            .header1("Bảo trì toàn bộ hệ thống trên shost001, 003, 004 và 005"),
            
            .header2("GIẢM GIÁ CỰC SỐC lên đến 30% dịch vụ TỔNG ĐÀI ẢO nhân dịp Lễ 30/4 - 1/5"),
            .normal("Từ 21h00 đến 22h00, Thứ sáu ngày 12/01/2018"),
            .normal("Từ 21h00 đến 22h00, Thứ bảy ngày 13/01/2018"),
            .normal("Chú ý: Trong thời gian bảo trì hệ thống, dịch vụ Quý khách đang sử dụng trên các server trên sẽ bị gián đoạn. Quý khách vui lòng không sử dụng Hosting hoặc up dữ liệu vào thời gian trên."),
            .normal("Sau thời gian bảo trì, hệ thống sẽ hoạt động bình thường trở lại."),
            ]
        textView.attributedText = text.map { $0.text }.joined(separator: "\n")
        self.view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints  = false
        
        // addConstraints
        let views = ["textView": textView] as [String : Any]
        self.view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[textView]-0-|",
            options: [],
            metrics: nil,
            views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-(top)-[textView]-0-|",
            options: [],
            metrics: ["top": STATUSBAR_HEIGHT + NAVBAR_HEIGHT],
            views: views))
    }
}

