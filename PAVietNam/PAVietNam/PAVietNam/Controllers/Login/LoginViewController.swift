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
        
        loginButton.frame = CGRect.init(x: kMargin*6, y: passwordTextField.bottom + kMargin*2,
                                        width: kScreenWidth - kMargin*12, height: 44)
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = kMargin
        
        forgetButton.frame = CGRect.init(x: kMargin*6, y: loginButton.bottom + kMargin*2,
                                         width: kScreenWidth - kMargin*12, height: 44)
    }
    
    // MARK: - Action Method
    @IBAction func onPressLoginButton(_ sender: Any) {
//        let dataSource  = self.initDataSourceLogin()
//        self.startActivityIndicator()
//        ZServiceManager.request(dataSource) { (response) in
//            self.stopActivityIndicator()
//            let tabBarController = BaseTabbarController()
//            self.navigationController?.pushViewController(tabBarController, animated: true)
//        }
        let tabBarController = BaseTabbarController()
        self.navigationController?.pushViewController(tabBarController, animated: true)
    }
    
    @IBAction func onPressForgetButton(_ sender: Any) {
//        // Select date
//        let alert = UIAlertController(style: .actionSheet, title: "Select date")
//        alert.addDatePicker(mode: .date, date: Date(), minimumDate: nil, maximumDate: Date()) { date in
//            debugPrint(date)
//        }
//        alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: { (alert) in
//
//        }))
//        alert.show()
//        // Picker View
//        let alert = UIAlertController(style: .actionSheet, title: "Picker View")
//
//        let frameSizes: [CGFloat] = (150...400).map { CGFloat($0) }
//        let pickerViewValues: [[String]] = [frameSizes.map { Int($0).description }]
//        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: frameSizes.index(of: 216) ?? 0)
//
//        alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
//            DispatchQueue.main.async {
//                UIView.animate(withDuration: 1) {
//                    vc.preferredContentSize.height = frameSizes[index.row]
//                }
//            }
//        }
//        alert.addAction(title: "Done", style: .cancel)
//        alert.show()
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
