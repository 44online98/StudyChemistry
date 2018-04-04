//
//  PromotionViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/3/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class PromotionViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var parentNavigationController : UINavigationController?
    
    var datas = ["Promotion + 123", "Promotion + 456", "Promotion + 789", "Promotion + 101112", "Promotion + 131415", "Promotion + 161718", "Promotion + 123", "Promotion + 456", "Promotion + 789", "Promotion + 101112", "Promotion + 131415", "Promotion + 161718", "Promotion + 123", "Promotion + 456", "Promotion + 789", "Promotion + 101112", "Promotion + 131415", "Promotion + 161718"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        self.tableView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth,
                                           height: kScreenHeight - kStatusBarHeight - kTabBarHeight - kNavBarHeight*2)
    }
}

extension PromotionViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = PromotionDetailViewController()
        self.parentNavigationController?.pushViewController(detailView, animated: true)
    }
}

extension PromotionViewController : UITableViewDataSource {
    
    // setup tableViewCell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "identifier"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        cell?.selectionStyle = .none
        cell?.textLabel?.textAlignment = .center
        cell?.textLabel?.text = datas[indexPath.row]
        return cell!
    }
}
