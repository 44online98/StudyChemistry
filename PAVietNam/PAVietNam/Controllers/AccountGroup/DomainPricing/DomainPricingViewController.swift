//
//  DomainPricingViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/19/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class DomainPricingViewController: BaseSubViewController {
    
    var pageMenu : CAPSPageMenu?
    var titleString = String()
    var domainPricing = [HostingPricingModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // rightBarButtonItem
        self.domainPricing = ResponseModel(JSON: RESPONSE.DOMAIN_PRICING)!.domainPricing
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
        //
        var controllerArray : [UIViewController] = []
        for element in self.domainPricing {
            let subPricingViewController = SubDomainPricingViewController()
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
}

extension DomainPricingViewController: CAPSPageMenuDelegate {
    func didMove(toPage controller: UIViewController, index: Int) {
        //        print("did move to page", index)
    }
    
    func willMove(toPage controller: UIViewController, index: Int) {
        //        print("will move to page", index)
    }
}
