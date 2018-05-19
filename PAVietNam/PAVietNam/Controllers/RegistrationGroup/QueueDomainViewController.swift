//
//  QueueDomainViewController.swift
//  PAVietNam
//
//  Created by SSN on 5/4/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class QueueDomainViewController: BaseSubViewController {
    
    var titleString = String()
    
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
        self.navigationItem.title = titleString
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
        let alert = UIAlertController(style: .actionSheet, title: "touristvietnam.com.vn", message: "")
        alert.addAction(UIAlertAction.init(title: "Add support", style: .default, handler: { (alert) in
            
        }))
        alert.addAction(UIAlertAction.init(title: "Xoá", style: .destructive, handler: { (alert) in
            
        }))
        alert.addAction(UIAlertAction.init(title: "Xoá Đặc Biệt", style: .destructive, handler: { (alert) in
            
        }))
        alert.addAction(title: "Cancel", style: .cancel)
        alert.show()
    }
}

extension QueueDomainViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showActionSheetOptions()
    }
}

extension QueueDomainViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath) as! OrderTableViewCell
        cell.adjutView(text_1: "touristvietnam.com.vn",
                       text_2: "Công Ty Cổ Phần Truyền Thông Du Lịch Việt",
                       text_3: "37112621",
                       text_4: "11:32018 14-05-2018",
                       text_5: "Đang chờ xử lý")
        return cell
    }
}
