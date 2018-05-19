//
//  SupportViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/2/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class SupportViewController: BaseViewController {
    
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
        self.navigationItem.title = TEXT.TITLE_SUPPORT
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
        self.tableView.register(UINib(nibName: "SupportTableViewCell",bundle: nil), forCellReuseIdentifier: "SupportTableViewCell")
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
extension SupportViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let  titleString = MENU.SUPPORT[0].rows[indexPath.row].title
        switch indexPath.row {
        case 0:
            let sendRequestView = SendRequestViewController()
            sendRequestView.titleString = titleString
            self.navigationController?.pushViewController(sendRequestView, animated: true)
            break
        case 6:
            let searchQuestionsView = SearchQuestionsViewController()
            searchQuestionsView.titleString = titleString
            self.navigationController?.pushViewController(searchQuestionsView, animated: true)
            break
        case 7:
            let feedbackView = FeedbackViewController()
            feedbackView.titleString = titleString
            self.navigationController?.pushViewController(feedbackView, animated: true)
            break
        case 8:
            if let url = URL(string: "tel://19009477"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
            break
        case 9:
            if let url = URL(string: "tel://0908086513"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
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
extension SupportViewController : UITableViewDataSource {
    // setup tableViewCell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let  rows = MENU.SUPPORT[section].rows
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 8, 9:
            return 80
        default:
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 8, 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SupportTableViewCell", for: indexPath) as! SupportTableViewCell
            cell.adjustView(title: indexPath.row == 8 ? Support.title : Complain.title,
                            numberPhone: indexPath.row == 8 ? Support.numberPhone : Complain.numberPhone,
                            detail: indexPath.row == 8 ? Support.detail : Complain.detail )
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: indexPath) as! LabelTableViewCell
            let rows = MENU.SUPPORT[indexPath.section].rows
            cell.adjustView(image: rows[indexPath.row].image, title: rows[indexPath.row].title)
            return cell
        }
    }
}
