//
//  ServiceListViewController.swift
//  PAVietNam
//
//  Created by SSN on 5/4/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class ServiceListViewController: BaseSubViewController {
    
    var titleString = String()
    
    var services =  [
        ["name": "pcodertest.com", "info": "Cheap #0 - 180.000VND/12 tháng", "startDate": "06/11/2017", "endDate": "06/11/2018", "autoRenewable": true],
        ["name": "truyện.vn", "info": "Domain", "startDate": "07/06/2017", "endDate": "19/04/2018", "autoRenewable": false],
        ["name": "quảngcáo.vn", "info": "Domain", "startDate": "07/06/2017", "endDate": "19/04/2018", "autoRenewable": false],
        ["name": "giá.vn", "info": "Domain", "startDate": "07/06/2017", "endDate": "19/04/2018", "autoRenewable": false]]
    
    fileprivate lazy var tableView: UITableView = { [unowned self] in
        $0.dataSource = self
        $0.delegate = self
        $0.rowHeight = 80
        $0.bounces = true
        $0.backgroundColor = .clear
        $0.tableFooterView = UIView()
        $0.sectionIndexBackgroundColor = .clear
        $0.sectionIndexTrackingBackgroundColor = .clear
        return $0
        }(UITableView(frame: .zero, style: .plain))
    
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
        // add rightBarButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "icon_filter"), style: .plain, target: self, action: #selector(self.onPressFilterButton(_:)))
        // viewContainer
        self.view.backgroundColor = .white
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        // tableView
        self.tableView.register(UINib(nibName: "ServiceTableViewCell",bundle: nil), forCellReuseIdentifier: "ServiceTableViewCell")
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints  = false
        // addConstraints
        let views = ["tableView": tableView] as [String : Any]
        self.view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[tableView]-0-|",
            options: [],
            metrics: nil,
            views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-0-[tableView]-0-|",
            options: [],
            metrics: nil,
            views: views))
    }
    
    // MARK: - Action Method
    func showActionSheetOptions(title: String) {
        let alert = UIAlertController(style: .actionSheet, title: title, message: "")
        alert.addAction(UIAlertAction.init(title: "Gia hạn Hosting", style: .default, handler: { (alert) in
            let cartsView = CartsViewController()
            self.navigationController?.pushViewController(cartsView, animated: true)
        }))
        alert.addAction(UIAlertAction.init(title: "Xem thông tin", style: .default, handler: { (alert) in
            let inforServiceView = InforServiceViewController()
            self.navigationController?.pushViewController(inforServiceView, animated: true)
        }))
        alert.addAction(UIAlertAction.init(title: "Xem log dịch vụ", style: .default, handler: { (alert) in
            let viewLogService = ViewLogServiceViewController()
            self.navigationController?.pushViewController(viewLogService, animated: true)
        }))
        alert.addAction(UIAlertAction.init(title: "Ghi chú dịch vụ", style: .default, handler: { (alert) in
            print("Ghi chú dịch vụ")
        }))
        alert.addAction(UIAlertAction.init(title: "Đổi password", style: .default, handler: { (alert) in
            let changePassword = ChangePasswordViewController()
            changePassword.titleString = "Đổi password"
            self.navigationController?.pushViewController(changePassword, animated: true)
        }))
        alert.addAction(UIAlertAction.init(title: "Gửi username/password", style: .default, handler: { (alert) in
            print("Gửi username/password")
        }))
        alert.addAction(UIAlertAction.init(title: "Gửi mail đến khách hàng", style: .default, handler: { (alert) in
            let sendMailToCustomer = SendMailToCustomerViewController()
            sendMailToCustomer.titleString = "Gửi mail đến khách hàng"
            self.navigationController?.pushViewController(sendMailToCustomer, animated: true)
        }))
        alert.addAction(UIAlertAction.init(title: "Nâng cấp dịch vụ", style: .default, handler: { (alert) in
            print("Nâng cấp dịch vụ")
        }))
        alert.addAction(UIAlertAction.init(title: "Quản lý dịch vụ", style: .default, handler: { (alert) in
            print("Quản lý dịch vụ")
        }))
        alert.addAction(title: "Cancel", style: .cancel)
        alert.show()
    }
    
    @objc func onPressFilterButton(_ button: UIBarButtonItem!){
        let filterView = FilterViewController()
        let navFilterView = UINavigationController.init(rootViewController: filterView)
        navFilterView.modalPresentationStyle = .popover
        navFilterView.popoverPresentationController?.barButtonItem = button
        let heightWidth = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height);
        navFilterView.preferredContentSize = CGSize(width: heightWidth, height: heightWidth)
        navFilterView.popoverPresentationController?.delegate = self
        self.present(navFilterView, animated: true, completion: nil)
    }
}

extension ServiceListViewController : UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        self.view.endEditing(true)
    }
}

extension ServiceListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        self.showActionSheetOptions(title: services[indexPath.row]["name"] as! String)
    }
}

extension ServiceListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceTableViewCell", for: indexPath) as! ServiceTableViewCell
        let service = services[indexPath.row]
        cell.adjustView(name: service["name"] as! String,
                        info: service["info"] as! String,
                        startDate: service["startDate"] as! String,
                        endDate: service["endDate"] as! String)
        return cell
    }
}
