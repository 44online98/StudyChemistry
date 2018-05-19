//
//  Menu.swift
//  PAVietNam
//
//  Created by SSN on 5/19/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import Foundation

struct MENU {
    static let REGISTRATION = [
        Section.init(name: "", rows: [Row.init(title: "Đăng Ký Tên Miền", image: "icon_domain"),
                                      Row.init(title: "Gia Hạn Dịch Vụ", image: "icon_renewable"),
                                      Row.init(title: "Transfer Tên Miền", image: "icon_transfer"),
                                      Row.init(title: "Đăng Ký Hosting", image: "icon_hosting"),
                                      Row.init(title: "Đăng Ký  Mail Server", image: "icon_mailServer"),
                                      Row.init(title: "Đăng Ký  Mail Server Riêng", image: "icon_mailServer2"),
                                      Row.init(title: "Đăng Ký VPS", image: "icon_vps"),
                                      Row.init(title: "Đăng Ký Server Riêng", image: "icon_server"),
                                      Row.init(title: "Thuê Chỗ Đặt Server", image: "icon_server"),
                                      Row.init(title: "Đăng Ký Tổng Đài Ảo", image: "icon_switchBoard"),
                                      Row.init(title: "Đăng Ký Web30s", image: "icon_domain"),
                                      Row.init(title: "Đăng Ký SSL", image: "icon_ssl"),
                                      Row.init(title: "Đăng Ký SMS Brandname", image: "icon_transfer"),
                                      Row.init(title: "Đăng Ký Google Adword", image: "icon_hosting"),
                                      Row.init(title: "Đăng Ký Facebook", image: "icon_mailServer"),
                                      Row.init(title: "Đăng Ký Dịch Vụ Phụ", image: "icon_mailServer2"),
                                      Row.init(title: "Đăng Ký Nhiều Domain + Host", image: "icon_vps"),
                                      Row.init(title: "Active Đơn Hàng", image: "icon_active"),
                                      Row.init(title: "Đăng Ký Đại Lý", image: "icon_server"),
                                      Row.init(title: "Huỷ Đăng Ký Lại Tên Miền", image: "icon_switchBoard"),
                                      Row.init(title: "Chuyển Nhượng Tên Miền", image: "icon_transfer2"),
                                      Row.init(title: "Hàng Đợi Domain", image: "icon_renewable"),
                                      ]),
        ]
    
    static let SERVICE = [
        Section.init(name: "", rows: [Row.init(title: "Dịch Vụ Đang Khởi Tạo", image: "icon_initalizing"),
                                      Row.init(title: "Dịch Vụ Đang Sử Dụng", image: "icon_using"),
                                      Row.init(title: "Dịch Vụ Sắp Hết Hạn", image: "icon_willExpired"),
                                      Row.init(title: "Dịch Vụ Hết Hạn", image: "icon_expired"),
                                      Row.init(title: "Domain Transfer Out", image: "icon_transferOut"),
                                      Row.init(title: "Domain Gia Hạn Tự Động", image: "icon_autoRenew"),
                                      Row.init(title: "Domain Chưa Xác Thực Email", image: "icon_unverified"),
                                      ]),
        ]
    
    static let SUPPORT = [
        Section.init(name: "", rows: [Row.init(title: "Gửi Yêu Cầu", image: "icon_send"),
                                      Row.init(title: "Yêu Cầu Mới Gửi", image: "icon_recent"),
                                      Row.init(title: "P.A Đang Xử Lý", image: "icon_processing"),
                                      Row.init(title: "P.A Đã Trả Lời", image: "icon_answered"),
                                      Row.init(title: "P.A Yêu Cầu Phản Hồi", image: "icon_feedback"),
                                      Row.init(title: "P.A Đã Xử Lý Xong", image: "icon_finished"),
                                      Row.init(title: "Tra Cứu Câu Hỏi", image: "icon_search"),
                                      Row.init(title: "Góp Ý", image: "icon_send"),
                                      Row.init(title: "Hỗ Trợ Kỹ Thuật", image: "icon_send"),
                                      Row.init(title: "Than Phiền Nhân Viên", image: "icon_send"),
                                      ]),
        ]
    
    static let ACCOUNT = [
        Section.init(name: "", rows: [Row.init(title: "pcoderpa|PA-192934", image: "Nhan vien PA| 962.530 VND"),
                                      ]),
        Section.init(name: "", rows: [Row.init(title: "Đổi mật khẩu", image: "icon_changePassword"),
                                      Row.init(title: "Cấu hình Control Panel", image: "icon_controlPanel"),
                                      Row.init(title: "API reseller", image: "icon_api"),
                                      Row.init(title: "Bảo vệ tài khoản", image: "icon_protection"),
                                      Row.init(title: "Đổi quà", image: "icon_gift"),
                                      ]),
        Section.init(name: "", rows: [Row.init(title: "Chuyển tiền Đại lý", image: "icon_pushMoney"),
                                      Row.init(title: "Nạp tiền Online", image: "icon_addMoney"),
                                      Row.init(title: "Xem giao dịch", image: "icon_information"),
                                      Row.init(title: "Chuyển tiền Vào TK VAT", image: "icon_logVAT"),
                                      Row.init(title: "Xem Log VAT", image: "icon_logVAT"),
                                      Row.init(title: "Danh sách công nợ", image: "icon_information"),
                                      Row.init(title: "Hoá đơn chờ xác nhận", image: "icon_invoice"),
                                      Row.init(title: "Yêu cầu xuất hoá đơn", image: "icon_invoice"),
                                      Row.init(title: "Nhập Transfer từ excel", image: "icon_logVAT"),
                                      ]),
        Section.init(name: "", rows: [Row.init(title: "Bảng giá Domain", image: "icon_pricing"),
                                      Row.init(title: "Bảng giá Hosting", image: "icon_pricing"),
                                      ]),
        Section.init(name: "", rows: [Row.init(title: "Đại lý đã đăng ký", image: "icon_resellerRegisted"),
                                      Row.init(title: "Tạo khách hàng mới", image: "icon_createCustomer"),
                                      Row.init(title: "Gửi Mail đến khách hàng", image: "icon_createCustomer"),
                                      ]),
        Section.init(name: "", rows: [Row.init(title: "Liên hệ", image: "icon_changeLanguage"),
                                      Row.init(title: "Chọn ngôn ngữ", image: "icon_changeLanguage"),
                                      Row.init(title: "Đăng xuất", image: "icon_logout"),
                                      ]),
        ]
}
