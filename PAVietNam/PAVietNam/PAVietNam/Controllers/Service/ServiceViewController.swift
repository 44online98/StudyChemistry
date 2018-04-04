//
//  ServiceViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/3/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class ServiceViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var datas = ["Dịch Vụ Đang Khởi Tạo", "Dịch Vụ Đang Sử Dụng", "Dịch Vụ Sắp Hết Hạn", "Domain Transfer Out", "Domain Gia Hạn Tự Động", "Domain Chưa Xác Thực Email"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = TEXT.TITLE_SERVICE
        self.setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        self.tableView.register(UINib(nibName: "LabelTableViewCell",bundle: nil), forCellReuseIdentifier: "LabelTableViewCell")
        self.tableView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth,
                                           height: kScreenHeight - kStatusBarHeight - kTabBarHeight - kNavBarHeight)
    }
}

extension ServiceViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = NotifyDetailViewController()
        self.navigationController?.pushViewController(detailView, animated: true)
    }
}

extension ServiceViewController : UITableViewDataSource {
    
    // setup tableViewCell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: indexPath) as! LabelTableViewCell
        cell.adjustView(title: datas[indexPath.row])
        return cell
    }
}
