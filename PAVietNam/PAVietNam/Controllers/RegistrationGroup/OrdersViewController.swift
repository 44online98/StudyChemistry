//
//  OrdersViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/17/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class OrdersViewController: BaseSubViewController {
    
    fileprivate lazy var tableView: UITableView = { [unowned self] in
        $0.dataSource = self
        $0.delegate = self
        $0.rowHeight = 170
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
        self.navigationItem.title = TEXT.TITLE_ORDERS
        // viewContainer
        self.view.backgroundColor = .white
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        // tableView
        self.tableView.register(UINib(nibName: "OrderTableViewCell",bundle: nil), forCellReuseIdentifier: "OrderTableViewCell")
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
    func showActionSheetOptions() {
        let alert = UIAlertController(style: .actionSheet, title: "F5C5F8C92C", message: "")
        alert.addAction(UIAlertAction.init(title: "Đóng đơn hàng", style: .default, handler: { (alert) in

        }))
        alert.addAction(UIAlertAction.init(title: "Xem trên P.A", style: .default, handler: { (alert) in

        }))
        alert.addAction(UIAlertAction.init(title: "Link qua support", style: .default, handler: { (alert) in

        }))
        alert.addAction(UIAlertAction.init(title: "Sửa đơn hàng", style: .default, handler: { (alert) in
            print("Sửa đơn hàng")
        }))
        alert.addAction(UIAlertAction.init(title: "Tạo báo giá", style: .default, handler: { (alert) in
            print("Tạo báo giá")
        }))
        alert.addAction(UIAlertAction.init(title: "Xem bản khai", style: .default, handler: { (alert) in
            print("Xem bản khai")
        }))
        alert.addAction(UIAlertAction.init(title: "Sửa bản khai", style: .default, handler: { (alert) in
            print("Sửa bản khai")
        }))
        alert.addAction(UIAlertAction.init(title: "Active đơn hàng", style: .default, handler: { (alert) in
            print("Active đơn hàng")
        }))
        alert.addAction(title: "Cancel", style: .cancel)
        alert.show()
    }
}

extension OrdersViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showActionSheetOptions()
    }
}

extension OrdersViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
        return cell
    }
    
}
