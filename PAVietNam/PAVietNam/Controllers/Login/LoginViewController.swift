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
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
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
        // viewContainer
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        imageView.frame = CGRect.init(x: (view.width - 200)/2, y: 100,
                                      width: 200, height: 103)
        //
        usernameLabel.frame = CGRect.init(x: MARGIN*2, y: imageView.bottom + MARGIN*6, width: view.width - MARGIN*4, height: usernameLabel.height)
        usernameTextField.frame = CGRect.init(x: MARGIN*2, y: usernameLabel.bottom + MARGIN,
                                              width: usernameLabel.width, height: 44)
        usernameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        usernameTextField.addBottomBorderWithColor(color: AppColor.GRAY_COLOR, width: 0.5)
        //
        passwordLabel.frame = CGRect.init(x: usernameTextField.left, y: usernameTextField.bottom + MARGIN, width: usernameLabel.width, height: passwordLabel.height)
        passwordTextField.frame = CGRect.init(x: usernameTextField.left, y: passwordLabel.bottom + MARGIN,
                                              width: usernameLabel.width, height: 44)
        passwordTextField.rightButton(showText: "HIỆN", hideText: "ẨN")
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        passwordTextField.addBottomBorderWithColor(color: AppColor.GRAY_COLOR, width: 0.5)
        //
        loginButton.frame = CGRect.init(x: MARGIN*6, y: passwordTextField.bottom + MARGIN*2,
                                        width: view.width - MARGIN*12, height: 44)
        loginButton.clipsToBounds = true
        loginButton.cornerRadius = MARGIN
        loginButton.setEnabled(enabled: false)
        //
        forgetButton.frame = CGRect.init(x: loginButton.left, y: loginButton.bottom + MARGIN*2,
                                         width: loginButton.width, height: 44)
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        if (usernameTextField.text?.count > 0 && passwordTextField.text?.count > 0){
            loginButton.setEnabled(enabled: true)
        } else {
            loginButton.setEnabled(enabled: false)
        }
    }
    
    // MARK: - Action Method
    @IBAction func onPressLoginButton(_ sender: Any) {
//        let dataSource  = self.initDataSourceLogin()
//        self.startActivityIndicator()
//        ZServiceManager.request(dataSource) { (response) in
//            guard let _response = response.response else {
//                return
//            }
//            let responseModel = ResponseModel(JSON: _response)!
//            debugPrint(responseModel)
//            self.stopActivityIndicator()
//            let tabBarController = BaseTabbarController()
//            self.navigationController?.pushViewController(tabBarController, animated: true)
//        }
        let tabBarController = BaseTabbarController()
        self.navigationController?.pushViewController(tabBarController, animated: true)
    }
    
    @IBAction func onPressForgetButton(_ sender: Any) {

        let forgetPasswordView = ForgetPasswordViewController()
        self.navigationController?.pushViewController(forgetPasswordView, animated: true)
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
