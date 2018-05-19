//
//  BaseTabbarController.swift
//  PAVietNam
//
//  Created by SSN on 4/2/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import Foundation
import UIKit

class BaseTabbarController: UITabBarController {
    var  baseTabbarController: UITabBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabbar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupTabbar() {
        // set viewControllers
        // 1
        let homeView: HomeViewController = HomeViewController()
        let navHomeView: UINavigationController = UINavigationController(rootViewController: homeView)
        navHomeView.tabBarItem.image = UIImage(named: "icon_home")
        navHomeView.tabBarItem.title = TEXT.HOME
        // 2
        let registrationView: RegistrationViewController = RegistrationViewController()
        let navRegistrationView: UINavigationController = UINavigationController(rootViewController: registrationView)
        navRegistrationView.tabBarItem.image = UIImage(named: "icon_registration")
        navRegistrationView.tabBarItem.title = TEXT.REGISTRATION
        // 3
        let serviceView: ServiceViewController = ServiceViewController()
        let navServiceView: UINavigationController = UINavigationController(rootViewController: serviceView)
        navServiceView.tabBarItem.image = UIImage(named: "icon_service")
        navServiceView.tabBarItem.title = TEXT.SERVICE
        // 4
        let supportView: SupportViewController = SupportViewController()
        let navSupportView: UINavigationController = UINavigationController(rootViewController: supportView)
        navSupportView.tabBarItem.image = UIImage(named: "icon_support")
        navSupportView.tabBarItem.title = TEXT.SUPPORT
        // 5
        let accountView: AccountViewController = AccountViewController()
        let navAccountView: UINavigationController = UINavigationController(rootViewController: accountView)
        navAccountView.tabBarItem.image = UIImage(named: "icon_account")
        navAccountView.tabBarItem.title = TEXT.ACCOUNT
        //
        self.viewControllers = [navHomeView, navRegistrationView, navServiceView, navSupportView, navAccountView]
        //
        self.tabBar.tintColor = AppColor.MAIN_COLOR
        //
        self.tabBarController?.selectedIndex = 0
    }
}
