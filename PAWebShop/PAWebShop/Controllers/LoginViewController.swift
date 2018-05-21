//
//  LoginViewController.swift
//  PAWebShop
//
//  Created by SSN on 5/21/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onPressLoginButton(_ sender: Any) {
        // navShopView
        let shopView = ShopViewController()
        let navShopView: UINavigationController = UINavigationController(rootViewController: shopView)
        // navMenuView
        let menuView = MenuViewController()
        let navMenuView: UINavigationController = UINavigationController(rootViewController: menuView)
        
        let drawer = SWRevealViewController.init(rearViewController: navMenuView, frontViewController: navShopView)
        self.navigationController?.pushViewController(drawer!, animated: true)
    }
}
