//
//  InputMoneyRechargeViewController.swift
//  PAVietNam
//
//  Created by SSN on 5/11/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class InputMoneyRechargeViewController: BaseSubViewController {
    
    var titleString = String()
    var hostings = [HostingModel]()
    
    fileprivate lazy var tableView: UITableView = { [unowned self] in
        $0.dataSource = self
        $0.delegate = self
        $0.rowHeight = 240
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
            let confirmRechargeView = ConfirmRechargeViewController()
            confirmRechargeView.titleString = self.titleString
            self.navigationController?.pushViewController(confirmRechargeView, animated: true)
        }
        return $0
        }(Button(frame: .zero))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hostings = ResponseModel(JSON: RESPONSE.RECHARGE_1)!.recharge
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
        tableView.register(UINib(nibName: "InputMoneyTableViewCell",bundle: nil), forCellReuseIdentifier: "InputMoneyTableViewCell")
        tableView.frame = CGRect.init(x: 0, y: 0, width: view.width, height: 268)
        self.view.addSubview(tableView)
        // button
        nextButton.frame = CGRect.init(x: MARGIN*6, y: tableView.bottom + MARGIN,
                                       width: view.width - MARGIN*12, height: 44)
        self.view.addSubview(nextButton)
    }

}

extension InputMoneyRechargeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension InputMoneyRechargeViewController : UITableViewDataSource {
    // setup tableViewCell
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = View.init(width: self.view.width, height: 28, text: "Nhập số tiền cần nạp")
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InputMoneyTableViewCell", for: indexPath) as! InputMoneyTableViewCell
        return cell
    }
}
