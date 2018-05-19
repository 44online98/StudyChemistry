//
//  PushMoneyToVATViewController.swift
//  PAVietNam
//
//  Created by SSN on 5/9/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class PushMoneyToVATViewController: BaseSubViewController {

    var titleString = String()
    var inputs = [InputModel]()
    
    fileprivate lazy var balanceLabel: Label = { [unowned self] in
        $0.text = "Tài khoản chính còn lại: 959,201 VNĐ"
        return $0
        }(Label(frame: .zero))
    
    fileprivate lazy var balanceVATLabel: Label = { [unowned self] in
        $0.text = "Tài khoản VAT còn lại: 0 VNĐ"
        return $0
        }(Label(frame: .zero))
    
    fileprivate lazy var tableView: UITableView = { [unowned self] in
        $0.isScrollEnabled = false
        $0.dataSource = self
        $0.delegate = self
        $0.rowHeight = 60
        $0.bounces = true
        $0.backgroundColor = nil
        $0.separatorStyle = .none
        $0.tableFooterView = UIView()
        $0.sectionIndexBackgroundColor = .clear
        $0.sectionIndexTrackingBackgroundColor = .clear
        return $0
        }(UITableView(frame: .zero, style: .plain))
    
    fileprivate lazy var nextButton: Button = { [unowned self] in
        $0.setTitle("Xác Nhận", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = AppColor.MAIN_COLOR
        $0.maskToBounds = true
        $0.layer.cornerRadius = MARGIN
        $0.setEnabled(enabled: false)
        $0.action { (button) in
            //        let alertView = UIAlertController.init(title: "", message: self.inputs.toJSONString(), preferredStyle: .alert)
            //        alertView.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
            //        alertView.show()
            self.navigationController?.popViewController(animated: true)
        }
        return $0
        }(Button(frame: .zero))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputs = ResponseModel(JSON: RESPONSE.PUSH_MONEY_VAT)!.pushMoneyVAT
        self.setupView()
        let hihi = UILabel()
        hihi.text = ""
        
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
        // balanceLabel
        self.view.addSubview(balanceLabel)
        balanceLabel.translatesAutoresizingMaskIntoConstraints  = false
        // balanceVATLabel
        self.view.addSubview(balanceVATLabel)
        balanceVATLabel.translatesAutoresizingMaskIntoConstraints  = false
        // tableView
        self.tableView.register(UINib(nibName: "InputTextFieldTableViewCell",bundle: nil), forCellReuseIdentifier: "InputTextFieldTableViewCell")
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints  = false
        // button
        self.view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints  = false
        // addConstraints
        let views = ["balanceLabel": balanceLabel, "balanceVATLabel": balanceVATLabel,
                     "tableView": tableView, "button": nextButton] as [String : Any]
        self.view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[balanceLabel]-0-|",
            options: [],
            metrics: nil,
            views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-0-[balanceVATLabel]-0-|",
            options: [],
            metrics: nil,
            views: views))
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
            withVisualFormat: "V:|-(top)-[balanceLabel(28)]-0-[balanceVATLabel(28)]-0-[tableView(height)]-16-[button(44)]",
            options: [],
            metrics: ["top": STATUSBAR_HEIGHT + NAVBAR_HEIGHT, "height": 180],
            views: views))
    }
}

extension PushMoneyToVATViewController : UITableViewDelegate {
    
}

extension PushMoneyToVATViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InputTextFieldTableViewCell", for: indexPath) as! InputTextFieldTableViewCell
        cell.adjustView(input: inputs[indexPath.row], indexPath: indexPath)
        cell.delegate = self
        return cell
    }
}

extension PushMoneyToVATViewController: InputTextFieldTableViewCellDelegate {
    
    func update(value: String, indexPath: IndexPath) {
        self.inputs[indexPath.row].value = value
        for input in self.inputs {
            if input.value.count == 0 {
                nextButton.setEnabled(enabled: false)
                return
            }
        }
        nextButton.setEnabled(enabled: true)
    }
}
