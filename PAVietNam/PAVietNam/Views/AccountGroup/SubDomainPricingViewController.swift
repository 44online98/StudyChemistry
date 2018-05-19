//
//  SubDomainPricingViewController.swift
//  PAVietNam
//
//  Created by SSN on 5/9/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class SubDomainPricingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var desc = String()
    var pricings = [PricingsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // viewContainer
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT - STATUSBAR_HEIGHT - NAVBAR_HEIGHT - TABBAR_HEIGHT
        // tableView
        let heightTableView: CGFloat = view.height - 44
        self.tableView.frame = CGRect.init(x: 0, y: 0, width: view.width , height: heightTableView)
        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

extension SubDomainPricingViewController : UITableViewDelegate {
    
}

extension SubDomainPricingViewController : UITableViewDataSource {
    // setup tableViewCell
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.pricings.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = View.init(width: self.view.width, height: 28, text: self.pricings[section].kind)
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pricings[section].pricing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let identifier: String = "DomainPricingView"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        cell?.selectionStyle = .none
        // textLabel
        let pricing = self.pricings[indexPath.section].pricing[indexPath.row]
        let string = String(format: "%@:", pricing.title)
        let fullString = String(format: "%@: %@", pricing.title, pricing.service)
        let attributedString = NSMutableAttributedString(string: fullString)
        attributedString.addAttributes([NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 17.0)], range: (fullString as NSString).range(of: string))
        cell?.textLabel?.attributedText = attributedString
        // return
        return cell!
    }
}
