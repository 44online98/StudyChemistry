//
//  ChangeLanguageViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/27/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

import UIKit

class ChangeLanguageViewController: BaseSubViewController {
    
    var titleString = String()
    var indexPathSelected = IndexPath()
    var changeLanguage = [
        ["flagImage": "flag_vn", "title": "Tiếng Việt"],
        ["flagImage": "flag_uk", "title": "English"]
    ]
    
    fileprivate lazy var tableView: UITableView = { [unowned self] in
        $0.isScrollEnabled = false
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
        self.tableView.register(UINib(nibName: "ChangeLanguageTableViewCell",bundle: nil), forCellReuseIdentifier: "ChangeLanguageTableViewCell")
        tableView.selectRow(at: IndexPath.init(row: 0, section: 0), animated: true, scrollPosition: .none)
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
            withVisualFormat: "V:|-(top)-[tableView(height)]-0-|",
            options: [],
            metrics: ["top": STATUSBAR_HEIGHT + NAVBAR_HEIGHT, "height": 88],
            views: views))
    }
}

extension ChangeLanguageViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ChangeLanguageViewController : UITableViewDataSource {
    // setup tableViewCell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.changeLanguage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChangeLanguageTableViewCell", for: indexPath) as! ChangeLanguageTableViewCell
        cell.adjustView(flagImage: changeLanguage[indexPath.row]["flagImage"]!,
                        title: changeLanguage[indexPath.row]["title"]!)
        return cell
    }
}
