//
//  SendMailToCustomerViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/19/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class SendMailToCustomerViewController: BaseSubViewController {
    
    @IBOutlet weak var scrollView       : UIScrollView!
    @IBOutlet weak var sendView         : UIView!
    @IBOutlet weak var sendLabel        : UILabel!
    @IBOutlet weak var segmentControl   : UISegmentedControl!
    @IBOutlet weak var listSendTextView : UITextView!
    @IBOutlet weak var titleLabel       : UILabel!
    @IBOutlet weak var titletextField   : UITextField!
    @IBOutlet weak var contentLabel     : UILabel!
    @IBOutlet weak var contentTextView  : UITextView!
    @IBOutlet weak var sendButton       : UIButton!
    
    var titleString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        // scrollView 
        let heightScrollView = view.height - STATUSBAR_HEIGHT - NAVBAR_HEIGHT - TABBAR_HEIGHT - MARGIN*2 - 44
        scrollView.frame = CGRect.init(x: 0, y: STATUSBAR_HEIGHT + NAVBAR_HEIGHT, width: view.width,
                                       height: heightScrollView)
        // sendView
        sendView.frame = CGRect.init(x: 0, y: 0, width: scrollView.width, height: sendView.height)
        // sendLabel
        sendLabel.frame = CGRect.init(x: MARGIN, y: MARGIN,
                                      width: sendView.width - MARGIN*2,
                                      height: sendLabel.height)
        // segmentControl
        segmentControl.frame = CGRect.init(x: MARGIN, y: sendLabel.bottom + MARGIN,
                                           width: sendView.width - MARGIN*2,
                                           height: segmentControl.height)
        segmentControl.addTarget(self, action: #selector(segmentedDidChange(segmented:)),
                                 for: .valueChanged)
        // listSendTextView
        listSendTextView.frame = CGRect.init(x: MARGIN, y: segmentControl.bottom + MARGIN,
                                             width: sendView.width - MARGIN*2, height: 0)
        listSendTextView.text = "Nhập danh sách email gửi đến (cách nhau bằng dấu ' , ' )"
        listSendTextView.textColor = AppColor.GRAY_COLOR
        listSendTextView.clipsToBounds = true
        listSendTextView.layer.cornerRadius = MARGIN
        listSendTextView.borderWidth = 0.5
        listSendTextView.borderColor = AppColor.GRAY_COLOR
        // setupOthers
        self.setupOthers()
        // titletextField
        titletextField.addBottomBorderWithColor(color: AppColor.GRAY_COLOR, width: 0.5)
        // contentTextView
        contentTextView.text = "Nhập nội dung email"
        contentTextView.textColor = AppColor.GRAY_COLOR
        contentTextView.clipsToBounds = true
        contentTextView.layer.cornerRadius = MARGIN
        contentTextView.borderWidth = 0.5
        contentTextView.borderColor = AppColor.GRAY_COLOR
        // sendButton
        sendButton.frame = CGRect.init(x: MARGIN*6, y: scrollView.bottom + MARGIN,
                                       width: view.width - MARGIN*12, height: 44)
        sendButton.clipsToBounds = true
        sendButton.layer.cornerRadius = MARGIN
    }
    
    func setupOthers() {
        self.sendView.height = self.listSendTextView.bottom + MARGIN
        // titleLabel
        titleLabel.frame = CGRect.init(x: MARGIN, y: sendView.bottom + MARGIN,
                                       width: scrollView.width - MARGIN*2,
                                       height: titleLabel.height)
        // titletextField
        titletextField.frame = CGRect.init(x: MARGIN, y: titleLabel.bottom + MARGIN,
                                           width: scrollView.width - MARGIN*2,
                                           height: titletextField.height)
        // contentLabel
        contentLabel.frame = CGRect.init(x: MARGIN, y: titletextField.bottom + MARGIN,
                                         width: scrollView.width - MARGIN*2,
                                         height: contentLabel.height)
        // contentTextView
        contentTextView.frame = CGRect.init(x: MARGIN, y: contentLabel.bottom + MARGIN,
                                            width: scrollView.width - MARGIN*2,
                                            height: contentTextView.height)
        scrollView.contentSize = CGSize.init(width: scrollView.width, height: contentTextView.bottom + MARGIN)
    }
    
    @objc func segmentedDidChange(segmented: UISegmentedControl){
        if (segmented.selectedSegmentIndex == 0) {
            UIView.animate(withDuration: 0.25) {
                self.listSendTextView.height = 0
                self.setupOthers()
            }
        } else {
            UIView.animate(withDuration: 0.25) {
                self.listSendTextView.height = 100
                self.setupOthers()
            }
        }
    }
    
    // MARK: - Action Method
    @IBAction func onPressSendButton(_ sender: Any) {
        //        let alertView = UIAlertController.init(title: "", message: self.inputs.toJSONString(), preferredStyle: .alert)
        //        alertView.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        //        alertView.show()
        self.navigationController?.popViewController(animated: true)
    }
}

extension SendMailToCustomerViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.textColor == AppColor.GRAY_COLOR) {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.tag == 0) { // listTextView
            if (textView.text.isEmpty) {
                textView.text = "Nhập danh sách email gửi đến (cách nhau bằng dấu ' , ' )"
                textView.textColor = AppColor.GRAY_COLOR
            }
        } else { // contentTextView
            if (textView.text.isEmpty) {
                textView.text = "Nhập nội dung email"
                textView.textColor = AppColor.GRAY_COLOR
            }
        }
    }
}
