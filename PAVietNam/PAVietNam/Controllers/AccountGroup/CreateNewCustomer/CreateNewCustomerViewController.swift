//
//  CreateNewCustomerViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/19/18.
//  Copyright © 2018 SSN. All rights reserved.
//

class CreateNewCustomerViewController: BaseSubViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var createButton: UIButton!
    
    var titleString = String()
    var inputs = [InputModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputs = ResponseModel(JSON: RESPONSE.CREATE_CUSTOMER)!.createCustomer
        self.setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        // title
        self.navigationItem.title = titleString
        // viewContainer
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        // add rightBarButtonItem
        self.navigationItem.rightBarButtonItem =
            UIBarButtonItem.init(image: UIImage.init(named: "icon_info"), style: .plain, target: self, action: #selector(self.onPressNoteButton(_:)))
        // tableView
        let heightTableView: CGFloat = view.height - STATUSBAR_HEIGHT - NAVBAR_HEIGHT - TABBAR_HEIGHT - 44 - MARGIN*2
        self.tableView.register(UINib(nibName: "InputTextFieldTableViewCell",bundle: nil), forCellReuseIdentifier: "InputTextFieldTableViewCell")
        self.tableView.register(UINib(nibName: "InputSegmentTableViewCell",bundle: nil), forCellReuseIdentifier: "InputSegmentTableViewCell")
        self.tableView.frame = CGRect.init(x: 0, y: STATUSBAR_HEIGHT + NAVBAR_HEIGHT, width: view.width, height: heightTableView)
        self.tableView.tableFooterView = UIView()
        // button
        createButton.frame = CGRect.init(x: MARGIN*6, y: tableView.bottom + MARGIN,
                                         width: view.width - MARGIN*12, height: 44)
        createButton.clipsToBounds = true
        createButton.layer.cornerRadius = MARGIN
    }
    
    // MARK: - Action Method
    
    @objc func onPressNoteButton(_ button:UIBarButtonItem!){
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
    
    @IBAction func onPressCreateButton(_ sender: Any) {
//        let alertView = UIAlertController.init(title: "", message: self.inputs.toJSONString(), preferredStyle: .alert)
//        alertView.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
//        alertView.show()
        self.navigationController?.popViewController(animated: true)
    }
}

extension CreateNewCustomerViewController : UITableViewDelegate {
    
}

extension CreateNewCustomerViewController : UITableViewDataSource {
    // setup tableViewCell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = View.init(width: self.view.width, height: 28, text: "Thông Tin Khách Hàng")
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let input = inputs[indexPath.row]
        if (input.kind == "segment") {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputSegmentTableViewCell", for: indexPath) as! InputSegmentTableViewCell
            cell.adjustView(input: input, indexPath: indexPath)
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputTextFieldTableViewCell", for: indexPath) as! InputTextFieldTableViewCell
            cell.adjustView(input: input, indexPath: indexPath)
            cell.delegate = self
            return cell
        }
    }
}

extension CreateNewCustomerViewController: InputTextFieldTableViewCellDelegate {
    
    func update(value: String, indexPath: IndexPath) {
        self.inputs[indexPath.row].value = value
    }
}

extension CreateNewCustomerViewController: InputSegmentTableViewCellDelegate {
    func updateSegment(value: String, indexPath: IndexPath) {
        self.inputs[indexPath.row].value = value
    }
}
