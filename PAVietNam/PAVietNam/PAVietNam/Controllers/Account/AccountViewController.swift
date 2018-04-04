//
//  AccountViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/2/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class AccountViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = TEXT.ACCOUNT
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onPressBackButton(_ sender: Any) {
        let loginView : LoginViewController = LoginViewController()
        let navLoginView: UINavigationController = UINavigationController(rootViewController: loginView)
        let window = UIApplication.shared.keyWindow
        window?.rootViewController = navLoginView
    }
}
