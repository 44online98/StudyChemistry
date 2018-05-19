//
//  RegistrationViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/3/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class RegistrationViewController: BaseViewController {
    
    private var filtered = [Section]()
    
    fileprivate lazy var searchController: UISearchController = { [unowned self] in
        $0.searchResultsUpdater = self
        $0.dimsBackgroundDuringPresentation = false
        $0.searchBar.tintColor = AppColor.MAIN_COLOR
        $0.searchBar.searchBarStyle = .minimal
        $0.searchBar.backgroundColor = .white
        $0.searchBar.textField?.textColor = .black
        $0.searchBar.textField?.clearButtonMode = .whileEditing
        return $0
        }(UISearchController(searchResultsController: nil))
    
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
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.tableHeaderView?.height = 56
        searchController.searchBar.sizeToFit()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        searchController.isActive = false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        // title
        self.navigationItem.title = TEXT.TITLE_REGISTRATION
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
        // replace tableHeaderView assignment with this
        if #available(iOS 11.0, *) {
            self.navigationItem.searchController = searchController
            // Search bar is always visible
            self.navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }
        self.definesPresentationContext = true
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
extension RegistrationViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let  titleString = activeSections[indexPath.section].rows[indexPath.row].title
        let indexPathRow = MENU.REGISTRATION[0].rows.index { (row) -> Bool in
            row.title.contains(titleString)
        }
        if (indexPathRow == nil) { return }
        switch indexPathRow {
        case 0, 1, 2, 17, 19, 20:
            let domainRegistrationView = DomainRegistrationViewController()
            domainRegistrationView.titleString = titleString
            self.navigationController?.pushViewController(domainRegistrationView, animated: true)
            break
        case 3, 11, 13, 14, 15:
            let hostingView = HostingRegistrationViewController()
            hostingView.titleString = titleString
            hostingView.topElements = ResponseModel(JSON: RESPONSE.HOSTINGS_VIEW)!.informationCustomer
            self.navigationController?.pushViewController(hostingView, animated: true)
            break
        case 4, 10:
            let hostingView = HostingRegistrationViewController()
            hostingView.titleString = titleString
            hostingView.topElements = ResponseModel(JSON: RESPONSE.MAILSERVER_VIEW)!.informationCustomer
            self.navigationController?.pushViewController(hostingView, animated: true)
            break
        case 5, 6, 7, 8, 12:
            let hostingView = HostingRegistrationViewController()
            hostingView.titleString = titleString
            hostingView.topElements = ResponseModel(JSON: RESPONSE.SERVER_VIEW)!.informationCustomer
            self.navigationController?.pushViewController(hostingView, animated: true)
            break
        case 9:
            let hostingView = HostingRegistrationViewController()
            hostingView.titleString = titleString
            hostingView.topElements = ResponseModel(JSON: RESPONSE.CALLCENTER_VIEW)!.informationCustomer
            self.navigationController?.pushViewController(hostingView, animated: true)
            break
        case 18:
            let createResellerView = CreateResellerViewController()
            createResellerView.titleString = titleString
            self.navigationController?.pushViewController(createResellerView, animated: true)
            break
        case 21:
            let queueDomainView = QueueDomainViewController()
            queueDomainView.titleString = titleString
            self.navigationController?.pushViewController(queueDomainView, animated: true)
            break
        default:
            let hostingRegistrationView = HostingRegistrationViewController()
            hostingRegistrationView.titleString = titleString
            self.navigationController?.pushViewController(hostingRegistrationView, animated: true)
            break
        }
    }
}

// MARK: - UITableViewDataSource
extension RegistrationViewController : UITableViewDataSource {
    
    private var activeSections: [Section] {
        get { return isSearchActive() ?filtered :MENU.REGISTRATION}
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return activeSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let  rows = activeSections[section].rows
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  rows = activeSections[indexPath.section].rows
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: indexPath) as! LabelTableViewCell
        cell.adjustView(image: rows[indexPath.row].image,
                        title: rows[indexPath.row].title)
        return cell
    }
}

// MARK: - UISearchResultsUpdating
extension RegistrationViewController: UISearchResultsUpdating {
    
    func isSearchActive() -> Bool {
        return searchController.isActive && searchController.searchBar.text != ""
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchString = searchController.searchBar.text else {
            return
        }
        filtered.removeAll()
        MENU.REGISTRATION.forEach { (section) in
            let result = section.rows.filter({ (row) -> Bool in
                return row.title.forSorting.contains(searchString.forSorting)
            })
            if(result.count > 0) {
                filtered.append(Section.init(name: section.name, rows: result))
            }
        }
        tableView.reloadData()
    }
}
