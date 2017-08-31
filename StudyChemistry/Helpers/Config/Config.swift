//
//  Config.swift
//  FindWay
//
//  Created by Vinh on 7/30/17.
//  Copyright © 2017 VinhNH. All rights reserved.
//

import UIKit

let kScreenWidth        =   UIScreen.main.bounds.size.width
let kScreenHeight       =   UIScreen.main.bounds.size.height
let kTabBarHeight       =   49  as CGFloat
let kStatusBarHeight    =   20  as CGFloat
let kNavBarHeight       =   44  as CGFloat
let kMargin             =   8   as CGFloat
let kLabelHeight        =   25  as CGFloat
let kTextFieldHeight    =   30  as CGFloat

struct COLOR {
    
    static let MAIN     : UIColor = UIColor(red: 9/255, green: 78/255,
                                            blue: 172/255, alpha: 1.00)
}

struct FONT {
    
    static let MX_BOLD       : String = "BillCorpMX-Bold"
    static let MX_EXTRABOLD  : String = "BillCorpMX-ExtraBold"
}

struct TEXT {
    /* TEXT Alert
     */
    static let NETWORK_ERROR       : String   = "Network is error"
    static let ERROR               : String   = "Error"
    static let WARNING             : String   = "Warning"
    static let OK                  : String   = "OK"
    static let CANCEL              : String   = "Cancel"
    
}

struct FORMAT {
    static let BIRTHDAY            : String   = "dd MMM yyyy"
    static let TIME                : String   = "hh:mma '(Today,' dd MMMM ')'"
    
}
