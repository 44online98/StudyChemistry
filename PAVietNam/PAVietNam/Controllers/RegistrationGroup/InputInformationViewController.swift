//
//  InputInformationViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/16/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class InputInformationViewController: BaseSubViewController {
    
    var group = [InputsModel]()
    
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
        return $0
        }(UITableView(frame: .zero, style: .plain))
    
    fileprivate lazy var nextButton: Button = { [unowned self] in
        $0.setTitle("Tiếp tục", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = AppColor.MAIN_COLOR
        $0.maskToBounds = true
        $0.layer.cornerRadius = MARGIN
        $0.action { (button) in
            let inputInformationView = InputInformationViewController()
            self.navigationController?.pushViewController(inputInformationView, animated: true)
        }
        return $0
        }(Button(frame: .zero))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.group = ResponseModel(JSON: RESPONSE.INFORMATION_CUSTOMER_INDIVIDUAL_INDIVIDUAL)!.informationCustomer
        self.setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        // title
        self.navigationItem.title = "Nhập Thông Tin Khách Hàng"
        // viewContainer
        self.view.backgroundColor = .white
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        // tableView
        self.tableView.register(UINib(nibName: "InputTextFieldTableViewCell",bundle: nil), forCellReuseIdentifier: "InputTextFieldTableViewCell")
        self.tableView.register(UINib(nibName: "InputPickerTableViewCell",bundle: nil), forCellReuseIdentifier: "InputPickerTableViewCell")
        self.tableView.register(UINib(nibName: "InputSegmentTableViewCell",bundle: nil), forCellReuseIdentifier: "InputSegmentTableViewCell")
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
            withVisualFormat: "V:|-0-[tableView]-8-[button(44)]-(marginBottom)-|",
            options: [],
            metrics: ["marginBottom": TABBAR_HEIGHT + 8],
            views: views))
    }
    
    // MARK: - Action Method
    @IBAction func onPressNextButton(_ sender: Any) {
        let alertView = UIAlertController.init(title: "", message: self.group.toJSONString(), preferredStyle: .alert)
        alertView.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        alertView.show()
    }
}

extension InputInformationViewController : UITableViewDelegate {
    
}

extension InputInformationViewController : UITableViewDataSource {
    // setup tableViewCell
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.group.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = View.init(width: self.view.width, height: 28, text: self.group[section].section)
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group[section].inputs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let _inputs = group[indexPath.section].inputs
        let input = _inputs[indexPath.row]
        switch input.kind {
        case "segment":
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputSegmentTableViewCell", for: indexPath) as! InputSegmentTableViewCell
            cell.adjustView(input: input, indexPath: indexPath)
            cell.delegate = self
            return cell
        case "date":
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputPickerTableViewCell", for: indexPath) as! InputPickerTableViewCell
            cell.adjustView(input: input, indexPath: indexPath)
            cell.delegate = self
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputTextFieldTableViewCell", for: indexPath) as! InputTextFieldTableViewCell
            cell.adjustView(input: input, indexPath: indexPath)
            cell.delegate = self
            return cell
        }
    }
}

extension InputInformationViewController: InputTextFieldTableViewCellDelegate {
    
    func update(value: String, indexPath: IndexPath) {
        self.group[indexPath.section].inputs[indexPath.row].value = value
    }
}

extension InputInformationViewController: InputPickerTableViewCellDelegate {
    
    func updatePicker(value: String, indexPath: IndexPath) {
        self.group[indexPath.section].inputs[indexPath.row].value = value
    }
}

extension InputInformationViewController: InputSegmentTableViewCellDelegate {
    func updateSegment(value: String, indexPath: IndexPath) {
        self.group[indexPath.section].inputs[indexPath.row].value = value
        if (value == "Cá nhân" || value == "Công ty") {
            if (self.group[0].inputs[0].value == "Cá nhân"  && self.group[1].inputs[0].value == "Cá nhân") {
                self.group = ResponseModel(JSON: RESPONSE.INFORMATION_CUSTOMER_INDIVIDUAL_INDIVIDUAL)!.informationCustomer
            }
            if (self.group[0].inputs[0].value == "Cá nhân"  && self.group[1].inputs[0].value == "Công ty") {
                self.group = ResponseModel(JSON: RESPONSE.INFORMATION_CUSTOMER_INDIVIDUAL_ORGANIZATION)!.informationCustomer
            }
            if (self.group[0].inputs[0].value == "Công ty"  && self.group[1].inputs[0].value == "Cá nhân") {
                self.group = ResponseModel(JSON: RESPONSE.INFORMATION_CUSTOMER_ORGANIZATION_INDIVIDUAL)!.informationCustomer
            }
            if (self.group[0].inputs[0].value == "Công ty"  && self.group[1].inputs[0].value == "Công ty") {
                self.group = ResponseModel(JSON: RESPONSE.INFORMATION_CUSTOMER_ORGANIZATION_ORGANIZATION)!.informationCustomer
            }
            self.tableView.reloadData()
        }
    }
}
