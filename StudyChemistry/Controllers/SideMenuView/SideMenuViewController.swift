//
//  SideMenuViewController.swift
//  StudyChemistry
//
//  Created by Vinh on 4/24/17.
//  Copyright © 2017 VinhNH. All rights reserved.
//

import UIKit


class SideMenuViewController: UIViewController {
    @IBOutlet weak var containerView    : UIView!
    @IBOutlet weak var tableView        : UITableView!
    var baseTabbar       = UIViewController()
    var isBaseTabbar     : Bool = false
    
    // MARK: Circle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupView(){
        // setup containerView
        containerView.frame = CGRect(x: 0, y:  0, width: kScreenWidth, height: kScreenHeight )
        containerView.backgroundColor = COLOR.MAIN
        // init tableView
        tableView.frame = CGRect(x: 0, y: 20, width: kScreenWidth,
                                 height: 10 * 44 + 20)
        tableView.backgroundColor = .clear
        // tableView.isScrollEnabled = true
        // tableView.register(UINib(nibName: "MenuTableViewCell",bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension SideMenuViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealController : SWRevealViewController = self.revealViewController()
        switch indexPath.row {
        case 0:
            let mainView = MainViewController()
            let nvMainView = UINavigationController(rootViewController: mainView)
            revealController.setFront(nvMainView, animated: true)
            revealController.setFrontViewPosition(FrontViewPosition.left, animated: true)
            
        default:
            break
        }
    }
    
}
extension SideMenuViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "identifier"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        cell?.backgroundColor = .clear
        
        switch indexPath.row {
        case 0:
            cell?.textLabel?.textColor = .white
            cell?.textLabel?.text =  "Home"
        default:
            break
        }
        
        return cell!
    }
}

