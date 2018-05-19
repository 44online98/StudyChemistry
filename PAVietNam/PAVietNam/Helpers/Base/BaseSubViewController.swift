//
//  BaseSubViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/6/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import Foundation
import UIKit

class BaseSubViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // backButton
        let backButton = UIBarButtonItem(image: UIImage(named: "left_arrow"),
                                         style: .plain,
                                         target: navigationController,
                                         action: #selector(UINavigationController.popViewController(animated:)))
        backButton.imageInsets = UIEdgeInsetsMake( 0, -12, 0, 0)
        navigationItem.leftBarButtonItem = backButton
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        // dismissKeyboard
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - UIGestureRecognizerDelegate
extension BaseSubViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
