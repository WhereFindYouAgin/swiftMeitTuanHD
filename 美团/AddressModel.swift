//
//  AddressModel.swift
//  美团
//
//  Created by LUOSU on 2020/6/8.
//  Copyright © 2020 work. All rights reserved.
//

import UIKit

class AddressModel: NSObject
{
    @objc var name: String?
    @objc var subregions: [String]?
    
    override init() {
        
    }
    init(dict: [String:AnyObject])
    {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String)
    {
        
    }
    

}
