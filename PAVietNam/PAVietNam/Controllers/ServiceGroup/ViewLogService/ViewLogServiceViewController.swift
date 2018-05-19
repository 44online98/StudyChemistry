//
//  ViewLogServiceViewController.swift
//  PAVietNam
//
//  Created by SSN on 5/7/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class ViewLogServiceViewController: BaseSubViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        self.navigationItem.title = "Xem log dịch vụ"
    }
}
