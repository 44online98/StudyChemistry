//
//  InforServiceViewController.swift
//  PAVietNam
//
//  Created by SSN on 5/5/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class InforServiceViewController: BaseSubViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var updateButton: UIButton!
    
    var group = [InputsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.group = ResponseModel(JSON: RESPONSE.INFORMATION_SERVICE)!.informationService
        self.setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        // title
        self.navigationItem.title = "Nhập Thông Tin Khách Hàng"
        // viewContainer
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        // tableView
        let heightTableView: CGFloat = view.height - STATUSBAR_HEIGHT - NAVBAR_HEIGHT - TABBAR_HEIGHT - 44 - MARGIN*2
        self.tableView.register(UINib(nibName: "InputTextFieldTableViewCell",bundle: nil), forCellReuseIdentifier: "InputTextFieldTableViewCell")
        self.tableView.register(UINib(nibName: "InputPickerTableViewCell",bundle: nil), forCellReuseIdentifier: "InputPickerTableViewCell")
        self.tableView.register(UINib(nibName: "InputSegmentTableViewCell",bundle: nil), forCellReuseIdentifier: "InputSegmentTableViewCell")
        self.tableView.frame = CGRect.init(x: 0, y: 0, width: view.width, height: heightTableView)
        self.tableView.tableFooterView = UIView()
        // button
        updateButton.frame = CGRect.init(x: MARGIN*6, y: tableView.bottom + MARGIN,
                                       width: view.width - MARGIN*12, height: 44)
        updateButton.clipsToBounds = true
        updateButton.layer.cornerRadius = MARGIN
    }
    
    // MARK: - Action Method
    @IBAction func onPressUpdateButton(_ sender: Any) {
        let alertView = UIAlertController.init(title: "", message: self.group.toJSONString(), preferredStyle: .alert)
        alertView.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        alertView.show()
    }
}

extension InforServiceViewController : UITableViewDelegate {
    
}

extension InforServiceViewController : UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
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
            return cell
        case "picker":
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

extension InforServiceViewController: InputTextFieldTableViewCellDelegate {
    
    func update(value: String, indexPath: IndexPath) {
        self.group[indexPath.section].inputs[indexPath.row].value = value
    }
}

extension InforServiceViewController: InputPickerTableViewCellDelegate {
    
    func updatePicker(value: String, indexPath: IndexPath) {
        self.group[indexPath.section].inputs[indexPath.row].value = value
    }
}

extension InforServiceViewController: InputSegmentTableViewCellDelegate {
    func updateSegment(value: String, indexPath: IndexPath) {
        self.group[indexPath.section].inputs[indexPath.row].value = value
    }
}
