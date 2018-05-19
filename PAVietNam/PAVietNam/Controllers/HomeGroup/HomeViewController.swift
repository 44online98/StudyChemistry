//
//  HomeViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/2/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    var pageMenu : CAPSPageMenu?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.setValue(false, forKey: "hidesShadow")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        
        // title
        self.navigationItem.title = TEXT.TITLE_HOME
        // viewContainer
        self.view.backgroundColor = .white
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        // Initialize view controllers to display and place in array
        var controllerArray : [UIViewController] = []
        
        let notifyView : NotifyViewController = NotifyViewController()
        notifyView.parentNavigationController = self.navigationController
        notifyView.title = TEXT.NOTIFY
        
        controllerArray.append(notifyView)
        
        let promotionView : PromotionViewController = PromotionViewController()
        promotionView.parentNavigationController = self.navigationController
        promotionView.title = TEXT.PROMOTION
        controllerArray.append(promotionView)
 
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
                                frame: CGRect(x: 0, y: STATUSBAR_HEIGHT + NAVBAR_HEIGHT,
                                              width: view.width,
                                              height: view.height - STATUSBAR_HEIGHT),
                                options: parameters)
        // Optional delegate
        pageMenu!.delegate = self
        
        self.view.addSubview(pageMenu!.view)
    }
}

extension HomeViewController: CAPSPageMenuDelegate {
    // Uncomment below for some navbar color animation fun using the new delegate functions
    
    func didMove(toPage controller: UIViewController, index: Int) {
//        print("did move to page", index)
        
        //        var color : UIColor = UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)
        //        var navColor : UIColor = UIColor(red: 17.0/255.0, green: 64.0/255.0, blue: 107.0/255.0, alpha: 1.0)
        //
        //        if index == 1 {
        //            color = UIColor.orangeColor()
        //            navColor = color
        //        } else if index == 2 {
        //            color = UIColor.grayColor()
        //            navColor = color
        //        } else if index == 3 {
        //            color = UIColor.purpleColor()
        //            navColor = color
        //        }
        //
        //        UIView.animateWithDuration(0.5, animations: { () -> Void in
        //            self.navigationController!.navigationBar.barTintColor = navColor
        //        }) { (completed) -> Void in
        //            println("did fade")
        //        }
    }
    
    func willMove(toPage controller: UIViewController, index: Int) {
//        print("will move to page", index)
        
        //        var color : UIColor = UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)
        //        var navColor : UIColor = UIColor(red: 17.0/255.0, green: 64.0/255.0, blue: 107.0/255.0, alpha: 1.0)
        //
        //        if index == 1 {
        //            color = UIColor.orangeColor()
        //            navColor = color
        //        } else if index == 2 {
        //            color = UIColor.grayColor()
        //            navColor = color
        //        } else if index == 3 {
        //            color = UIColor.purpleColor()
        //            navColor = color
        //        }
        //
        //        UIView.animateWithDuration(0.5, animations: { () -> Void in
        //            self.navigationController!.navigationBar.barTintColor = navColor
        //        }) { (completed) -> Void in
        //            println("did fade")
        //        }
    }
}
