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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItems = [ UIBarButtonItem(image : UIImage(named: "icon_menu"),
                                                                   style : .plain,
                                                                   target: nil,
                                                                   action: #selector(SWRevealViewController.revealToggle(_:)))]
        title = "Home"
        let equation_1 = MTMathUILabel()
        equation_1.frame = CGRect(x: 20, y: 20, width: UIScreen.main.bounds.size.width, height: 40)
        equation_1.latex = "H_2 + \\frac{1}{2}O_2 \\to H_2O"
        self.view.addSubview(equation_1)
        
        let equation_2 = MTMathUILabel()
        equation_2.frame = CGRect(x: 20, y: 80, width: UIScreen.main.bounds.size.width, height: 40)
        equation_2.latex = "2Al + \\frac{3}{2}O_2 \\to Al_2O_3"
        self.view.addSubview(equation_2)
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
        // Dispose of any resources that can be recreated.
    }

}
