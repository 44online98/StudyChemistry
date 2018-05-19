//
//  ViewLogVATViewController.swift
//  PAVietNam
//
//  Created by SSN on 5/9/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class ViewLogVATViewController: BaseSubViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var titleString = String()
    
    var services =  [
        ["name": "pcodertest.com", "info": "Cheap #0 - 180.000VND/12 tháng", "startDate": "06/11/2017", "endDate": "06/11/2018", "autoRenewable": true],
        ["name": "truyện.vn", "info": "Domain", "startDate": "07/06/2017", "endDate": "19/04/2018", "autoRenewable": false],
        ["name": "quảngcáo.vn", "info": "Domain", "startDate": "07/06/2017", "endDate": "19/04/2018", "autoRenewable": false],
        ["name": "giá.vn", "info": "Domain", "startDate": "07/06/2017", "endDate": "19/04/2018", "autoRenewable": false]]
    
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
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        // tableView
        let heightTableView: CGFloat = view.height - STATUSBAR_HEIGHT - NAVBAR_HEIGHT - TABBAR_HEIGHT
        self.tableView.register(UINib(nibName: "ServiceTableViewCell",bundle: nil), forCellReuseIdentifier: "ServiceTableViewCell")
        self.tableView.frame = CGRect.init(x: 0, y: 0, width: view.width, height: heightTableView)
        self.tableView.tableFooterView = UIView()
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
        filterView.kind = "VAT"
        let navFilterView = UINavigationController.init(rootViewController: filterView)
        navFilterView.modalPresentationStyle = .popover
        navFilterView.popoverPresentationController?.barButtonItem = button
        let heightWidth = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height);
        navFilterView.preferredContentSize = CGSize(width: heightWidth, height: heightWidth)
        navFilterView.popoverPresentationController?.delegate = self
        self.present(navFilterView, animated: true, completion: nil)
    }
}

extension ViewLogVATViewController : UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        self.view.endEditing(true)
    }
}

extension ViewLogVATViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showActionSheetOptions(title: services[indexPath.row]["name"] as! String)
    }
}

extension ViewLogVATViewController : UITableViewDataSource {
    
    // setup tableViewCell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.services.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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
