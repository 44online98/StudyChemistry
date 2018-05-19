//
//  SearchQuestionsViewController.swift
//  PAVietNam
//
//  Created by SSN on 4/12/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class SearchQuestionsViewController: BaseSubViewController {

    var titleString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupView() {
        self.navigationItem.title = titleString
        // add rightBarButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "icon_filter"), style: .plain, target: self, action: #selector(self.onPressFilterButton(_:)))

    }
    
    fileprivate lazy var segments_1: SegmentedControl = {
        let styles: [String] = ["Yêu cầu mới gửi", "Đang xử lý", "Đã trả lời", "Đã xử lý xong"]
        $0.segmentTitles = styles
        $0.action { [unowned self] index in
            switch styles[index] {
                case "Yêu cầu mới gửi": break
                case "Đang xử lý":      break
                case "Đã trả lời":      break
                case "Đã xử lý xong":   break
            default: break }
        }
        $0.tintColor = AppColor.MAIN_COLOR
        return $0
    }(SegmentedControl.init(frame: CGRect.init(x: MARGIN, y: MARGIN,
                                               width: SCREEN_WIDTH - MARGIN*4, height: 30)))
    
    fileprivate lazy var segments_2: SegmentedControl = {
        let styles: [String] = ["Nội dung câu hỏi", "Phần trao đổi"]
        $0.segmentTitles = styles
        $0.action { [unowned self] index in
            switch styles[index] {
                case "Nội dung câu hỏi":  break
                case "Phần trao đổi":     break
            default: break }
        }
        $0.tintColor = AppColor.MAIN_COLOR
        return $0
    }(SegmentedControl.init(frame: CGRect.init(x: MARGIN, y: 30 + MARGIN*2,
                                               width: SCREEN_WIDTH - MARGIN*4, height: 30)))
    
    // MARK: - Action Method
    
    @objc func onPressFilterButton(_ button: UIBarButtonItem!){
        let popoverView : UIViewController = UIViewController()
        segments_1.selectedSegmentIndex = 0
        popoverView.view.addSubview(segments_1)
        segments_2.selectedSegmentIndex = 0
        popoverView.view.addSubview(segments_2)
        popoverView.preferredContentSize = CGSize.init(width: SCREEN_WIDTH - MARGIN*2, height: SCREEN_WIDTH - MARGIN*2)
        popoverView.modalPresentationStyle = .popover
        popoverView.popoverPresentationController?.delegate = self
        popoverView.popoverPresentationController?.barButtonItem = button
        popoverView.popoverPresentationController?.permittedArrowDirections = .up
        present(popoverView, animated: true, completion: nil)
    }
}

// MARK: - - UIPopoverPresentationControllerDelegate
extension SearchQuestionsViewController: UIPopoverPresentationControllerDelegate{
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        // Will Dismiss
        return true
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        // Did Dismiss
    }
    
    // UIAdaptivePresentationControllerDelegate
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
