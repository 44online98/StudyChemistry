//
//  CartsViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/6/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class CartsViewController: BaseSubViewController {
    
    var carts = [CartModel]()
    
    fileprivate lazy var tableView: UITableView = { [unowned self] in
        $0.dataSource = self
        $0.delegate = self
        $0.rowHeight = 100
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
        if (self.carts.count == 0) {
            self.carts = ResponseModel(JSON: RESPONSE.CARTS)!.carts
        }
        self.setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        // title
        self.navigationItem.title = TEXT.TITLE_CARTS
        // viewContainer
        self.view.backgroundColor = .white
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        // add rightBarButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "+ Đăng Ký", style: .plain, target: self, action: #selector(self.onPressRegisterButton(_:)))
        // tableView
        self.tableView.register(UINib(nibName: "CartTableViewCell",bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
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
    
    func showActionSheetOptions() {
        let newCart = CartModel()
        newCart.id = UUID().uuidString
        let alert = UIAlertController(style: .actionSheet, title: "+ Đăng ký", message: "")
        alert.addAction(UIAlertAction.init(title: "Đăng Ký Tên Miền", style: .default, handler: { (alert) in
            newCart.kind = "Tên Miền"
            self.carts.append(newCart)
            self.tableView.insertRows(at: [IndexPath.init(row: self.carts.count - 1, section: 0)], with: .automatic)
            
        }))
        alert.addAction(UIAlertAction.init(title: "Transfer Tên Miền", style: .default, handler: { (alert) in
            newCart.kind = "Transfer Tên Miền"
            self.carts.append(newCart)
            self.tableView.insertRows(at: [IndexPath.init(row: self.carts.count - 1, section: 0)], with: .automatic)
        }))
        alert.addAction(UIAlertAction.init(title: "Đăng Ký Hosting", style: .default, handler: { (alert) in
            newCart.kind = "Hosting"
            self.carts.append(newCart)
            self.tableView.insertRows(at: [IndexPath.init(row: self.carts.count - 1, section: 0)], with: .automatic)
        }))
        alert.addAction(UIAlertAction.init(title: "Đăng Ký Server", style: .default, handler: { (alert) in
            newCart.kind = "Server"
            self.carts.append(newCart)
            self.tableView.insertRows(at: [IndexPath.init(row: self.carts.count - 1, section: 0)], with: .automatic)
        }))
        alert.addAction(UIAlertAction.init(title: "Đăng Ký Mail Server", style: .default, handler: { (alert) in
            newCart.kind = "Mail Server"
            self.carts.append(newCart)
            self.tableView.insertRows(at: [IndexPath.init(row: self.carts.count - 1, section: 0)], with: .automatic)
        }))
        alert.addAction(UIAlertAction.init(title: "Đăng Ký Dịch Vụ Khác", style: .default, handler: { (alert) in
            newCart.kind = "Dịch Vụ Khác"
            self.carts.append(newCart)
            self.tableView.insertRows(at: [IndexPath.init(row: self.carts.count - 1, section: 0)], with: .automatic)
        }))
        alert.addAction(title: "Cancel", style: .cancel)
        alert.show()
    }
    
    // MARK: - Action Method
    
    @objc func onPressRegisterButton(_ button:UIBarButtonItem!){
        self.showActionSheetOptions()
    }
}

extension CartsViewController : UITableViewDelegate {
    
}

extension CartsViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.carts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.adjustView(cart: carts[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension CartsViewController: CartTableViewCellDelegate {
    
    func delete(cart: CartModel) {
        let index = self.carts.index{ $0.id == cart.id }
        guard let row = index else {
            return
        }
        //
        self.carts.remove(at: row)
        //
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath.init(row: row, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    func update(cart: CartModel, indexPath: IndexPath) {
        
    }
}
