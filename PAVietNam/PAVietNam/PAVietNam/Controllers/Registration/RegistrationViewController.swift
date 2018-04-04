//
//  RegistrationViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/3/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class RegistrationViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var datas = ["Đăng Ký Tên Miền", "Gia Hạn Dịch Vụ", "Transfer Tên Miền", "Đăng Ký Hosting", "Đăng Ký  Mail Server", "Đăng Ký  Mail Server Riêng", "Đăng Ký VPS", "Đăng Ký Server Riêng", "Thuê Chỗ Đặt Server", "Đăng Ký Tổng Đài Ảo", "Đăng Ký Web30s", "Đăng Ký SSL", "Đăng Ký SMS Brandname", "Đăng Ký Google Adword", "Đăng Ký Facebook", "Đăng Ký Dịch Vụ Phụ", "Đăng Ký Nhiều Domain + Host", "Active Đơn Hàng", "Đăng Ký Đại Lý", "Huỷ Đăng Ký Lại Tên Miền", "Chuyển Nhượng Tên Miền", "Hàng Đợi Domain"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = TEXT.TITLE_REGISTRATION
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

extension RegistrationViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = NotifyDetailViewController()
        self.navigationController?.pushViewController(detailView, animated: true)
    }
}

extension RegistrationViewController : UITableViewDataSource {
    
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
