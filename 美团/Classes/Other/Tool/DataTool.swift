//
//  DataTool.swift
//  美团
//
//  Created by LUOSU on 2020/6/8.
//  Copyright © 2020 work. All rights reserved.
//

import UIKit

class DataTool: NSObject
{
    // 把分类数据模型, 转换成为左右数据模型
    // 主要思想, 就是遍历需要转换的数据模型数据,
    // 在内部, 一个一个给目标数据模型, 进行赋值, 并返回
    class func getCategoryTool(result: ([CategoryModel])->())
    {
        guard let path = Bundle.main.path(forResource: "categories.plist", ofType: nil) else
        {
            result([CategoryModel]())
            return
        }
        //读取里面的内容
        guard let dicArray = NSArray(contentsOfFile: path) else
        {
            result([CategoryModel]())
            return
        }
        //转换成模型
        var models = [CategoryModel]()
        
        for dic in dicArray
        {
            let dicResult = dic as! [String: AnyObject]
            let model = CategoryModel(dic: dicResult)
            models.append(model)
        }
        
        result(models)
        
    }
    
   class func getAddressModelTool(result: ([AddressModel])->())
    {
        //1.获得gz.plist文件
        guard let path = Bundle.main.path(forResource: "gz.plist", ofType: nil) else
        {
            result([AddressModel]())
            return
        }
        //2.读取里面的内容
       guard  let dicArr = NSArray(contentsOfFile: path) else
       {
            result([AddressModel]())
            return
        }
        var addRessModels = [AddressModel]()
        
        for dic in dicArr
        {
            let resultDic = dic as! [String: AnyObject]
            
            let addressM = AddressModel(dict: resultDic)
            addRessModels.append(addressM)
            
        }
        result(addRessModels)
        
    }
    
    class func getSortModels(result: ([SortModel])->())
    {
        //1. 获取地址
        guard let path = Bundle.main.path(forResource: "sorts.plist", ofType: nil) else
        {
            result([SortModel]())
            return
        }
        //2.获取里面的内容Arr
        guard let dicArr = NSArray(contentsOfFile: path) else
        {
            result([SortModel]())
            return
        }
        
        var sortModels = [SortModel]()
        
        for dic in dicArr
        {
            let resultDic = dic as! [String: AnyObject]
            let sortModel = SortModel(dict: resultDic)
            print(sortModel.label)
            sortModels.append(sortModel)
        }
        result(sortModels)
        
    }

}
