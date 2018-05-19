//
//  SubPricingViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/23/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class SubPricingViewController: UIViewController {
    
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var desc = String()
    var pricings = [PricingsModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // viewContainer
        self.view.width = SCREEN_WIDTH
        self.view.height = SCREEN_HEIGHT - STATUSBAR_HEIGHT - NAVBAR_HEIGHT - TABBAR_HEIGHT
        // informationLabel
        informationLabel.frame = CGRect.init(x: MARGIN, y: MARGIN,
                                            width: view.width - MARGIN*2, height: informationLabel.height)
        informationLabel.text = self.desc
        // tableView
        let heightTableView: CGFloat = view.height - 44 - 44
        self.tableView.frame = CGRect.init(x: 0, y: 44, width: view.width , height: heightTableView)
        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

extension SubPricingViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let pricing = self.pricings[indexPath.section].pricing[indexPath.row]
        let alert = UIAlertController.init(title: "", message: pricing.info, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        alert.show()

    }
}

extension SubPricingViewController : UITableViewDataSource {
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

        let identifier: String = "HostingPricing"
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
        // accessoryType
        if(pricing.info.count > 0) {
            cell?.accessoryType = .detailButton
        }
        // return
        return cell!
    }
    
}
