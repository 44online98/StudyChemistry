//
//  MainViewController.swift
//  StudyChemistry
//
//  Created by Vinh on 8/31/17.
//  Copyright © 2017 VinhNH. All rights reserved.
//

import UIKit
import iosMath

class MainViewController: BaseViewController {

    @IBOutlet weak var firstLabel: MTMathUILabel!
    @IBOutlet weak var secondLabel: MTMathUILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItems = [ UIBarButtonItem(image : UIImage(named: "icon_menu"),
                                                                   style : .plain,
                                                                   target: nil,
                                                                   action: #selector(SWRevealViewController.revealToggle(_:)))]
        title = "Home"
        firstLabel.latex = "H_2 + \\frac{1}{2}O_2 \\to H_2O"
        
        secondLabel.latex = "2Al + \\frac{3}{2}O_2 \\to Al_2O_3"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // add panGesture
        // add tapGesture
        let revealController : SWRevealViewController = self.revealViewController()
        self.view.addGestureRecognizer(revealController.panGestureRecognizer())
        self.view.addGestureRecognizer(revealController.tapGestureRecognizer())
    }

}
