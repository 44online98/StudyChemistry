//
//  EditInformationViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/17/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class EditInformationViewController: BaseSubViewController {
    
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
    
    fileprivate lazy var nextButton: Button = { [unowned self] in
        $0.setTitle("Xác Nhận", for: .normal)
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
        self.inputs = ResponseModel(JSON: RESPONSE.INFORMATION_ACCOUNT)!.informationAccount
        self.setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func setupView() {
        // title
        self.navigationItem.title = "Thông tin Tài Khoản"
        // viewContainer
        self.view.backgroundColor = .white
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        // add rightBarButtonItem
        self.navigationItem.rightBarButtonItem =
            UIBarButtonItem.init(image: UIImage.init(named: "icon_info"), style: .plain, target: self, action: #selector(self.onPressInfoButton(_:)))
        // tableView
        self.tableView.register(UINib(nibName: "InputTextFieldTableViewCell",bundle: nil), forCellReuseIdentifier: "InputTextFieldTableViewCell")
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
            withVisualFormat: "V:|-(top)-[tableView]-8-[button(44)]-(marginBottom)-|",
            options: [],
            metrics: ["top": STATUSBAR_HEIGHT + NAVBAR_HEIGHT, "marginBottom": TABBAR_HEIGHT + 8],
            views: views))
    }

    // MARK: - Action Method
    @objc func onPressInfoButton(_ button:UIBarButtonItem!){
        let alert = UIAlertController(style: .actionSheet)
        let text: [AttributedTextBlock] = [
            .normal(""),
            .header1("Chú ý"),
            .list("Mã số thuế chỉ được cung cấp 1 lần."),
            .list("Quý khách muốn thay đổi các thông tin bị ẩn vui lòng liên hệ bộ phận chăm sóc khách hàng."),
            ]
        alert.addTextViewer(text: .attributedText(text))
        alert.addAction(title: "OK", style: .cancel)
        alert.show()
    }
    
}

extension EditInformationViewController : UITableViewDelegate {
    
}

extension EditInformationViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = View.init(width: self.view.width, height: 28, text: "Thông Tin Tài Khoản: Pcoderpa")
        return view
    }
    
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

extension EditInformationViewController: InputTextFieldTableViewCellDelegate {
    
    func update(value: String, indexPath: IndexPath) {
        self.inputs[indexPath.row].value = value
    }
}
