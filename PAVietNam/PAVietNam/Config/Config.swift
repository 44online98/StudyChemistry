//
//  Config.swift
//  PAVietNam
//
//  Created by SSN on 4/2/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import Foundation
import UIKit

let SCREEN_WIDTH        =   UIScreen.main.bounds.size.width
let SCREEN_HEIGHT       =   UIScreen.main.bounds.size.height
let STATUSBAR_HEIGHT    =   UIApplication.shared.statusBarFrame.size.height
let NAVBAR_HEIGHT       =   44 as CGFloat
let TABBAR_HEIGHT       =   (UIScreen.main.bounds.size.height == 812) ? 83 : 49 as CGFloat
let MARGIN              =   8 as CGFloat
let SIZE_BUTTON         =   28 as CGFloat

struct AppColor {
    static let MAIN_COLOR : UIColor = UIColor.init(hexString: "DD1A5B")
    static let GRAY_COLOR : UIColor = UIColor.gray
    static let LIGHT_COLOR : UIColor = UIColor.init(hexString: "F2F2F2")
}

struct Support {
    static let title          : String   = "Hỗ Trợ Kỹ Thuật"
    static let numberPhone    : String   = "19009477"
    static let detail         : String   = "ONLINE: [24 / 7 / 365]"
}

struct Complain {
    static let title          : String   = "Than Phiền Nhân Viên"
    static let numberPhone    : String   = "0908086513"
    static let detail         : String   = "Làm việc: [9:00am-5:30pm]"
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
    static let SUPPORT             : String   = "Hỗ Trợ"
    static let SERVICE             : String   = "Dịch Vụ"
    static let ACCOUNT             : String   = "Tài Khoản"
    static let NOTIFY              : String   = "Thông Báo"
    static let PROMOTION           : String   = "Khuyến Mãi"
    
    static let TITLE_HOME          : String   = "P.A VIET NAM LTD"
    static let TITLE_REGISTRATION  : String   = "Đăng Ký / Gia Hạn"
    static let TITLE_SUPPORT       : String   = "Hỗ Trợ"
    static let TITLE_SERVICE       : String   = "Quản Lý Dịch Vụ"
    static let TITLE_ACCOUNT       : String   = "Quản Lý Tài Khoản"
    
    static let TITLE_DETAIL_NOTIFY          : String   = "Chi Tiết Thông Báo"
    static let TITLE_DETAIL_PROMOTION       : String   = "Chi Tiết Khuyến Mãi"
    
    static let TITLE_CONTENT_FEEDBACK  : String   = "Gửi Thư Phản Ánh Phong Cách Phục Vụ Đến Cấp Quản Lý"
    static let TITLE_CARTS: String = "Giỏ Hàng"
    static let TITLE_ORDERS: String = "Đơn Hàng"
}

struct Section {
    var name: String
    var rows: [Row]
}

struct Row {
    var title: String
    var image: String
}



// RESPONSE_DUMMY
struct RESPONSE {
    
    static let NOTIFY = [ "notify": [
        ["title": "Bảo trì server",
         "description": "Bảo trì hệ thống Linux Hosting. Bắt đầu:   00:00, Chủ Nhật, ngày 19 tháng 06 năm 2016. Kết thúc:  06:00, Chủ Nhật, ngày 19 tháng 06 năm 2016",
         "isRead": false
         ],
        ["title": "Yêu cầu khách phản hồi cho câu hỏi",
         "description": "Bên bộ phận support đã trả lời câu hỏi F5C5123 cho bạn. Vui lòng xác nhận lại",
         "isRead": false
        ],
        ["title": "Yêu cầu khách nhập bản khai",
         "description": "Vui lòng nhập thông tin bản khai",
         "isRead": false
        ],
        ["title": "Yêu cầu khách nạp thêm tiền",
         "description": "Tài khoản PA-192934 đã hết tiền trong tài khoản. Vui lòng nạp thêm tiền vào tài khoản để thực hiện các giao dịch cần thiết",
         "isRead": false
        ],
        ["title": "Yêu cầu khách gia hạn tên miền",
         "description": "Tên Miền giá.vn của bạn đã hết hạn. Vui lòng gia hạn sớm để có dịch vụ tốt nhất",
         "isRead": false
        ],
        ["title": "Yêu cầu khách nhập bản khai",
         "description": "Vui lòng nhập thông tin bản khai",
         "isRead": false
        ],
        ["title": "Yêu cầu khách nạp thêm tiền",
         "description": "Tài khoản PA-192934 đã hết tiền trong tài khoản. Vui lòng nạp thêm tiền vào tài khoản để thực hiện các giao dịch cần thiết",
         "isRead": false
        ],
        ["title": "Yêu cầu khách gia hạn tên miền",
         "description": "Tên Miền giá.vn của bạn đã hết hạn. Vui lòng gia hạn sớm để có dịch vụ tốt nhất",
         "isRead": false
        ],
        ["title": "Yêu cầu khách nhập bản khai",
         "description": "Vui lòng nhập thông tin bản khai",
         "isRead": false
        ],
        ["title": "Yêu cầu khách nạp thêm tiền",
         "description": "Tài khoản PA-192934 đã hết tiền trong tài khoản. Vui lòng nạp thêm tiền vào tài khoản để thực hiện các giao dịch cần thiết",
         "isRead": false
        ],
        ["title": "Yêu cầu khách gia hạn tên miền",
         "description": "Tên Miền giá.vn của bạn đã hết hạn. Vui lòng gia hạn sớm để có dịch vụ tốt nhất",
         "isRead": false
        ],
        ]]
    
    static let PROMOTION = [ "notify": [
        ["title": "GIÁ SỐC MỪNG ĐẠI LỄ 30/4 - 1/5",
         "description": "GIẢM GIÁ CỰC SỐC lên đến 30% dịch vụ TỔNG ĐÀI ẢO nhân dịp Lễ 30/4 - 1/5",
         "isRead": false
        ],
        ["title": "CHÀO ĐẠI LỄ - GIÁ CỰC MÊ",
         "description": "Mừng Đại lễ Giỗ tổ Hùng Vương 10/3; Giải phóng miền Nam 30/4 & Quốc tế Lao Động 1/5, đồng thời hưởng ứng phong trào phổ cập chứng chỉ bảo mật cho website trên toàn thế giới, giúp kiến tạo môi trường Internet luôn an toàn và bảo mật tuyệt đối cho người dùng, loại bỏ hoàn toàn các site lừa đảo, không an toàn.",
         "isRead": false
        ],
        ["title": "ƯU ĐÃI ĐẶC BIỆT, HẠ NHIỆT MÙA HÈ",
         "description": "ƯU ĐÃI ĐẶC BIỆT - HẠ NHIỆT MÙA HÈ cùng P.A Việt Nam!",
         "isRead": false
        ],
        ["title": "BÍ KÍP TĂNG TỐC WEBSITE WORDPRESS CHO BẠN!",
         "description": "Tại P.A Việt Nam, dịch vụ WORDPRESS HOSTING được hỗ trợ FREE công nghệ CDN (Content Delivery Network - công nghệ phân tán network) sẽ giúp website của bạn tăng tốc x10 lần!!!",
         "isRead": false
        ],
        ["title": "GIẢM NGAY 30% GÓI SEO HOSITNG VÀO THỨ 6 HÀNG TUẦN",
         "description": "Giảm ngay 30% giá dịch vụ SEO HOSTING vào thứ 6 hàng tuần tại P.A Việt Nam. Đừng bỏ lỡ cơ hội!",
         "isRead": false
        ],
        ["title": "GIÁ SỐC MỪNG ĐẠI LỄ 30/4 - 1/5",
         "description": "GIẢM GIÁ CỰC SỐC lên đến 30% dịch vụ TỔNG ĐÀI ẢO nhân dịp Lễ 30/4 - 1/5",
         "isRead": false
        ],
        ["title": "CHÀO ĐẠI LỄ - GIÁ CỰC MÊ",
         "description": "Mừng Đại lễ Giỗ tổ Hùng Vương 10/3; Giải phóng miền Nam 30/4 & Quốc tế Lao Động 1/5, đồng thời hưởng ứng phong trào phổ cập chứng chỉ bảo mật cho website trên toàn thế giới, giúp kiến tạo môi trường Internet luôn an toàn và bảo mật tuyệt đối cho người dùng, loại bỏ hoàn toàn các site lừa đảo, không an toàn.",
         "isRead": false
        ],
        ["title": "BÍ KÍP TĂNG TỐC WEBSITE WORDPRESS CHO BẠN!",
         "description": "Tại P.A Việt Nam, dịch vụ WORDPRESS HOSTING được hỗ trợ FREE công nghệ CDN (Content Delivery Network - công nghệ phân tán network) sẽ giúp website của bạn tăng tốc x10 lần!!!",
         "isRead": false
        ],
        ]]
    
    static let CALLCENTER_VIEW = [ "informationCustomer":
        [
            [ "section": "",
              "inputs": [
                ["title": "Số lượng dịch vụ", "value": "1", "kind": "picker", "placeholder": "", "datas": ["1", "2", "3", "4", "5", "6", "7", "8"]],
                ["title": "Sever type", "value": "UNIX Hosting", "kind": "segment", "placeholder": "", "datas": ["UNIX Hosting", "Windows Hosting"]],
                ]
            ]
        ]
    ]
    
    static let SERVER_VIEW = [ "informationCustomer":
        [
            [ "section": "",
              "inputs": [
                ["title": "Hệ điều hành", "value": "UNIX Hosting", "kind": "segment", "placeholder": "", "datas": ["UNIX Hosting", "Windows Hosting"]],
                ]
              ]
            ]
    ]
    
    static let MAILSERVER_VIEW = [ "informationCustomer":
        [
            [ "section": "",
              "inputs": [
                ["title": "Nhập tền miền *", "value": "", "kind": "email", "placeholder": ""],
                ]
            ],
        ]
    ]
    
    static let HOSTINGS_VIEW = [ "informationCustomer":
        [
            [ "section": "",
              "inputs": [
                ["title": "Nhập tền miền *", "value": "", "kind": "email", "placeholder": ""],
                ["title": "Hệ điều hành", "value": "UNIX Hosting", "kind": "segment", "placeholder": "", "datas": ["UNIX Hosting", "Windows Hosting"]],
                ]
            ],
        ]
    ]
    
    static let HOSTINGS = [ "hostings": [
        ["kind": "",
         "hostings": [
            ]
        ],
        ["kind": "HostPro",
         "hostings": ["(4GB) 1.308.182 đ/12 tháng",
                      "(6GB) 1.331.818 đ/6 tháng",
                      "(6GB) 2.663.636 đ/12 tháng",
                      "(8GB) 1.936.636 đ/6 tháng",
                      "(8GB) 3.927.273 đ/12 tháng",
                      "(10GB) 2.663.636 đ/6 tháng",
                      "(10GB) 5.326.364 đ/12 tháng",
                      "(12GB) 545.400 đ/1 tháng",
                      "(12GB) 1.6336.364 đ/3 tháng",
                      "(12GB) 3.272.727 đ/6 tháng",
                      "(12GB) 6.544.545 đ/12 tháng"
            ]
        ],
        ["kind": "Superhost",
         "hostings": ["(35GB) 750.000 đ/1 tháng",
                      "(35GB) 2.250.000 đ/3 tháng",
                      "(35GB) 4.500.000 đ/6 tháng",
                      "(35GB) 9.000.000 đ/12 tháng",
                      "(50GB) 3.000.000 đ/3 tháng",
                      "(50GB) 6.000.000 đ/6 tháng",
                      "(50GB) 12.000.000 đ/12 tháng",
                      "(70GB) 5.400.000 đ/3 tháng",
                      "(70GB) 10.800.000 đ/6 tháng",
                      "(70GB) 21.600.000 đ/12 tháng",
                      "(100GB) 8.400.000 đ/3 tháng",
                      "(100GB) 16.800.000 đ/6 tháng",
                      "(100GB) 33.600.000 đ/12 tháng",
                      "(200GB) 3.600.000 đ/1 tháng",
                      "(200GB) 10.800.000 đ/3 tháng",
                      "(200GB) 21.600.000 đ/6 tháng",
                      "(200GB) 43.200.000 đ/12 tháng"
            ]
        ],
        ["kind": "Dedicated Host",
         "hostings": ["(3GB) 2.028.182 đ/12 tháng",
                      "(3GB) 3.650.000 đ/24 tháng",
                      "(3GB) 5.171.818 đ/36 tháng",
                      "(3GB) 6.490.000 đ/48 tháng",
                      "(3GB) 7.605.455 đ/60 tháng",
                      "(5GB) 1.673.636 đ/6 tháng",
                      "(5GB) 3.348.182 đ/12 tháng",
                      "(5GB) 5.594.545 đ/24 tháng",
                      "(5GB) 8.537.273 đ/36 tháng",
                      "(5GB) 10.713.636 đ/48 tháng",
                      "(5GB) 12.555.455 đ/60 tháng",
                      "(7GB) 389.000 đ/1 tháng",
                      "(7GB) 2.333.636 đ/6 tháng",
                      "(7GB) 4.668.182 đ/12 tháng",
                      "(7GB) 8.402.727 đ/24 tháng",
                      "(7GB) 11.903.636 đ/36 tháng",
                      "(7GB) 14.937.273 đ/48 tháng",
                      "(7GB) 17.505.455 đ/60 tháng",
                      "(9GB) 2.993.636 đ/6 tháng",
                      "(9GB) 5.988.182 đ/12 tháng",
                      "(9GB) 10.778.182 đ/24 tháng",
                      "(9GB) 15.269.091 đ/36 tháng",
                      "(9GB) 19.161.818 đ/48 tháng",
                      "(9GB) 22.455.455 đ/60 tháng",
                      "(12GB) 599.00 đ/1 tháng",
                      "(12GB) 1.797.273 đ/3 tháng",
                      "(12GB) 3.593.636 đ/6 tháng",
                      "(12GB) 7.188.182 đ/12 tháng",
                      "(12GB) 12.938.182 đ/24 tháng"
            ]
        ]]]
    
    static let CARTS = [ "carts": [
        ["id": "AD4D2EDC-4CC1-49EF-8E35-AB92645283BE",
         "kind": "Tên Miền",
         "domain": "vinhdeptrai.xyz",
         "time": " 1 năm",
         "note": "không có gì",
         ],
        ["id": "8B80BB7F-3F55-45A9-9654-32D00C189346",
         "kind": "TRY_WEB30S_SHOP_1MONTHS",
         "domain": "vinhdeptrai.xyz",
         "time": " 1 tháng",
         "note": "không có gì",
         ],
        ]]
    
    static let INDIVIDUAL = [
        ["title": "Hình thức *", "value": "Cá nhân", "kind": "segment", "placeholder": "", "datas": ["Cá nhân", "Công ty"]],
        ["title": "Email chính *", "value": "", "kind": "email", "placeholder": ""],
        ["title": "Email phụ", "value": "", "kind": "email", "placeholder": ""],
        ["title": "Tên chủ thể *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Số CMND *", "value": "", "kind": "number", "placeholder": ""],
        ["title": "Địa chỉ *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Điện thoại *", "value": "", "kind": "number", "placeholder": ""],
        ["title": "Giới tính", "value": "Nam", "kind": "segment", "placeholder": "", "datas": ["Nam", "Nữ"]],
        ["title": "Ngày sinh", "value": "", "kind": "date", "placeholder": ""],
        ]
    
    static let ORGANIZATION = [
        ["title": "Hình thức *", "value": "Công ty", "kind": "segment", "placeholder": "", "datas": ["Cá nhân", "Công ty"]],
        ["title": "Email chính *", "value": "", "kind": "email", "placeholder": ""],
        ["title": "Email phụ", "value": "", "kind": "email", "placeholder": ""],
        ["title": "Tên chủ thể *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Người đại diện", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Mã số thuế *", "value": "", "kind": "number", "placeholder": ""],
        ["title": "Địa chỉ *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Điện thoại *", "value": "", "kind": "number", "placeholder": ""],
        ]
    
    static let DISCLAIMER = [
        ["title": "Loại bản khai *", "value": "Cá nhân", "kind": "segment", "placeholder": "", "datas": ["Cá nhân", "Công ty"]]
        ]
    
    static let DISCLAIMER_ORGANIZATION = [
        ["title": "Loại bản khai *", "value": "Công ty", "kind": "segment", "placeholder": "", "datas": ["Cá nhân", "Công ty"]]
    ]
    
    static let MORE_INFORMATION = [
        ["title": "Xuất hoá đơn", "value": "Có", "kind": "segment", "placeholder": "", "datas": ["Có", "Thu VAT trước"]],
        ["title": "Nhập giao dịch tiền", "value": "", "kind": "number", "placeholder": ""]
    ]
    
    static let DNS_INFORMATION = [
        ["title": "Tên DNS 1 *", "value": "ns1.pavietnam.vn", "kind": "text", "placeholder": "Ví dụ: ns1.pavietnam.vn"],
        ["title": "Tên DNS 2 *", "value": "ns2.pavietnam.vn", "kind": "text", "placeholder": "Ví dụ: ns2.pavietnam.vn"],
        ["title": "Tên DNS 3 *", "value": "nsbak.pavietnam.net", "kind": "text", "placeholder": "Ví dụ: nsbak.pavietnam.net"]
    ]
    
    static let INFORMATION = [
        ["title": "Tên chủ thể *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Mã số thuế", "value": "", "kind": "number", "placeholder": ""],
        ["title": "Quốc gia *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Tỉnh thành *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Thành phố", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Địa chỉ *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Điện thoại *", "value": "", "kind": "number", "placeholder": ""],
        ["title": "Fax", "value": "", "kind": "number", "placeholder": ""],
        ["title": "Email *", "value": "", "kind": "email", "placeholder": ""],

    ]
    
    static let INFORMATION_CUSTOMER_INDIVIDUAL_INDIVIDUAL = [ "informationCustomer":
        [
            [ "section": "Thông Tin Khách Hàng",
              "inputs": INDIVIDUAL
            ],
            [ "section": "Thông Tin Bản Khai Tên Miền",
              "inputs": DISCLAIMER
            ],
            [ "section": "Thông Tin DNS",
              "inputs": DNS_INFORMATION
            ],
            [ "section": "Thông Tin Chủ Thể",
              "inputs": INFORMATION
            ],
            [ "section": "Thông Tin Người Thanh Toán",
              "inputs": INFORMATION
            ],
            [ "section": "Thông Tin Thêm",
              "inputs": MORE_INFORMATION
            ]
        ]
    ]
    
    static let INFORMATION_CUSTOMER_INDIVIDUAL_ORGANIZATION = [ "informationCustomer":
        [
            [ "section": "Thông Tin Khách Hàng",
              "inputs": INDIVIDUAL
            ],
            [ "section": "Thông Tin Bản Khai Tên Miền",
              "inputs": DISCLAIMER_ORGANIZATION
            ],
            [ "section": "Thông Tin DNS",
              "inputs": DNS_INFORMATION
            ],
            [ "section": "Thông Tin Chủ Thể",
              "inputs": INFORMATION
            ],
            [ "section": "Thông Tin Người Quản Lý Tên Miền",
              "inputs": INFORMATION
            ],
            [ "section": "Thông Tin Người Quản Lý Kỹ Thuật",
              "inputs": INFORMATION
            ],
            [ "section": "Thông Tin Người Thanh Toán",
              "inputs": INFORMATION
            ],
            [ "section": "Người Thay Mặt Cơ Quan Làm Thủ Tục",
              "inputs": INFORMATION
            ],
            [ "section": "Thông Tin Thêm",
              "inputs": MORE_INFORMATION
            ]
        ]
    ]
    
    static let INFORMATION_CUSTOMER_ORGANIZATION_INDIVIDUAL = [ "informationCustomer":
        [
            [ "section": "Thông Tin Khách Hàng",
              "inputs": ORGANIZATION
            ],
            [ "section": "Thông Tin Bản Khai Tên Miền",
              "inputs": DISCLAIMER
            ],
            [ "section": "Thông Tin DNS",
              "inputs": DNS_INFORMATION
            ],
            [ "section": "Thông Tin Chủ Thể",
              "inputs": INFORMATION
            ],
            [ "section": "Thông Tin Người Thanh Toán",
              "inputs": INFORMATION
            ],
            [ "section": "Thông Tin Thêm",
              "inputs": MORE_INFORMATION
            ]
        ]
    ]
    
    static let INFORMATION_CUSTOMER_ORGANIZATION_ORGANIZATION = [ "informationCustomer":
        [
            [ "section": "Thông Tin Khách Hàng",
              "inputs": ORGANIZATION
            ],
            [ "section": "Thông Tin Bản Khai Tên Miền",
              "inputs": DISCLAIMER_ORGANIZATION
            ],
            [ "section": "Thông Tin DNS",
              "inputs": DNS_INFORMATION
            ],
            [ "section": "Thông Tin Chủ Thể",
              "inputs": INFORMATION
            ],
            [ "section": "Thông Tin Người Quản Lý Tên Miền",
              "inputs": INFORMATION
            ],
            [ "section": "Thông Tin Người Quản Lý Kỹ Thuật",
              "inputs": INFORMATION
            ],
            [ "section": "Thông Tin Người Thanh Toán",
              "inputs": INFORMATION
            ],
            [ "section": "Người Thay Mặt Cơ Quan Làm Thủ Tục",
              "inputs": INFORMATION
            ],
            [ "section": "Thông Tin Thêm",
              "inputs": MORE_INFORMATION
            ]
        ]
    ]
    
    static let SERVICE_INFORMATION = [
        ["title": "Domain", "value": "pcodertest.com", "kind": "notEdit", "placeholder": ""],
        ["title": "IP", "value": "112.213.89.16", "kind": "notEdit", "placeholder": ""],
        ["title": "Dịch vụ", "value": "Cheap #0 - 180.000VND/12 tháng", "kind": "notEdit", "placeholder": ""],
        ["title": "Đổi thời gian thanh toán dịch vụ", "value": "Cheap #0 - 180.000VND/12 tháng", "kind": "picker", "placeholder": "", "datas": ["Cheap #0 - 180.000VND/12 tháng"]],
        ["title": "Thời gian sử dụng", "value": "06/11/2017 - 06/11/2018", "kind": "notEdit", "placeholder": ""],
        ]
    
    static let OWNER_INFORMATION = [
        ["title": "Hình thức *", "value": "Cá nhân", "kind": "notEdit", "placeholder": ""],
        ["title": "Email chính", "value": "pcoderpa@gmail.com", "kind": "notEdit", "placeholder": ""],
        ["title": "Email phụ *", "value": "pcoderpa@yahoo.com", "kind": "notEdit", "placeholder": ""],
        ["title": "Tên chủ thể *", "value": "Pcoder", "kind": "notEdit", "placeholder": ""],
        ["title": "Số CMND", "value": "312131400", "kind": "notEdit", "placeholder": ""],
        ["title": "Địa chỉ *", "value": "Quang Trung, TPHCM", "kind": "notEdit", "placeholder": ""],
        ["title": "Điện thoại *", "value": "0907771938", "kind": "notEdit", "placeholder": ""],
        ["title": "Giới tính", "value": "Nam", "kind": "notEdit", "placeholder": ""],
        ["title": "Ngày sinh", "value": "20/01/1992", "kind": "notEdit", "placeholder": ""]
        ]
    
    static let USER_INFORMATION = [
        ["title": "Hình thức *", "value": "pcoderpa@gmail.com", "kind": "notEdit", "placeholder": ""],
        ["title": "Email", "value": "Pcoder", "kind": "notEdit", "placeholder": ""],
        ["title": "Địa chỉ", "value": "Quang Trung, TPHCM, VN", "kind": "notEdit", "placeholder": ""],
        ["title": "Điện thoại", "value": "0909943761", "kind": "notEdit", "placeholder": ""],
        ["title": "Fax", "value": "", "kind": "notEdit", "placeholder": ""],
        ]
    
    static let INFORMATION_SERVICE = [ "informationService":
        [
            [ "section": "Thông Tin Dịch Vụ",
              "inputs": SERVICE_INFORMATION
            ],
            [ "section": "Thông Tin Chủ Thể",
              "inputs": OWNER_INFORMATION
            ],
            [ "section": "Thông Tin Người Sử Dụng",
              "inputs": USER_INFORMATION
            ]
        ]
    ]
    
    static let SEND_REQUEST = [ "sendRequest": [
        ["title": "Phòng Ban", "value": "", "kind": "picker", "placeholder": "Chọn phòng ban", "datas": REQUEST.DEPARTMENTS],
        ["title": "Chủ đề", "value": "", "kind": "picker", "placeholder": "Vui lòng chọn chủ đề", "datas": REQUEST.TOPICS],
        ["title": "Dịch Vụ", "value": "", "kind": "picker", "placeholder": "Vui lòng chọn dịch vụ", "datas": REQUEST.SERVICES],
        ["title": "Tiêu Đề Yêu Cầu", "value": "", "kind": "text", "placeholder": "Nhập tiêu đề"],
        ["title": "Nội dung", "value": "", "kind": "textView", "placeholder": "Nhập nội dung"]
        ]]
    
    static let FEEDBACK = [ "feedback": [
        ["title": "Mã khách hàng", "value": "PA-192934 (Pcoder)", "kind": "notEdit", "placeholder": ""],
        ["title": "Chủ đề", "value": "Khách hàng góp ý", "kind": "text", "placeholder": ""],
        ["title": "Điện thoại", "value": "", "kind": "number", "placeholder": ""],
        ["title": "Tên miền", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Nội dung", "value": "", "kind": "textView", "placeholder": "Nhập nội dung"]
        ]]
    
    static let CHANGE_PASSWORD = [ "changePassword": [
        ["title": "Password cũ", "value": "", "kind": "password", "placeholder": ""],
        ["title": "Password mới", "value": "", "kind": "password", "placeholder": ""],
        ["title": "Nhập lại password mới", "value": "", "kind": "password", "placeholder": ""]
        ]]
    
    static let TRANSFER_MONEY = [ "transferMoney": [
        ["title": "Username của đại lý nhận tiền", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Số tiển cần chuyển", "value": "", "kind": "number", "placeholder": ""],
        ["title": "Chứng từ thanh toán", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Ghi chú", "value": "", "kind": "text", "placeholder": ""],
        ]]
    
    static let PUSH_MONEY_VAT = [ "pushMoneyVAT": [
        ["title": "Số tiền cần chuyển *", "value": "", "kind": "number", "placeholder": ""],
        ["title": "Chứng từ thanh toán *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Ghi chú", "value": "", "kind": "text", "placeholder": ""]
        ]]
    
    static let CREATE_RESELLER = [ "createReseller": [
        ["title": "Tên chủ thể *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Người đại diện", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Điện thoại bàn *", "value": "", "kind": "number", "placeholder": ""],
        ["title": "Di động *", "value": "", "kind": "number", "placeholder": ""],
        ["title": "Fax", "value": "", "kind": "number", "placeholder": ""],
        ["title": "Địa chỉ *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Quốc gia *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Thành phố *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Zipcode *", "value": "", "kind": "number", "placeholder": ""],
        ["title": "CMND/ID Passport *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Mã số thuế *", "value": "", "kind": "number", "placeholder": ""],
        ["title": "Email chính *", "value": "", "kind": "email", "placeholder": ""],
        ["title": "Email phụ", "value": "", "kind": "email", "placeholder": ""],
        ["title": "Tên đăng nhập *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Password *", "value": "", "kind": "password", "placeholder": ""],
        ["title": "Số tiền (>= 2,000.000) *", "value": "", "kind": "number", "placeholder": ""],
        ["title": "Mã chứng từ thanh toán *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Upload nảm scan CMND *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Mã công việc nội bộ *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Ký hợp đồng với công ty *", "value": "P.A Việt Nam", "kind": "segment", "placeholder": "", "datas": ["P.A Việt Nam", "Super Data"]],
        ]]
    
    static let CREATE_CUSTOMER = [ "createCustomer": [
        ["title": "Trạng thái", "value": "Kích hoạt", "kind": "segment", "placeholder": "", "datas": ["Kích hoạt"]],
        ["title": "Hình thức", "value": "Cá nhân", "kind": "segment", "placeholder": "", "datas": ["Cá nhân", "Công ty"]],
        ["title": "Tên chủ thể *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Người đại diện", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Số CMND *", "value": "", "kind": "number", "placeholder": ""],
        ["title": "Địa chỉ *", "value": "", "kind": "text", "placeholder": ""],
        ["title": "Di động *", "value": "", "kind": "number", "placeholder": ""],
        ["title": "Email chính *", "value": "", "kind": "email", "placeholder": ""],
        ["title": "Email phụ", "value": "", "kind": "email", "placeholder": ""],
        ]]
    
    static let INFORMATION_ACCOUNT = [ "informationAccount": [
        ["title": "Tên đăng ký", "value": "Pcoder", "kind": "notEdit", "placeholder": ""],
        ["title": "Điện thoại bàn *", "value": "0964 153 741", "kind": "number", "placeholder": ""],
        ["title": "Di động *", "value": "0964 153 741", "kind": "number", "placeholder": ""],
        ["title": "Địa chỉ", "value": "86/15 Trường Chinh Quận Tân Bình", "kind": "notEdit", "placeholder": ""],
        ["title": "Mã số thuế", "value": "312131400", "kind": "notEdit", "placeholder": ""],
        ["title": "Email chính", "value": "nguyenhuuvinh2001@gmail.com", "kind": "notEdit", "placeholder": ""],
        ["title": "Email phụ", "value": "nguyenhuuvinh2001@gmail.com", "kind": "notEdit", "placeholder": ""],
        ["title": "Fax", "value": "0964 153 741", "kind": "number", "placeholder": ""],
        ["title": "Mã Support (PA-ID)", "value": "192934", "kind": "notEdit", "placeholder": ""],
        ]]
    
    static let DOMAIN_PRICING =
        ["domainPricing":
            [
                // Đăng Ký Mới
                [
                    "level": "Đăng Ký Mới",
                    "description": "Dưới 20 triệu",
                    "pricings": [
                        // Đăng Ký Mới
                        ["kind": "Tên Miền Việt Nam",
                         "pricing": [
                            ["title": ".vn", "service": "750.000đ/năm (Phí dịch vụ: 200.000đ/năm)"],
                            ["title": ".com.vn", "service": "630.000đ/năm (Phí dịch vụ: 180.000đ/năm)"],
                            ]
                        ],
                        ["kind": "Tên Miền Quốc Tế",
                         "pricing": [
                            ["title": ".com", "service": "13.23usd = 299.000đ/năm"],
                            ["title": ".net", "service": "14.557usd = 329.000đ/năm"],
                            ["title": "org|.info", "service": "15usd = 339.000đ/năm"],
                            ]
                        ]
                    ]
                ],
                // Gia Hạn
                [
                    "level": "Gia Hạn",
                    "description": "Từ 20 triệu đến dưới 50 triệu",
                    "pricings": [
                        // Gia Hạn
                        ["kind": "Tên Miền Việt Nam",
                         "pricing": [
                            ["title": ".vn", "service": "470.000đ/năm (Phí dịch vụ: 120.000đ/năm)"],
                            ["title": ".com.vn", "service": "340.000đ/năm (Phí dịch vụ: 90.000đ/năm)"],
                            ]
                        ],
                        ["kind": "Tên Miền Quốc Tế",
                         "pricing": [
                            ["title": ".com", "service": "13.23usd = 299.000đđ/năm"],
                            ["title": ".net", "service": "14.557usd = 329.000đ/năm"],
                            ["title": "org|.info", "service": "15usd = 339.000đ/năm"],
                            ]
                        ]
                    ]
                ],
                // Transfer Về P.A
                [
                    "level": "Transfer Về P.A",
                    "description": "Từ 50 triệu đến dưới 100 triệu",
                    "pricings": [
                        // Transfer Về P.A
                        ["kind": "Tên Miền Việt Nam",
                         "pricing": [
                            ["title": ".vn", "service": "470.000đ/năm (Phí dịch vụ: 120.000đ/năm)"],
                            ["title": ".com.vn", "service": "340.000đ/năm (Phí dịch vụ: 90.000đ/năm)"],
                            ]
                        ],
                        ["kind": "Tên Miền Quốc Tế",
                         "pricing": [
                            ["title": ".com", "service": "8.407usd = 190.000đ/năm"],
                            ["title": ".net", "service": "10.481usd = 237.000đ/năm"],
                            ["title": "org|.info", "service": "12usd = 271.000đ/năm"],
                            ]
                        ]
                    ]
                ],
            ]
            
    ]
    
    static let HOSTING_PRICING =
        ["hostingPricing":
            [
                // Cấp 1
                [
                    "level": "Cấp 1",
                    "description": "Dưới 20 triệu",
                    "pricings": [
                        // 1
                        ["kind": "Tên Miền Việt Nam",
                         "pricing": [
                            ["title": "Đăng ký mới", "service": "Giảm 30%"],
                            ["title": "Gia hạn", "service": "Giảm 30%"],
                            ]
                        ],
                        ["kind": "Tên Miền Quốc Tế",
                         "pricing": [
                            ["title": ".com", "service": "225.000 VNĐ/ năm"],
                            ["title": ".net", "service": "248.000 VNĐ/ năm"],
                            ["title": "org|.info", "service": "275.000 VNĐ/ năm"],
                            ]
                        ],
                        ["kind": "Hosting, Email, Server, Colocation, ...",
                         "pricing": [
                            ["title": "Web Hosting", "service": "Giảm 15%", "info": "Bao gồm: Hosting phổ thông, Joomla hosting, Wordpress hosting, Hositng giá rẻ"],
                            ["title": "Host Pro", "service": "Giảm 10%", "info": "Bao gồm: Hosting chất lượng cao, Joomla hosting pro, Java hosting"],
                            ["title": "Web 30s", "service": "Giảm 5%"],
                            ["title": "Tổng Đài Ảo", "service": "Giảm 3%"],
                            ["title": "Reseller Host", "service": "Giảm 3%", "info": "Bao gồm reseller hosting, SEO hosting"],
                            ["title": "Email Server", "service": "Giảm 10%"],
                            ["title": "Email Server Riêng", "service": "Giảm 10%"],
                            ["title": "Super Hosting", "service": "Giảm 10%"],
                            ["title": "VPS Server", "service": "Giảm 3%"],
                            ["title": "Delicated Server", "service": "Giảm 3%"],
                            ["title": "Dịch vụ khác", "service": "Giảm 3%"],
                            ]
                        ]
                    ]
                ],
                // Cấp 2
                [
                    "level": "Cấp 2",
                    "description": "Từ 20 triệu đến dưới 50 triệu",
                    "pricings": [
                        // 2
                        ["kind": "Tên Miền Việt Nam",
                         "pricing": [
                            ["title": "Đăng ký mới", "service": "Giảm 30%"],
                            ["title": "Gia hạn", "service": "Giảm 30%"],
                            ]
                            
                        ],
                        ["kind": "Tên Miền Quốc Tế",
                         "pricing":[
                            ["title": ".com", "service": "220.000 VNĐ/ năm"],
                            ["title": ".net", "service": "242.000 VNĐ/ năm"],
                            ["title": "org|.info", "service": "275.000 VNĐ/ năm"],
                            ]
                        ],
                        ["kind": "Hosting, Email, Server, Colocation, ...",
                         "pricing": [
                            ["title": "Web Hosting", "service": "Giảm 20%", "info": "Bao gồm: Hosting phổ thông, Joomla hosting, Wordpress hosting, Hositng giá rẻ"],
                            ["title": "Host Pro", "service": "Giảm 15%", "info": "Bao gồm: Hosting chất lượng cao, Joomla hosting pro, Java hosting"],
                            ["title": "Web 30s", "service": "Giảm 10%"],
                            ["title": "Tổng Đài Ảo", "service": "Giảm 5%"],
                            ["title": "Reseller Host", "service": "Giảm 5%", "info": "Bao gồm reseller hosting, SEO hosting"],
                            ["title": "Email Server", "service": "Giảm 12%"],
                            ["title": "Email Server Riêng", "service": "Giảm 11%"],
                            ["title": "Super Hosting", "service": "Giảm 11%"],
                            ["title": "VPS Server", "service": "Giảm 6%"],
                            ["title": "Delicated Server", "service": "Giảm 3%"],
                            ["title": "Dịch vụ khác", "service": "Giảm 3%"],
                            ]
                        ],
                    ]
                ],
                // Cấp 3
                [
                    "level": "Cấp 3",
                    "description": "Từ 50 triệu đến dưới 100 triệu",
                    "pricings": [
                        // 3
                        ["kind": "Tên Miền Việt Nam",
                         "pricing": [
                            ["title": "Đăng ký mới", "service": "Giảm 30%"],
                            ["title": "Gia hạn", "service": "Giảm 30%"],
                            ]
                        ],
                        ["kind": "Tên Miền Quốc Tế",
                         "pricing":[
                            ["title": ".com", "service": "212.000 VNĐ/ năm"],
                            ["title": ".net", "service": "240.000 VNĐ/ năm"],
                            ["title": "org|.info", "service": "271.000 VNĐ/ năm"],
                            ]
                        ],
                        ["kind": "Hosting, Email, Server, Colocation, ...",
                         "pricing": [
                            ["title": "Web Hosting", "service": "Giảm 25%", "info": "Bao gồm: Hosting phổ thông, Joomla hosting, Wordpress hosting, Hositng giá rẻ"],
                            ["title": "Host Pro", "service": "Giảm 20%", "info": "Bao gồm: Hosting chất lượng cao, Joomla hosting pro, Java hosting"],
                            ["title": "Web 30s", "service": "Giảm 15%"],
                            ["title": "Tổng Đài Ảo", "service": "Giảm 7%"],
                            ["title": "Reseller Host", "service": "Giảm 7%", "info": "Bao gồm reseller hosting, SEO hosting"],
                            ["title": "Email Server", "service": "Giảm 15%"],
                            ["title": "Email Server Riêng", "service": "Giảm 12%"],
                            ["title": "Super Hosting", "service": "Giảm 12%"],
                            ["title": "VPS Server", "service": "Giảm 8%"],
                            ["title": "Delicated Server", "service": "Giảm 3%"],
                            ["title": "Dịch vụ khác", "service": "Giảm 3%"],
                            ]
                        ],
                    ]
                ],
                // Cấp 4
                [
                    "level": "Cấp 4",
                    "description": ">=100 triệu",
                    "pricings": [
                        // 4
                        ["kind": "Tên Miền Việt Nam",
                         "pricing": [
                            ["title": "Đăng ký mới", "service": "Giảm 30%"],
                            ["title": "Gia hạn", "service": "Giảm 30%"],
                            ]
                        ],
                        ["kind": "Tên Miền Quốc Tế",
                         "pricing":[
                            ["title": ".com", "service": "206.000 VNĐ/ năm"],
                            ["title": ".net", "service": "237.000 VNĐ/ năm"],
                            ["title": "org|.info", "service": "271.000 VNĐ/ năm"],
                            ]
                        ],
                        ["kind": "Hosting, Email, Server, Colocation, ...",
                         "pricing": [
                            ["title": "Web Hosting", "service": "Giảm 35%", "info": "Bao gồm: Hosting phổ thông, Joomla hosting, Wordpress hosting, Hositng giá rẻ"],
                            ["title": "Host Pro", "service": "Giảm 30%", "info": "Bao gồm: Hosting chất lượng cao, Joomla hosting pro, Java hosting"],
                            ["title": "Web 30s", "service": "Giảm 20%"],
                            ["title": "Tổng Đài Ảo", "service": "Giảm 10%"],
                            ["title": "Reseller Host", "service": "Giảm 10%", "info": "Bao gồm reseller hosting, SEO hosting"],
                            ["title": "Email Server", "service": "Giảm 20%"],
                            ["title": "Email Server Riêng", "service": "Giảm 13%"],
                            ["title": "Super Hosting", "service": "Giảm 13%"],
                            ["title": "VPS Server", "service": "Giảm 12%"],
                            ["title": "Delicated Server", "service": "Giảm 3%"],
                            ["title": "Dịch vụ khác", "service": "Giảm 3%"],
                            ]
                        ]
                    ]
                ],
            ]
            
    ]
    
    static let FILTERS = [ "filter":  [
        ["title": "Loại dịch vụ", "value": "", "kind": "picker", "placeholder": "Loại dịch vụ", "datas": ["Tên miền Việt Nam", "Tên miền Quốc Tế", "Hosting, Server, Service,.."]],
        ["title": "Loại ngày", "value": "", "kind": "picker", "placeholder": "Loại ngày", "datas": ["Ngày đăng ký", "Ngày hết hạn"]],
        ["title": "Từ ngày", "value": "", "kind": "date", "placeholder": ""],
        ["title": "Đến ngày", "value": "", "kind": "date", "placeholder": ""]
        ]]
    
    static let FILTERS_VAT = [ "filter":  [
        ["title": "Từ ngày", "value": "", "kind": "date", "placeholder": ""],
        ["title": "Đến ngày", "value": "", "kind": "date", "placeholder": ""]
        ]]
    
    static let RECHARGE = [ "recharge": [
        ["kind": "Chọn phương thức thanh toán",
         "hostings": ["Thanh toán online thẻ quốc tế (Phí tiện ích 3%) (Danh sách ngân hàng)",
                      "Thanh toán online thẻ nội địa (Phí tiện ích 1%) (Danh sách ngân hàng)",
                      "Chuyển khoản ngân hàng (Phí tiện ích 0%)",
                      "Thu phí tận nơi (Phí tiện ích 0%)"
                    ]
        ],
        ]
    ]
    
    static let RECHARGE_1 = [ "recharge": [
        ["kind": "Nhập số tiền cần nạp",
         "hostings": ["Thanh toán online thẻ quốc tế (Phí tiện ích 3%) (Danh sách ngân hàng)",
                      "Thanh toán online thẻ nội địa (Phí tiện ích 1%) (Danh sách ngân hàng)",
                      "Chuyển khoản ngân hàng (Phí tiện ích 0%)",
                      "Thu phí tận nơi (Phí tiện ích 0%)"
            ]
        ],
        ]
    ]
    
    static let RECHARGE_2 = [ "recharge": [
        ["kind": "Nhập số tiền cần nạp",
         "hostings": ["Thanh toán online thẻ quốc tế (Phí tiện ích 3%) (Danh sách ngân hàng)",
                      "Thanh toán online thẻ nội địa (Phí tiện ích 1%) (Danh sách ngân hàng)",
                      "Chuyển khoản ngân hàng (Phí tiện ích 0%)",
                      "Thu phí tận nơi (Phí tiện ích 0%)"
            ]
        ],
        ]
    ]
}

//  REQUEST
struct REQUEST {
    static let DEPARTMENTS : [String] = ["Kỹ Thuật", "Dịch Vụ Khách Hàng", "Kế Toán Hành Chính", "Kế toán", "Bán Hàng", "Web", "Marketing", "Ban Giám Đốc"]
    static let TOPICS : [String] = ["Cấu hình Domain", "Thông tin tài khoản Domain", "Cấu hình, Thông tin Domain", "Website bị hack", "FTP - Thông tin tài khoản Hosting", "Hỗ trợ Database - MSSQL", "ASP/ASP.Net, PHP, JSP Scripts", "Không truy cập được website", "Sự cố Email", "Chuyển đổi Hosting", "Hosting Controller bị lỗi", "Phục hồi dữ liệu - Data restore", "Hỗ trợ Web30s"]
    static let SERVICES : [String] = ["ô.vn", "chợ.vn", "giá.vn", "hài.vn", "học.vn"]
}
