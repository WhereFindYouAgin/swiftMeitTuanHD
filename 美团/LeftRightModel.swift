//
//  LeftRightModel.swift
//  美团
//
//  Created by LUOSU on 2020/6/8.
//  Copyright © 2020 work. All rights reserved.
//

import UIKit
enum LRType: Int
{
    case imageAndTitle
    case title
}

class LeftRightModel: NSObject
{
    var type: LRType
    {
        if image != nil && title != nil
        {
            return.imageAndTitle
        }
        else
        {
            return .title
        }
    }
    var image: UIImage?
    ///标题
    var title: String?
    ///是否有子菜单
    var hasSubMenu: Bool
    {
        if subMenues == nil || subMenues?.count == 0
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    /// 子菜单
    var subMenues:[LeftRightModel]?
    
    
    
    

}
