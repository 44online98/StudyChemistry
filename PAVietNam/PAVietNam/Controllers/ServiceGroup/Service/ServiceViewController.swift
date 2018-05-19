//
//  ServiceViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/3/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class ServiceViewController: BaseViewController {
    
    fileprivate lazy var tableView: UITableView = { [unowned self] in
        $0.dataSource = self
        $0.delegate = self
        $0.rowHeight = 44
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectionIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectionIndexPath, animated: animated)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        self.definesPresentationContext = true
        // title
        self.navigationItem.title = TEXT.TITLE_SERVICE
        // viewContainer
        self.view.backgroundColor = .white
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        // add rightBarButtonItem
        let cartButton: Button = Button.init(image: UIImage.init(named: "icon_cart"),
                                             tintColor: AppColor.MAIN_COLOR)
        cartButton.frame = CGRect.init(x: 0, y: 0, width: SIZE_BUTTON, height: SIZE_BUTTON)
        cartButton.action { (cartButton) in
            let cartsView = CartsViewController()
            self.navigationController?.pushViewController(cartsView, animated: true)
        }
        let orderButton: Button = Button.init(image: UIImage.init(named: "icon_order"),
                                              tintColor: AppColor.MAIN_COLOR)
        orderButton.frame = CGRect.init(x: 0, y: 0, width: SIZE_BUTTON, height: SIZE_BUTTON)
        orderButton.action { (orderButton) in
            let ordersView = OrdersViewController()
            self.navigationController?.pushViewController(ordersView, animated: true)
        }
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem.init(customView: cartButton),
            UIBarButtonItem.init(customView: orderButton)
        ]
        // tableView
        self.tableView.register(UINib(nibName: "LabelTableViewCell",bundle: nil), forCellReuseIdentifier: "LabelTableViewCell")
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
}

// MARK: - UITableViewDelegate
extension ServiceViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let  titleString = MENU.SERVICE[0].rows[indexPath.row].title
        switch indexPath.row {
        case 0:
            let initializingServiceView = InitializingServiceViewController()
            initializingServiceView.titleString = titleString
            self.navigationController?.pushViewController(initializingServiceView, animated: true)
            break
        case 1:
            let serviceListView = ServiceListViewController()
            serviceListView.titleString = titleString
            self.navigationController?.pushViewController(serviceListView, animated: true)
            break
        case 2:
            let servicesExpireSoonView = ServicesExpireSoonViewController()
            servicesExpireSoonView.titleString = titleString
            self.navigationController?.pushViewController(servicesExpireSoonView, animated: true)
            break
        default:
            let initializingServiceView = InitializingServiceViewController()
            initializingServiceView.titleString = titleString
            self.navigationController?.pushViewController(initializingServiceView, animated: true)
            break
        }
    }
}

// MARK: - UITableViewDataSource
extension ServiceViewController : UITableViewDataSource {
    // setup tableViewCell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let  rows = MENU.SERVICE[section].rows
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: indexPath) as! LabelTableViewCell
        let rows = MENU.SERVICE[indexPath.section].rows
        cell.adjustView(image: rows[indexPath.row].image,
                        title: rows[indexPath.row].title)
        return cell
    }
}
