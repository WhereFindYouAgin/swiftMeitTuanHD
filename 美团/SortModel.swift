//
//  SortModel.swift
//  美团
//
//  Created by work on 2020/6/9.
//  Copyright © 2020 work. All rights reserved.
//

import UIKit

class SortModel: NSObject
{
   @objc var label: String?
   @objc  var value: Int = -1
    override init() {
        
    }
    init(dict: [String: AnyObject])
    {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String)
    {
        
    }

}
