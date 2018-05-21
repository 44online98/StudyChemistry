//
//  ShopViewController.swift
//  PAWebShop
//
//  Created by SSN on 5/21/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class ShopViewController: BaseViewController {

    // MARK: Circle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        // add leftBarButtonItems
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(image : UIImage(named: "icon_menu"), style : .plain, target: nil, action: #selector(SWRevealViewController.revealToggle(_:)))]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // add panGesture
        // add tapGesture
        let revealController : SWRevealViewController = self.revealViewController()
        self.view.addGestureRecognizer(revealController.panGestureRecognizer())
        self.view.addGestureRecognizer(revealController.tapGestureRecognizer())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
