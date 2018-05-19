//
//  FilterViewController.swift
//  PAVietNam
//
//  Created by SSN on 5/3/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var kind = String()
    var group = [InputModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (self.kind == "VAT") {
            self.group = ResponseModel(JSON: RESPONSE.FILTERS_VAT)!.filter
        } else {
            self.group = ResponseModel(JSON: RESPONSE.FILTERS)!.filter
        }
        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        self.navigationItem.title = "Filters"
        // viewContainer
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT
        // add leftBarButtonItem
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .cancel,target: self, action:#selector(self.onPressCancelButton(_:)))
        // add rightBarButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done,target: self, action:#selector(self.onPressDoneButton(_:)))
        // tableView
        self.tableView.register(UINib(nibName: "InputPickerTableViewCell",bundle: nil), forCellReuseIdentifier: "InputPickerTableViewCell")
        self.tableView.register(UINib(nibName: "InputTextFieldTableViewCell",bundle: nil), forCellReuseIdentifier: "InputTextFieldTableViewCell")
        self.tableView.frame = CGRect.init(x: 0, y: 0, width: view.width, height: view.height - STATUSBAR_HEIGHT - NAVBAR_HEIGHT)
        self.tableView.tableFooterView = UIView()
    }
    
    @objc func onPressCancelButton(_ button: UIBarButtonItem!){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func onPressDoneButton(_ button: UIBarButtonItem!){
//        let alertView = UIAlertController.init(title: "", message: self.group.toJSONString(), preferredStyle: .alert)
//        alertView.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
//        alertView.show()
        self.dismiss(animated: true, completion: nil)
    }
}

extension FilterViewController : UITableViewDelegate {
    
}

extension FilterViewController : UITableViewDataSource {
    // setup tableViewCell
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let input = group[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "InputPickerTableViewCell", for: indexPath) as! InputPickerTableViewCell
        cell.adjustView(input: input, indexPath: indexPath)
        cell.delegate = self
        return cell
    }
}

extension FilterViewController: InputPickerTableViewCellDelegate {
    func updatePicker(value: String, indexPath: IndexPath) {
        self.group[indexPath.row].value = value
    }
}
