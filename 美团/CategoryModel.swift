//
//  CategoryModel.swift
//  美团
//
//  Created by LUOSU on 2020/6/8.
//  Copyright © 2020 work. All rights reserved.
//

import UIKit

class CategoryModel: NSObject
{
    
    @objc var highlighted_icon: String?
    ///图片名
    @objc  var icon: String?
    ///标题
    @objc var name: String?
    
    @objc var small_highlighted_icon: String?
    
    @objc var small_icon: String?
    
    @objc var map_icon: String?
    ///子标题
    @objc var subcategories: [String]?
    
    override init() {
        
    }
    init(dic: [String: AnyObject])
    {
        super.init()
        setValuesForKeys(dic)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String)
    {
        
    }

}
