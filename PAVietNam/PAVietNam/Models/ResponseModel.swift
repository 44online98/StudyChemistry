//
//  ResponseModel.swift
//  Treatsure
//
//  Created by Vinh on 7/14/17.
//  Copyright © 2017 VinhNH. All rights reserved.
//

import Foundation
import ObjectMapper

class ResponseModel: RESTResponse {
    
    var notify              = [NotifyModel]()
    var carts               = [CartModel]()
    var hostings            = [HostingModel]()
    var informationCustomer = [InputsModel]()
    var sendRequest         = [InputModel]()
    var feedback            = [InputModel]()
    var changePassword      = [InputModel]()
    var pushMoneyVAT        = [InputModel]()
    var transferMoney       = [InputModel]()
    var createReseller      = [InputModel]()
    var createCustomer      = [InputModel]()
    var informationAccount  = [InputModel]()
    var domainPricing       = [HostingPricingModel]()
    var hostingPricing      = [HostingPricingModel]()
    var filter              = [InputModel]()
    var informationService  = [InputsModel]()
    var recharge            = [HostingModel]()
    
    convenience required init?(_ map: Map) {
        self.init()
    }
    
    required override init() {} // require init super class  Mappable
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        self.notify                 <- map["notify"]
        self.carts                  <- map["carts"]
        self.hostings               <- map["hostings"]
        self.informationCustomer    <- map["informationCustomer"]
        self.sendRequest            <- map["sendRequest"]
        self.feedback               <- map["feedback"]
        self.changePassword         <- map["changePassword"]
        self.pushMoneyVAT           <- map["pushMoneyVAT"]
        self.transferMoney          <- map["transferMoney"]
        self.createReseller         <- map["createReseller"]
        self.createCustomer         <- map["createCustomer"]
        self.informationAccount     <- map["informationAccount"]
        self.domainPricing          <- map["domainPricing"]
        self.hostingPricing         <- map["hostingPricing"]
        self.filter                 <- map["filter"]
        self.informationService     <- map["informationService"]
        self.recharge               <- map["recharge"]
    }
}


