//
//  SendRequestViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/12/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class SendRequestViewController: BaseSubViewController {
    
    var titleString = String()
    var inputs = [InputModel]()
    
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
    
    fileprivate lazy var sendButton: Button = { [unowned self] in
        $0.setTitle("Gửi", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = AppColor.MAIN_COLOR
        $0.maskToBounds = true
        $0.layer.cornerRadius = MARGIN
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
        self.inputs = ResponseModel(JSON: RESPONSE.SEND_REQUEST)!.sendRequest
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
        self.tableView.register(UINib(nibName: "InputPickerTableViewCell",bundle: nil), forCellReuseIdentifier: "InputPickerTableViewCell")
        self.tableView.register(UINib(nibName: "InputTextViewTableViewCell",bundle: nil), forCellReuseIdentifier: "InputTextViewTableViewCell")
        self.tableView.register(UINib(nibName: "InputTextFieldTableViewCell",bundle: nil), forCellReuseIdentifier: "InputTextFieldTableViewCell")
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints  = false
        // button
        self.view.addSubview(sendButton)
        sendButton.translatesAutoresizingMaskIntoConstraints  = false
        // addConstraints
        let views = ["tableView": tableView, "button": sendButton] as [String : Any]
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
}

extension SendRequestViewController : UITableViewDelegate {
    
}

extension SendRequestViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let input = inputs[indexPath.row]
        if (input.kind == "textView") {
            return 150
        }
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let input = inputs[indexPath.row]
        switch input.kind {
        case "picker":
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputPickerTableViewCell", for: indexPath) as! InputPickerTableViewCell
            cell.adjustView(input: input, indexPath: indexPath)
            cell.delegate = self
            return cell
        case "textView":
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputTextViewTableViewCell", for: indexPath) as! InputTextViewTableViewCell
            cell.adjustView(input: input)
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

extension SendRequestViewController: InputTextFieldTableViewCellDelegate {
    
    func update(value: String, indexPath: IndexPath) {
        self.inputs[indexPath.row].value = value
    }
}

extension SendRequestViewController: InputPickerTableViewCellDelegate {
    func updatePicker(value: String, indexPath: IndexPath) {
        self.inputs[indexPath.row].value = value
    }
}

extension SendRequestViewController: InputTextViewTableViewCellDelegate {
    
    func updateTextView(value: String, input: InputModel) {
        let index = self.inputs.index{ $0.title == input.title }
        guard let row = index else {
            return
        }
        self.inputs[row].value = value
    }
}
