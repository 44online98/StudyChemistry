//
//  HostingPricingViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/19/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class HostingPricingViewController: BaseSubViewController {
    
    var pageMenu : CAPSPageMenu?
    var titleString = String()
    var hostingPricing = [HostingPricingModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // rightBarButtonItem
        self.hostingPricing = ResponseModel(JSON: RESPONSE.HOSTING_PRICING)!.hostingPricing
        self.setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        // title
        self.navigationItem.title = titleString
        // viewContainer
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        // add rightBarButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "icon_info"), style: .plain, target: self, action: #selector(self.onPressInfoButton(_:)))
        //
        var controllerArray : [UIViewController] = []
        for element in self.hostingPricing {
            let subPricingViewController = SubPricingViewController()
            subPricingViewController.title = element.level
            subPricingViewController.desc = element.description
            subPricingViewController.pricings = element.pricings
            controllerArray.append(subPricingViewController)
        }
        
        // Customize menu (Optional)
        let parameters: [AnyHashable : Any] = [
            CAPSPageMenuOptionSelectionIndicatorHeight: 2,
            CAPSPageMenuOptionSelectionIndicatorColor: AppColor.MAIN_COLOR,
            CAPSPageMenuOptionScrollMenuBackgroundColor: UIColor.white,
            CAPSPageMenuOptionBottomMenuHairlineColor: AppColor.GRAY_COLOR,
            CAPSPageMenuOptionMenuMargin: 20.0,
            CAPSPageMenuOptionMenuHeight: 44.0,
            CAPSPageMenuOptionSelectedMenuItemLabelColor: AppColor.MAIN_COLOR,
            CAPSPageMenuOptionUnselectedMenuItemLabelColor: AppColor.GRAY_COLOR,
            CAPSPageMenuOptionMenuItemFont: UIFont(name: "HelveticaNeue-Bold", size: 19.0)!,
            CAPSPageMenuOptionMenuItemSeparatorPercentageHeight: 0.1,
            CAPSPageMenuOptionUseMenuLikeSegmentedControl: true,
            CAPSPageMenuOptionMenuItemSeparatorRoundEdges: true,
            ]
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray,
                                frame: CGRect(x: 0, y: STATUSBAR_HEIGHT + NAVBAR_HEIGHT, width: view.width, height: view.height - STATUSBAR_HEIGHT),
                                options: parameters)
        
        // Optional delegate
        pageMenu!.delegate = self
        self.view.addSubview(pageMenu!.view)
    }
    
    // MARK: - Action Method
    
    @objc func onPressInfoButton(_ button:UIBarButtonItem!){
        let alert = UIAlertController(style: .actionSheet)
        
        let text: [AttributedTextBlock] = [
            .normal(""),
            .header1("Bảng giá Đại lý"),
            .header2("Trở thành đại lý của P.A Việt Nam quý khách sẽ được hỗ trợ toàn diện. Chương trình quản lý bằng phần mềm chuyên nghiệp, hiện đại, dễ sử dụng giúp quý khách dễ dàng tập trung kinh doanh phát triển doanh số cao nhất"),
            .list("Cơ hội kiếm tiền tốt nhất khi bán lại toàn bộ sản phẩm của P.A Việt Nam."),
            .list("Toàn quyền chủ động giá bán lại dịch vụ và đươc chiết khấu dihcj vụ cực kỳ hấp dẫn đến 35%."),
            .list("Công cụ sử dụng dễ dàng, control panel logo riêng cho đại lý để phát triển thương hiệu."),
            .list("Đăng ký ONLINE tên miền Quốc Tế và Việt Nam, Hosting, Email, ... `Active ngay lập tức`."),
            .list("Nạp tiền trực tuyến với nhiều loại thẻ trong và ngoài nước."),
            .list("Được hỗ trợ chuyên nghiệp 24/7 thông qua Hotline: 1900.9477."),
            ]
        alert.addTextViewer(text: .attributedText(text))
        alert.addAction(title: "OK", style: .cancel)
        alert.show()
    }
}

extension HostingPricingViewController: CAPSPageMenuDelegate {
    func didMove(toPage controller: UIViewController, index: Int) {
        //        print("did move to page", index)
    }
    
    func willMove(toPage controller: UIViewController, index: Int) {
        //        print("will move to page", index)
    }
}

