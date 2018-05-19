//
//  PromotionDetailViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/4/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class PromotionDetailViewController: BaseSubViewController {

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
        self.navigationItem.title = TEXT.TITLE_DETAIL_PROMOTION
        // viewContainer
        self.view.backgroundColor = .white
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        let text: [AttributedTextBlock] = [
            .header1("GIÁ SỐC MỪNG ĐẠI LỄ 30/4 - 1/5"),
            .normal("GIẢM GIÁ CỰC SỐC lên đến 30% dịch vụ TỔNG ĐÀI ẢO nhân dịp Lễ 30/4 - 1/5"),
            
            .header2("Điều kiện khuyến mại:"),
            .normal("Áp dụng khi đăng ký mới dịch vụ tối thiểu 12 tháng"),
            .normal("Thời gian ưu đãi: Từ 26/04 đến 06/05/2018"),
            .normal("P.A Việt Nam tự tin khuyến khích khách hàng thay đổi tổng đài truyền thống hiện tại sang  TỔNG ĐÀI ẢO của P.A Việt Nam bởi:"),
            
            .header2("Tiết kiệm thời gian - chi phí:"),
            .list("Không tốn chi phí đầu tư, quản lý tổng đài, nhân sự bảo trì hệ thống"),
            .list("Thời gian triển khai nhanh chóng"),
            .list("Gọi nội bộ miễn phí, tiết kiệm 50% phí điện thoại"),
            .list("Hỗ trợ ghi âm lời chào, ghi âm cuộc gọi"),
            .list("Thực hiện được các cuộc gọi hội nghị"),
            
            .header2("Giữ chân khách hàng:"),
            .list("Không giới hạn cuộc gọi đồng thời, không lo bận máy, mất khách hàng"),
            .list("Dễ dàng mở rộng số máy nhánh"),
            .list("Dễ dàng tích hợp với các ứng dụng, hệ thống quản lý khách hàng"),
            
            .header2("An toàn bảo mật:"),
            .list("Dễ dàng quản lý, giám sát chất lượng cuộc gọi, ghi âm cuộc gọi, quản lý cước phí chi tiết từng user"),
            .list("Kết nối ổn định, hệ thống bảo mật cuộc gọi cao"),
            
            .header2("Liên hệ P.A Việt Nam để được tư vấn miễn phí:"),
            .list("HCM: 028-6256 3737 || Hà Nội: 024-7307 3737"),
            .list("Hotline: 1900 9477"),
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
