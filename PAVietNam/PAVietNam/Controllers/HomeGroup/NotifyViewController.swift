//
//  NotifyViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/3/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class NotifyViewController: BaseViewController {
    
    var parentNavigationController : UINavigationController?
    var notify = [NotifyModel]()
    
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
        self.notify = ResponseModel(JSON: RESPONSE.NOTIFY)!.notify
        self.setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        // viewContainer
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        // tableView
        self.tableView.register(UINib(nibName: "NotifyTableViewCell",bundle: nil), forCellReuseIdentifier: "NotifyTableViewCell")
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
            withVisualFormat: "V:|-0-[tableView]-(marginBottom)-|",
            options: [],
            metrics: ["marginBottom": NAVBAR_HEIGHT + TABBAR_HEIGHT],
            views: views))
    }
}

extension NotifyViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // update row
        self.notify[indexPath.row].isRead = true
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        // push
        let detailView = NotifyDetailViewController()
        self.parentNavigationController?.pushViewController(detailView, animated: true)
    }
}

extension NotifyViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notify.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotifyTableViewCell", for: indexPath) as! NotifyTableViewCell
        cell.adjustView(notify: notify[indexPath.row])
        return cell
    }
}
