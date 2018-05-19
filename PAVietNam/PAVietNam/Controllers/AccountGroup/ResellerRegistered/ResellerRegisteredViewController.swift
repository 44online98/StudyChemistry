//
//  ResellerRegisteredViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/19/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class ResellerRegisteredViewController: BaseSubViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var titleString = String()
    
    var resellers =  [
        ["name": "Nguyễn Trần Hoàng Oanh", "code": "PA-180132", "level": "Cấp 4"],
        ["name": "Nguyễn Hữu Vinh", "code": "PA-421546", "level": "Cấp 3"],
        ["name": "Nguyễn Tiến Mạnh", "code": "PA-180132", "level": "Cấp 2"],
        ["name": "Nguyễn Thái Hiền", "code": "PA-421546", "level": "Cấp 1"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        // title
        self.navigationItem.title = titleString
        // viewContainer
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        // tableView
        let heightTableView: CGFloat = view.height - STATUSBAR_HEIGHT - NAVBAR_HEIGHT - TABBAR_HEIGHT
        self.tableView.register(UINib(nibName: "ServiceTableViewCell",bundle: nil), forCellReuseIdentifier: "ServiceTableViewCell")
        self.tableView.frame = CGRect.init(x: 0, y: STATUSBAR_HEIGHT + NAVBAR_HEIGHT, width: view.width, height: heightTableView)
        self.tableView.tableFooterView = UIView()
    }
}

extension ResellerRegisteredViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let resellerInformationView = ResellerInformationViewController()
        self.navigationController?.pushViewController(resellerInformationView, animated: true)
    }
}

extension ResellerRegisteredViewController : UITableViewDataSource {
    
    // setup tableViewCell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resellers.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceTableViewCell", for: indexPath) as! ServiceTableViewCell
        let reseller = resellers[indexPath.row]
        cell.adjustView(name: reseller["name"]!, code: reseller["code"]!, level: reseller["level"]!)
        return cell
    }
}
