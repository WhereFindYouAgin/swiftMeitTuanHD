//
//  DataBrigeTool.swift
//  美团
//
//  Created by LUOSU on 2020/6/8.
//  Copyright © 2020 work. All rights reserved.
//

import UIKit

class DataBrigeTool: NSObject
{
    class func changeCategoryModel(categoryModels: [CategoryModel]) -> [LeftRightModel]
    {
        var resultModels = [LeftRightModel]()
        for catetoryM in categoryModels
        {
            let lrM = LeftRightModel()
            resultModels.append(lrM)
            if catetoryM.icon != nil
            {
                lrM.image = UIImage(named: catetoryM.icon!)
            }
            lrM.title = catetoryM.name
            
            //子菜单
            guard let subCategory = catetoryM.subcategories else { continue }
            var subMs = [LeftRightModel]()
            for subTitle in subCategory
            {
                let subLRM = LeftRightModel()
                subLRM.title = subTitle
                subMs.append(subLRM)
                
            }
            lrM.subMenues = subMs
        }
        
        return resultModels
        
    }

   class func changeAddressModels(addressModels: [AddressModel]) -> [LeftRightModel]
    {
        var leftRightModels = [LeftRightModel]()
        
        for address in addressModels
        {
            let leftRightM = LeftRightModel()
            leftRightModels.append(leftRightM)
            leftRightM.title = address.name
            guard let subRegions = address.subregions else
            {
                continue
            }
            
            var subLRMs = [LeftRightModel]()
            for region in subRegions
            {
                let subLRM = LeftRightModel()
                
                subLRMs.append(subLRM)
                subLRM.title = region
            }
            leftRightM.subMenues = subLRMs
            
        }
        
        return leftRightModels
        
    }
    
    ///将sortModel数组转换成leftRight数组
   class func changeSorModels(sortModels: [SortModel]) -> [LeftRightModel]
    {
        var leftRightModels = [LeftRightModel]()
        
        for sort in sortModels
        {
            let leftRM = LeftRightModel()
            leftRM.title = sort.label
            print(sort.label)
            leftRightModels.append(leftRM)
        }
        
        return leftRightModels
    }
}
