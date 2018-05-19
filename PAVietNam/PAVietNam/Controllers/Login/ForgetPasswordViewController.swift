//
//  ForgetPasswordViewController.swift
//  PAVietNam
//
//  Created by SSN on 5/4/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!

    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        // backButton
        let backButton = UIBarButtonItem(image: UIImage(named: "left_arrow"),
                                         style: .plain,
                                         target: navigationController,
                                         action: #selector(UINavigationController.popViewController(animated:)))
        backButton.imageInsets = UIEdgeInsetsMake( 0, -12, 0, 0)
        navigationItem.leftBarButtonItem = backButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Layout Method
    func setupView() {
        // title
        self.navigationItem.title = "Tìm Lại Mật Khẩu"
        // viewContainer
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        //
        usernameLabel.frame = CGRect.init(x: MARGIN*2, y: MARGIN, width: view.width - MARGIN*4, height: usernameLabel.height)
        usernameTextField.frame = CGRect.init(x: MARGIN*2, y: usernameLabel.bottom + MARGIN,
                                              width: usernameLabel.width, height: 44)
        usernameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        usernameTextField.addBottomBorderWithColor(color: AppColor.GRAY_COLOR, width: 0.5)
        //
        emailLabel.frame = CGRect.init(x: usernameTextField.left, y: usernameTextField.bottom + MARGIN, width: usernameLabel.width, height: emailLabel.height)
        emailTextField.frame = CGRect.init(x: usernameTextField.left, y: emailLabel.bottom + MARGIN,
                                              width: usernameLabel.width, height: 44)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        emailTextField.addBottomBorderWithColor(color: AppColor.GRAY_COLOR, width: 0.5)
        //
        confirmButton.frame = CGRect.init(x: MARGIN*6, y: emailTextField.bottom + MARGIN*2,
                                        width: view.width - MARGIN*12, height: 44)
        confirmButton.clipsToBounds = true
        confirmButton.cornerRadius = MARGIN
        confirmButton.setEnabled(enabled: false)

    }
    
    @objc func textFieldDidChange(textField: UITextField){
        if (usernameTextField.text?.count > 0 && emailTextField.text?.count > 0){
            confirmButton.setEnabled(enabled: true)
        } else {
            confirmButton.setEnabled(enabled: false)
        }
    }
    
    // MARK: - Action Method
    @IBAction func onPressConfirmButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
