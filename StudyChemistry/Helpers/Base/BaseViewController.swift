//
//  BaseViewController.swift
//  FindWay
//
//  Created by Vinh on 7/30/17.
//  Copyright © 2017 VinhNH. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    var veilView: UIView?
    var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationItem()
    }
    
    private func setNavigationItem(){
        
        /* setup navigationBar
         * barTintColor
         * titleTextAttributes (title color)
         * tintColor(left button color)
         * isTranslucent
         */
        navigationController?.navigationBar.barTintColor        = COLOR.MAIN
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        navigationController?.navigationBar.tintColor           = .white
        navigationController?.navigationBar.isTranslucent       = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
// MARK: - Indicator
extension BaseViewController {
    
    func showAlertWith( title: String, message: String ){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: TEXT.OK, style: UIAlertActionStyle.default) {
            UIAlertAction in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func startActivityIndicator() {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        guard let rootview = UIApplication.shared.keyWindow else { return }
        // Setup indicator
        activityIndicator = UIActivityIndicatorView()
        activityIndicator?.hidesWhenStopped = true
        activityIndicator?.activityIndicatorViewStyle  = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator?.center = rootview.center
        activityIndicator?.layer.zPosition = 9999
        rootview.addSubview(activityIndicator!)
        
        self.veilView = UIView(frame: rootview.frame)
        self.veilView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        veilView?.layer.zPosition = 9990
        rootview.insertSubview(self.veilView!, belowSubview: self.activityIndicator!)
        activityIndicator?.startAnimating()
    }
    
    func stopActivityIndicator() {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        self.veilView?.removeFromSuperview()
        self.activityIndicator?.stopAnimating()
        self.activityIndicator?.removeFromSuperview()
    }
}
