//
//  Config.swift
//  PAVietNam
//
//  Created by SSN on 4/2/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import Foundation
import UIKit

let kScreenWidth        =   UIScreen.main.bounds.size.width
let kScreenHeight       =   UIScreen.main.bounds.size.height
let kTabBarHeight       =   49  as CGFloat
let kStatusBarHeight    =   20  as CGFloat
let kNavBarHeight       =   44  as CGFloat
let kMargin             =   8   as CGFloat
let kLabelHeight        =   25  as CGFloat
let kTextFieldHeight    =   30  as CGFloat

struct AppColor {
    static let MAIN_COLOR : UIColor = UIColor.init(red: 221/255, green: 26/255,  blue: 91/255, alpha: 1.0)
    static let GRAY_COLOR : UIColor = UIColor.gray
}

struct AppFont {

}

struct TEXT {
    // TEXT Alert
    static let NETWORK_ERROR       : String   = "No internet connection. Please check your connection settings and ensure you are connected to the internet"
    static let ERROR               : String   = "Error"
    static let WARNING             : String   = "Warning"
    static let OK                  : String   = "OK"
    static let CANCEL              : String   = "Cancel"
    // local String
    static let HOME                : String   = "Trang Chủ"
    static let REGISTRATION        : String   = "Đăng Ký"
    static let SUPPORT             : String   = "Support"
    static let SERVICE             : String   = "Dịch Vụ"
    static let ACCOUNT             : String   = "Tài Khoản"
    static let NOTIFY              : String   = "Thông Báo"
    static let PROMOTION           : String   = "Khuyến Mãi"
    
    static let TITLE_REGISTRATION  : String   = "Đăng Ký / Gia Hạn"
    static let TITLE_SUPPORT       : String   = "Support"
    static let TITLE_SERVICE       : String   = "Quản Lý Dịch Vụ"
    static let TITLE_ACCOUNT       : String   = "Tài Khoản"

}

// URL
struct KEY {
    // BASE_URL
}

// format Date
struct FORMAT {
    
}

