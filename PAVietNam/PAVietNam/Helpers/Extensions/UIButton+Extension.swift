//
//  UIButton+Extension.swift
//  PAVietNam
//
//  Created by SSN on 5/10/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import Foundation

public extension UIButton {
    
    public func setEnabled(enabled : Bool) {
        self.isEnabled = enabled
        self.alpha = enabled ? 1.0 : 0.5
    }
}
