//
//  ViewTransactionViewController.swift
//  PAVietNam
//
//  Created by SSN on 5/9/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class ViewTransactionViewController: BaseSubViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    var titleString = String()
    var inputs = [InputModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputs = ResponseModel(JSON: RESPONSE.TRANSFER_MONEY)!.transferMoney
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
        // tableView
        let heightTableView: CGFloat = CGFloat(inputs.count * 60)
        self.tableView.register(UINib(nibName: "InputTextFieldTableViewCell",bundle: nil), forCellReuseIdentifier: "InputTextFieldTableViewCell")
        self.tableView.frame = CGRect.init(x: 0, y: 0, width: view.width, height: heightTableView)
        self.tableView.tableFooterView = UIView()
        // nextButton
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = MARGIN
        nextButton.frame = CGRect.init(x: MARGIN*6, y: tableView.bottom + MARGIN,
                                       width: view.width - MARGIN*12, height: 44)
    }
    // MARK: - Action Method
    
    @IBAction func onPressNextButton(_ sender: Any) {
        //        let alertView = UIAlertController.init(title: "", message: self.inputs.toJSONString(), preferredStyle: .alert)
        //        alertView.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        //        alertView.show()
        self.navigationController?.popViewController(animated: true)
    }
}

extension ViewTransactionViewController : UITableViewDelegate {
    
}

extension ViewTransactionViewController : UITableViewDataSource {
    
    // setup tableViewCell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InputTextFieldTableViewCell", for: indexPath) as! InputTextFieldTableViewCell
        cell.adjustView(input: inputs[indexPath.row], indexPath: indexPath)
        cell.delegate = self
        return cell
    }
}

extension ViewTransactionViewController: InputTextFieldTableViewCellDelegate {
    
    func update(value: String, indexPath: IndexPath) {
        self.inputs[indexPath.row].value = value
    }
}
