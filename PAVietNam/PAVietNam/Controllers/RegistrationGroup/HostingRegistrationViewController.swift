//
//  HostingRegistrationViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/13/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class HostingRegistrationViewController: BaseSubViewController {
    
    var titleString = String()
    var topElements = [InputsModel]()
    var hostings = [HostingModel]()
    var indexPathSelected = IndexPath()
    
    fileprivate lazy var tableView: UITableView = { [unowned self] in
        $0.dataSource = self
        $0.delegate = self
        $0.rowHeight = 60
        $0.bounces = true
        $0.sectionFooterHeight = 1
        $0.backgroundColor = nil
        $0.separatorStyle = .none
        $0.tableFooterView = UIView()
        $0.sectionIndexBackgroundColor = .clear
        $0.sectionIndexTrackingBackgroundColor = .clear
        return $0
        }(UITableView(frame: .zero, style: .plain))
    
    fileprivate lazy var addToCardButton: Button = { [unowned self] in
        $0.setTitle("Cho Vào Giỏ Hàng", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = AppColor.MAIN_COLOR
        $0.maskToBounds = true
        $0.layer.cornerRadius = MARGIN
        $0.action { (button) in
            if (self.indexPathSelected == IndexPath.init()) {
                return
            }
            // init carts
            var carts = [CartModel]()
            let cart = CartModel()
            cart.id = UUID().uuidString
            cart.kind = "Hosting"
            cart.domain = self.hostings[self.indexPathSelected.section].hostings[self.indexPathSelected.row]
            cart.time = " 1 năm"
            cart.note = "không có gì"
            carts.append(cart)
            let cartsView = CartsViewController()
            cartsView.carts = carts
            self.navigationController?.pushViewController(cartsView, animated: true)
        }
        return $0
        }(Button(frame: .zero))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hostings = ResponseModel(JSON: RESPONSE.HOSTINGS)!.hostings
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
        tableView.register(UINib(nibName: "HostingTableViewCell",bundle: nil),
                           forCellReuseIdentifier: "HostingTableViewCell")
        tableView.register(UINib(nibName: "InputTextFieldTableViewCell",bundle: nil),     forCellReuseIdentifier: "InputTextFieldTableViewCell")
        tableView.register(UINib(nibName: "InputPickerTableViewCell",bundle: nil),
                           forCellReuseIdentifier: "InputPickerTableViewCell")
        tableView.register(UINib(nibName: "InputSegmentTableViewCell",bundle: nil),
                           forCellReuseIdentifier: "InputSegmentTableViewCell")
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints  = false
        // button
        self.view.addSubview(addToCardButton)
        addToCardButton.translatesAutoresizingMaskIntoConstraints  = false
        // addConstraints
        let views = ["tableView": tableView, "button": addToCardButton] as [String : Any]
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

extension HostingRegistrationViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 0) { return  }
        self.indexPathSelected = indexPath
    }
}

extension HostingRegistrationViewController : UITableViewDataSource {
    // setup tableViewCell
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.hostings.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = View.init(width: self.view.width, height: 28, text: self.hostings[section].kind)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 1
        default:
            return 28
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return topElements.count>0 ? topElements[0].inputs.count : 0
        }
        return self.hostings[section].hostings.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 60
        }
        return 44
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let _inputs = topElements[indexPath.section].inputs
            let input = _inputs[indexPath.row]
            switch input.kind {
            case "segment":
                let cell = tableView.dequeueReusableCell(withIdentifier: "InputSegmentTableViewCell", for: indexPath) as! InputSegmentTableViewCell
                cell.adjustView(input: input, indexPath: indexPath)
                cell.delegate = self
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "HostingTableViewCell", for: indexPath) as! HostingTableViewCell
        let  _hostings = self.hostings[indexPath.section].hostings
        cell.adjustView(hosting: _hostings[indexPath.row])
        return cell
    }
}

extension HostingRegistrationViewController: InputTextFieldTableViewCellDelegate {
    
    func update(value: String, indexPath: IndexPath) {
        self.topElements[indexPath.section].inputs[indexPath.row].value = value
    }
}

extension HostingRegistrationViewController: InputPickerTableViewCellDelegate {
    
    func updatePicker(value: String, indexPath: IndexPath) {
        self.topElements[indexPath.section].inputs[indexPath.row].value = value
    }
}

extension HostingRegistrationViewController: InputSegmentTableViewCellDelegate {
    func updateSegment(value: String, indexPath: IndexPath) {
        self.topElements[indexPath.section].inputs[indexPath.row].value = value
    }
}
