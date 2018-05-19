//
//  DomainRegistrationViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/5/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class DomainRegistrationViewController: BaseSubViewController {
    
    var count = 0
    var titleString = String()
    private var domains = [DomainModel]()
    private var _type = String()
    private var _title = String()
    private var _message = "Ví dụ: abc.com, abc.com.vn"
    private var _placeholder = String()
    
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
    
    fileprivate lazy var addToCardButton: Button = { [unowned self] in
        $0.setTitle("Cho Vào Giỏ Hàng", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = AppColor.MAIN_COLOR
        $0.maskToBounds = true
        $0.layer.cornerRadius = MARGIN
        $0.action { (button) in
            // init carts
            var carts = [CartModel]()
            for domain in self.domains {
                let cart = CartModel()
                cart.id = UUID().uuidString
                cart.kind = self._type
                cart.domain = domain.domain
                cart.time = " 1 năm"
                cart.note = "không có gì"
                carts.append(cart)
            }
            let cartsView = CartsViewController()
            cartsView.carts = carts
            self.navigationController?.pushViewController(cartsView, animated: true)
        }
        return $0
        }(Button(frame: .zero))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(count == 0){
            count += 1
            self.showPickerInputDomain()
        }
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
        tableView.register(UINib(nibName: "DomainTableViewCell",bundle: nil), forCellReuseIdentifier: "DomainTableViewCell")
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
        //
        if (titleString == "Đăng Ký Tên Miền") {
            self._type = "Tên miền"
            self._title = "Đăng Ký Nhiều Tên Miền"
            self._placeholder = "Nhập tên miền muốn đăng ký"
            // add rightBarButtonItem
            self.navigationItem.rightBarButtonItem =
                UIBarButtonItem.init(barButtonSystemItem: .add,
                                     target: self,
                                     action: #selector(self.onPressAddButton(_:)))
        }
        //
        if (titleString == "Gia Hạn Dịch Vụ") {
            self._type = "Gia hạn tên miền"
            self._title = "Gia Hạn Nhiều Dịch Vụ Thuộc Cùng1  Chủ Thể"
            self._placeholder = "Nhập dịch vụ cần gia hạn"
            // add rightBarButtonItem
            self.navigationItem.rightBarButtonItem =
                UIBarButtonItem.init(barButtonSystemItem: .add,
                                     target: self,
                                     action: #selector(self.onPressAddButton(_:)))
        }
        //
        if (titleString == "Transfer Tên Miền") {
            self._type = "Transfer tên miền"
            self._title = "Tên Miền Transfer (Chuyển về P.A Việt Nam)"
            self._placeholder = "Nhập tên miền muốn transfer"
            // add rightBarButtonItem
            self.navigationItem.rightBarButtonItems = [
                UIBarButtonItem.init(barButtonSystemItem: .add, target: self,
                                     action: #selector(self.onPressAddButton(_:))),
                UIBarButtonItem.init(image: UIImage.init(named: "icon_info"), style: .plain, target: self, action: #selector(self.onPressInfoButton(_:))),
            ]
        }
        //
        if (titleString == "Active Đơn Hàng") {
            self._type = "Đơn Hàng"
            self._title = "Thông Tin Đơn Hàng"
            self._placeholder = "Nhập mã đơn hàng"
            // add rightBarButtonItem
            self.navigationItem.rightBarButtonItems = [
                UIBarButtonItem.init(barButtonSystemItem: .add, target: self,
                                     action: #selector(self.onPressAddButton(_:))),
                UIBarButtonItem.init(image: UIImage.init(named: "icon_info"), style: .plain, target: self, action: #selector(self.onPressInfoOrderButton(_:))),
            ]
        }
        //
        if (titleString == "Huỷ Đăng Ký Lại Tên Miền") {
            self._type = "Tên miền"
            self._title = "Tên Miền Huỷ Đăng Ký Lại"
            self._placeholder = "Nhập tên miền muốn huỷ đăng ký lại"
            // add rightBarButtonItem
            self.navigationItem.rightBarButtonItems = [
                UIBarButtonItem.init(barButtonSystemItem: .add, target: self,
                                     action: #selector(self.onPressAddButton(_:))),
                UIBarButtonItem.init(image: UIImage.init(named: "icon_info"), style: .plain, target: self, action: #selector(self.onPressInfoReRegisterButton(_:))),
            ]
        }
        //
        if (titleString == "Chuyển Nhượng Tên Miền") {
            self._type = "Tên miền"
            self._title = "Tên Miền Chuyển Nhượng "
            self._placeholder = "Nhập tên miền muốn chuyển nhượng"
            // add rightBarButtonItem
            self.navigationItem.rightBarButtonItems = [
                UIBarButtonItem.init(barButtonSystemItem: .add, target: self,
                                     action: #selector(self.onPressAddButton(_:))),
                UIBarButtonItem.init(image: UIImage.init(named: "icon_info"), style: .plain, target: self, action: #selector(self.onPressInfoGuaranteeButton(_:))),
            ]
        }
    }
    
    func showPickerInputDomain() {
        var input = ""
        let alert = UIAlertController(style: .actionSheet, title: self._title, message: self._message)
        let textField: TextField.Config = { textField in
            //textField.left(image: #imageLiteral(resourceName: "pen"), color: .black)
            textField.leftViewPadding = 12
            textField.becomeFirstResponder()
            textField.borderWidth = 1
            textField.cornerRadius = 8
            textField.borderColor = UIColor.lightGray.withAlphaComponent(0.5)
            textField.backgroundColor = nil
            textField.textColor = .black
            textField.placeholder = self._placeholder
            textField.keyboardAppearance = .default
            textField.keyboardType = .emailAddress
            textField.returnKeyType = .done
            textField.autocorrectionType = .no
            textField.autocapitalizationType = .none
            textField.action { textField in
                input = textField.text!
            }
        }
        alert.addOneTextField(configuration: textField)
        let action = UIAlertAction.init(title: "OK", style: .cancel) { (alert) in
            if (input.count > 0) {
                let newDomain = DomainModel()
                newDomain.id = UUID().uuidString
                newDomain.domain = input
                self.domains.append(newDomain)
                //
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: [IndexPath.init(row: self.domains.count - 1, section: 0)], with: .automatic)
                self.tableView.endUpdates()
            }
        }
        alert.addAction(action)
        alert.show()
    }
    
    // MARK: - Action Method
    @objc func onPressInfoButton(_ button:UIBarButtonItem!){
        let alert = UIAlertController(style: .actionSheet)
        
        let text: [AttributedTextBlock] = [
            .normal(""),
            .header1("TRANSFER TÊN MIỀN"),
            .list("Nếu là Tên miền Việt Nam, Quý khách vui lòng hoàn tất các thủ tục theo link này."),
            .header2("Nếu là Tên miền Quốc Tế vui lòng kiểm tra các điều kiện sau:"),
            .list("Không thể Transfer về P.A Vietnam khi Domain mới được đăng ký trong vòng 60 ngày."),
            .list("Domain mới Gia Hạn ở nhà cung cấp cũ trong vòng 45 ngày (Nếu chấp nhận Transfer về P.A Vietnam thì sẽ không được gia hạn thêm 1 năm ở NCC mới)."),
            .list("Không thể Transfer về P.A Vietnam nếu Domain ở trạng thái: Whois Protected / Theft Protection / Lock / Suspendsion"),
            .list("Tên miền có số năm hết hạn >9 năm thì khi Transfer về NCC mới sẽ không được gia hạn thêm 1 năm ở NCC mới."),
            .list("Khách hàng phải check được email whois (Liên hệ nhà cung cấp cũ để biết email whois)."),
            .list("Khách hàng phải cung cấp Key EPP cho P.A Vietnam(Liên hệ nhà cung cấp cũ để có Key EPP)."),
            ]
        alert.addTextViewer(text: .attributedText(text))
        alert.addAction(title: "OK", style: .cancel)
        alert.show()
    }
    
    @objc func onPressInfoGuaranteeButton(_ button:UIBarButtonItem!){
        let alert = UIAlertController(style: .actionSheet)
        
        let text: [AttributedTextBlock] = [
            .normal(""),
            .header1("CHUYỂN NHƯỢNG TÊN MIỀN"),
            .header2("Quý khách hoàn tất thủ tục chuyển nhượng quyền sử dụng tên miền và hồ sơ đăng ký lại ( hoàn tất 3 hồ sơ sau):"),
            .list("Văn bản đề nghị chuyển nhượng và nhận chuyển nhượng quyền sử dụng tên miền Internet."),
            .list("Bản khai thông tin đăng ký sử dụng tên miền Internet của bên nhận chuyển nhượng."),
            .list("Bản khai đăng ký tên miền cho chủ thể mới"),
            .normal("Kèm Giấy tờ tùy thân: Giấy tờ tùy thân là bản gốc để NĐK đối chiếu với thông tin trong bản khai, hồ sơ chuyển nhượng hoặc bản có công chứng trong vòng 6 tháng nếu gửi qua đường bưu chính tới địa chỉ của NĐK."),
            .normal("Cá nhân: Giấy CMND/ Passport của chủ thể tên miền chuyển nhượng."),
            .normal("Tổ chức: GPKD + CMND/ Passport người thay mặt tổ chức làm thủ tục đăng ký tên miền + chuyển nhượng tên miền."),
            ]
        alert.addTextViewer(text: .attributedText(text))
        alert.addAction(title: "OK", style: .cancel)
        alert.show()
    }
    
    @objc func onPressInfoOrderButton(_ button:UIBarButtonItem!){
        let alert = UIAlertController(style: .actionSheet)
        
        let text: [AttributedTextBlock] = [
            .normal(""),
            .header2("ĐIỀU KIỆN ĐỂ ACTIVE ĐƯỢC CÁC DỊCH VỤ TRONG ĐƠN HÀNG:"),
            .list("ĐƠN HÀNG PHẢI CÓ NHÂN VIÊN PHỤ TRÁCH."),
            .list("ĐƠN HÀNG PHẢI Ở TRẠNG THÁI MỚI ĐĂNG KÝ HOẶC ĐÃ CẬP NHẬT THÔNG TIN THANH TOÁN."),
            .list("SAU KHI ACTIVE ĐƠN HÀNG, HỆ THỐNG SẼ TẠO GIAO DỊCH TRỪ TIỀN CHO NHÂN VIÊN PHỤ TRÁCH ĐƠN HÀNG."),
            ]
        alert.addTextViewer(text: .attributedText(text))
        alert.addAction(title: "OK", style: .cancel)
        alert.show()
    }
    
    @objc func onPressInfoReRegisterButton(_ button:UIBarButtonItem!){
        let alert = UIAlertController(style: .actionSheet)
        
        let text: [AttributedTextBlock] = [
            .normal(""),
            .header2("Dịch vụ hủy đăng ký lại tên miền Việt Nam là dịch vụ hỗ trợ khách hàng theo dõi đăng ký lại tên miền trong trường hợp khách làm hồ sơ thay đổi chủ thể của tên miền Việt Nam."),
            ]
        alert.addTextViewer(text: .attributedText(text))
        alert.addAction(title: "OK", style: .cancel)
        alert.show()
    }
    
    @objc func onPressAddButton(_ button:UIBarButtonItem!){
        self.showPickerInputDomain()
    }
    
    @IBAction func onPressAddToCardButton(_ sender: Any) {
        // init carts
        var carts = [CartModel]()
        for domain in self.domains {
            let cart = CartModel()
            cart.id = UUID().uuidString
            cart.kind = self._type
            cart.domain = domain.domain
            cart.time = " 1 năm"
            cart.note = "không có gì"
            carts.append(cart)
        }
        let cartsView = CartsViewController()
        cartsView.carts = carts
        self.navigationController?.pushViewController(cartsView, animated: true)
    }
}

extension DomainRegistrationViewController : UITableViewDelegate {
    
}

extension DomainRegistrationViewController : UITableViewDataSource {
    // setup tableViewCell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.domains.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DomainTableViewCell", for: indexPath) as! DomainTableViewCell
        cell.adjustView(domain: domains[indexPath.row], placeholder: self._placeholder)
        cell.delegate = self
        return cell
    }
}

extension DomainRegistrationViewController : DomainTableViewCellDelegate {

    func update(value: String, domain: DomainModel) {
        let index = self.domains.index{ $0.id == domain.id }
        guard let row = index else {
            return
        }
        self.domains[row].domain = value
    }
    
    func delete(domain: DomainModel) {
        let index = self.domains.index{ $0.id == domain.id }
        guard let row = index else {
            return
        }
        //
        self.domains.remove(at: row)
        //
        tableView.beginUpdates()
        tableView.deleteRows(at: [IndexPath.init(row: row, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
}
