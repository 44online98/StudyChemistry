//
//  LoginViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/2/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgetButton: UIButton!
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Layout Method
    func setupView() {
        imageView.frame = CGRect.init(x: (kScreenWidth - 200)/2, y: 100,
                                      width: 200, height: 103)
        usernameTextField.frame = CGRect.init(x: kMargin*2, y: imageView.bottom + kMargin*6,
                                              width: kScreenWidth - kMargin*4, height: 44)
        passwordTextField.frame = CGRect.init(x: kMargin*2, y: usernameTextField.bottom + kMargin,
                                              width: kScreenWidth - kMargin*4, height: 44)
        
        loginButton.frame = CGRect.init(x: 50, y: passwordTextField.bottom + kMargin*2,
                                        width: kScreenWidth - 100, height: 44)
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = kMargin
        
        forgetButton.frame = CGRect.init(x: 50, y: loginButton.bottom + kMargin*2,
                                         width: kScreenWidth - 100, height: 44)
    }
    
    // MARK: - Action Method
    @IBAction func onPressLoginButton(_ sender: Any) {
        
        let dataSource  = self.initDataSourceLogin()
        self.startActivityIndicator()
        ZServiceManager.request(dataSource) { (response) in
            self.stopActivityIndicator()
            debugPrint(response.response)
            let tabBarController = BaseTabbarController()
            self.navigationController?.pushViewController(tabBarController, animated: true)
        }
    }
    
    @IBAction func onPressForgetButton(_ sender: Any) {
        
    }
}

extension LoginViewController {
    
    func initDataSourceLogin() -> ZServiceDataSource {
        let dataSource: ZServiceDataSource = ZServiceDataSource()
        dataSource.url = "/auth/login/customer"
        dataSource.method = .POST
        return dataSource
    }
}
