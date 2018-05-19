//
//  AccountViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/2/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class AccountViewController: BaseViewController {
    
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
        $0.sectionHeaderHeight = 20
        $0.sectionFooterHeight = 1
        $0.tableFooterView = UIView()
        // $0.backgroundColor = .clear
        $0.sectionIndexBackgroundColor = .clear
        $0.sectionIndexTrackingBackgroundColor = .clear
        return $0
        }(UITableView(frame: .zero, style: .grouped))
    
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
        self.navigationItem.title = TEXT.ACCOUNT
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
        self.tableView.register(UINib(nibName: "AccountTableViewCell",bundle: nil), forCellReuseIdentifier: "AccountTableViewCell")
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
    
    func showAlert() {
        let alert = UIAlertController(style: .actionSheet)
        
        let text: [AttributedTextBlock] = [
            .header1("CÔNG TY TNHH P.A VIỆT NAM"),
            .normal(""),
            
            .header2("TRỤ SỞ CHÍNH"),
            .normal("254A Nguyễn Đình Chiểu , Phường 6, Quận 3, Tp. Hồ Chí Minh, Việt Nam"),
            .normal("Điện thoại: +84.286256 3737"),
            .normal(""),
            
            .header2("CHI NHÁNH PHÍA BẮC"),
            .normal("Tầng 9 - Tòa nhà Diamond(Handico 6), Số 2 Hoàng Đạo Thúy , Trung Hòa Nhân Chính, Q.Thanh Xuân, Hà Nội"),
            .normal("Điện thoại: +84.247037 3737"),
            .normal(""),
            
            .header2("CHI NHÁNH PHÍA NAM"),
            .normal("750 Sư Vạn Hạnh, Phường 12, Quận 10, Tp. Hồ Chí Minh, Việt Nam"),
            .normal("Điện thoại: +84.286256 3737"),
            .normal("Tầng trệt tòa nhà Pico Plaza Cộng Hòa (Kế siêu thị Lotte Mart, mặt đường Quách Văn Tuấn)"),
            .normal("20 Cộng Hòa, phường 12, quận Tân Bình, Tp. Hồ Chí Minh, Việt Nam"),
            .normal("Số 79 Đường số 6, Hưng Phước 4, Phú Mỹ Hưng, Quận 7, Tp. Hồ Chí Minh, Việt Nam"),
            ]
        alert.addTextViewer(text: .attributedText(text))
        alert.addAction(title: "OK", style: .cancel)
        alert.show()
    }
    
    func findIndexPath(list: [Section], value: String) -> IndexPath {
        var result = IndexPath()
        for (indexPathSection, section) in list.enumerated() {
            let indexPathRow = section.rows.index { (row) -> Bool in
                row.title.contains(value)
            }
            if (indexPathRow != nil) {
                result = IndexPath.init(row: indexPathRow!, section: indexPathSection)
                return result
            }
        }
        return IndexPath()
    }
}

// MARK: - UITableViewDelegate
extension AccountViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let  titleString = activeSections[indexPath.section].rows[indexPath.row].title
        var indexPathSelected = self.findIndexPath(list: MENU.ACCOUNT, value: titleString)
        if (indexPathSelected == IndexPath()) {return}
        switch indexPathSelected.section {
        // section 0
        case 0:
            let editInformationView = EditInformationViewController()
            self.navigationController?.pushViewController(editInformationView, animated: true)
            break
        // section 1
        case 1:
            switch indexPathSelected.row {
            case 0 :
                let changePassword = ChangePasswordViewController()
                changePassword.titleString = titleString
                self.navigationController?.pushViewController(changePassword, animated: true)
                break
            case 4 :
                let chooseGiftsView = ChooseGiftsViewController()
                self.navigationController?.pushViewController(chooseGiftsView, animated: true)
                break
            default:
                break
            }
        // section 2
        case 2:
            switch indexPathSelected.row {
            case 0 :
                let transferMoneyResellerView = TransferMoneyResellerViewController()
                transferMoneyResellerView.titleString = titleString
                self.navigationController?.pushViewController(transferMoneyResellerView, animated: true)
                break
            case 1 :
                let rechargeOnlineView = RechargeOnlineViewController()
                rechargeOnlineView.titleString = titleString
                self.navigationController?.pushViewController(rechargeOnlineView, animated: true)
                break
            case 2 :
                let viewTransaction = ViewTransactionViewController()
                viewTransaction.titleString = titleString
                self.navigationController?.pushViewController(viewTransaction, animated: true)
                break
            case 3 :
                let pushMoneyToVAT = PushMoneyToVATViewController()
                pushMoneyToVAT.titleString = titleString
                self.navigationController?.pushViewController(pushMoneyToVAT, animated: true)
                break
            case 4 :
                let viewLogVAT = ViewLogVATViewController()
                viewLogVAT.titleString = titleString
                self.navigationController?.pushViewController(viewLogVAT, animated: true)
                break
            case 5 :
                let viewLogVAT = ViewLogVATViewController()
                viewLogVAT.titleString = titleString
                self.navigationController?.pushViewController(viewLogVAT, animated: true)
                break
            default:
                break
            }
        // section 3
        case 3:
            switch indexPathSelected.row {
            case 0 :
                let domainPricingView = DomainPricingViewController()
                domainPricingView.titleString = titleString
                self.navigationController?.pushViewController(domainPricingView, animated: true)
                break
            default:
                let hostingPricingView = HostingPricingViewController()
                hostingPricingView.titleString = titleString
                self.navigationController?.pushViewController(hostingPricingView, animated: true)
                break
            }
        // section 4
        case 4:
            switch indexPathSelected.row {
            case 0 :
                let resellerRegisteredView = ResellerRegisteredViewController()
                resellerRegisteredView.titleString = titleString
                self.navigationController?.pushViewController(resellerRegisteredView, animated: true)
                break
            case 1 :
                let createNewCustomerView = CreateNewCustomerViewController()
                createNewCustomerView.titleString = titleString
                self.navigationController?.pushViewController(createNewCustomerView, animated: true)
                break
            default:
                let sendMailToCustomerView = SendMailToCustomerViewController()
                sendMailToCustomerView.titleString = titleString
                self.navigationController?.pushViewController(sendMailToCustomerView, animated: true)
                break
            }
        // section 5
        case 5:
            switch indexPathSelected.row {
            case 0 :
                self.showAlert()
                break
            case 1 :
                let changeLanguageView = ChangeLanguageViewController()
                changeLanguageView.titleString = titleString
                self.navigationController?.pushViewController(changeLanguageView, animated: true)
                break
            default:
                let loginView : LoginViewController = LoginViewController()
                let navLoginView: UINavigationController = UINavigationController(rootViewController: loginView)
                let window = UIApplication.shared.keyWindow
                window?.rootViewController = navLoginView
                break
            }
        default:
            break
        }
    }
}

// MARK: - UITableViewDataSource
extension AccountViewController : UITableViewDataSource {
    
    private var activeSections: [Section] {
        get { return isSearchActive() ?filtered :MENU.ACCOUNT}
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return activeSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let  rows = activeSections[section].rows
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section > 0 ?20 :1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let  rows = activeSections[indexPath.section].rows
        return (rows.first?.title.contains("pcoderpa"))! ?75 :44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  rows = activeSections[indexPath.section].rows
        if (rows.first?.title.contains("pcoderpa"))! {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountTableViewCell", for: indexPath) as! AccountTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: indexPath) as! LabelTableViewCell
            let rows = activeSections[indexPath.section].rows
            cell.adjustView(image: rows[indexPath.row].image,
                            title: rows[indexPath.row].title)
            return cell
        }
    }
}

// MARK: - UISearchResultsUpdating
extension AccountViewController: UISearchResultsUpdating {
    
    func isSearchActive() -> Bool {
        return searchController.isActive && searchController.searchBar.text != ""
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchString = searchController.searchBar.text else {
            return
        }
        filtered.removeAll()
        MENU.ACCOUNT.forEach { (section) in
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
