//
//  CreateResellerViewController.swift
//  PAVietNam
//
//  Created by SSN on 5/14/18.
//  Copyright © 2018 SSN. All rights reserved.
//

class CreateResellerViewController: BaseSubViewController {
    
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
    
    fileprivate lazy var createButton: Button = { [unowned self] in
        $0.setTitle("Tạo Đại Lý", for: .normal)
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
        self.inputs = ResponseModel(JSON: RESPONSE.CREATE_RESELLER)!.createReseller
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
        tableView.register(UINib(nibName: "InputTextFieldTableViewCell",bundle: nil), forCellReuseIdentifier: "InputTextFieldTableViewCell")
        tableView.register(UINib(nibName: "InputSegmentTableViewCell",bundle: nil), forCellReuseIdentifier: "InputSegmentTableViewCell")
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints  = false
        // button
        self.view.addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints  = false
        // addConstraints
        let views = ["tableView": tableView, "button": createButton] as [String : Any]
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

extension CreateResellerViewController : UITableViewDelegate {
    
}

extension CreateResellerViewController : UITableViewDataSource {
    // setup tableViewCell
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = View.init(width: self.view.width, height: 28, text: "Thông Tin Đại Lý")
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputs.count
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

extension CreateResellerViewController: InputTextFieldTableViewCellDelegate {
    
    func update(value: String, indexPath: IndexPath) {
        self.inputs[indexPath.row].value = value
    }
}

extension CreateResellerViewController: InputSegmentTableViewCellDelegate {
    func updateSegment(value: String, indexPath: IndexPath) {
        self.inputs[indexPath.row].value = value
    }
}
