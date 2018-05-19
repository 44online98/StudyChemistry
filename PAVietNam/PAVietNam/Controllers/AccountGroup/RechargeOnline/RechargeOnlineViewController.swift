//
//  RechargeOnlineViewController.swift
//  PAVietNam
//
//  Created by SSN on 5/11/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class RechargeOnlineViewController: BaseSubViewController {
    
    var titleString = String()
    var indexPathSelected = IndexPath()
    var group = [HostingModel]()
    
    fileprivate lazy var tableView: UITableView = { [unowned self] in
        $0.dataSource = self
        $0.delegate = self
        $0.rowHeight = 60
        $0.bounces = true
        $0.backgroundColor = nil
        $0.separatorStyle = .none
        $0.tableFooterView = UIView()
        $0.sectionIndexBackgroundColor = .clear
        $0.sectionIndexTrackingBackgroundColor = .clear
        $0.isScrollEnabled = false
        return $0
        }(UITableView(frame: .zero, style: .plain))
    
    fileprivate lazy var nextButton: Button = { [unowned self] in
        $0.setTitle("Tiếp tục", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = AppColor.MAIN_COLOR
        $0.maskToBounds = true
        $0.layer.cornerRadius = MARGIN
        $0.action { (button) in
            let inputMoneyRechargeView = InputMoneyRechargeViewController()
            inputMoneyRechargeView.titleString = self.titleString
            self.navigationController?.pushViewController(inputMoneyRechargeView, animated: true)
        }
        return $0
        }(Button(frame: .zero))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.group = ResponseModel(JSON: RESPONSE.RECHARGE)!.recharge
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
        tableView.register(UINib(nibName: "HostingTableViewCell",bundle: nil), forCellReuseIdentifier: "HostingTableViewCell")
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints  = false
        // button
        self.view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints  = false
        // addConstraints
        let views = ["tableView": tableView, "button": nextButton] as [String : Any]
        self.view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[tableView]-0-|",
            options: [],
            metrics: nil,
            views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-48-[button]-48-|",
            options: [],
            metrics: nil,
            views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-(top)-[tableView(height)]-16-[button(44)]",
            options: [],
            metrics: ["top": STATUSBAR_HEIGHT + NAVBAR_HEIGHT, "height": 268],
            views: views))
    }
}

extension RechargeOnlineViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(!nextButton.isEnabled) {
           nextButton.setEnabled(enabled: true)
        }
        self.indexPathSelected = indexPath
    }
}

extension RechargeOnlineViewController : UITableViewDataSource {
    // setup tableViewCell
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = View.init(width: self.view.width, height: 28, text: self.group[section].kind)
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.group[section].hostings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HostingTableViewCell", for: indexPath) as! HostingTableViewCell
        let  _hostings = self.group[indexPath.section].hostings
        cell.adjustView_2(hosting: _hostings[indexPath.row])
        return cell
    }
}
