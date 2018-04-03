//
//  BaseViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/2/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    var veilView: UIView?
    var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
    }
    
    private func setupNavigationBar(){
         // barTintColor
         // titleTextAttributes (.foregroundColor color)
         // tintColor(left button color)
         // isTranslucent
        navigationController?.navigationBar.barTintColor        = AppColor.MAIN_COLOR
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor           = .white
        navigationController?.navigationBar.isTranslucent       = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
// MARK: - Indicator
extension BaseViewController {
    
    func showAlertWith(title: String, message: String){
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
