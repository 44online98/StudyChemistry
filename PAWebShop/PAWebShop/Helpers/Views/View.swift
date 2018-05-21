//
//  View.swift
//  PAVietNam
//
//  Created by SSN on 5/16/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import Foundation

open class View: UIView {
    
    public typealias Action = (View) -> Swift.Void
    
    fileprivate var actionOnTouch: Action?
    
    init() {
        super.init(frame: .zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func action(_ closure: @escaping Action) {
        print("action did set")
        if actionOnTouch == nil {
            let gesture = UITapGestureRecognizer(
                target: self,
                action: #selector(View.actionOnTouchUpInside))
            gesture.numberOfTapsRequired = 1
            gesture.numberOfTouchesRequired = 1
            self.addGestureRecognizer(gesture)
            self.isUserInteractionEnabled = true
        }
        self.actionOnTouch = closure
    }
    
    @objc internal func actionOnTouchUpInside() {
        actionOnTouch?(self)
    }
    
    init(width: CGFloat, height: CGFloat, text: String) {
        super.init(frame: CGRect.init(x: 0, y: 0, width: width, height: height))
        self.backgroundColor = .white
        
        let label = UILabel.init(frame: CGRect.init(x: 8, y: 0, width: width - 8*2, height: height))
        label.text = text
        label.textColor = AppColor.MAIN_COLOR
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        self.addSubview(label)
    }
    
    init(width: CGFloat, height: CGFloat, text: String, textColor: UIColor) {
        super.init(frame: CGRect.init(x: 0, y: 0, width: width, height: height))
        self.backgroundColor = .white
        
        let label = UILabel.init(frame: CGRect.init(x: 8, y: 4, width: width - 8*2, height: height))
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = text
        label.sizeToFit()
        self.addSubview(label)
    }
}
