//
//  MTHomeVC.swift
//  美团
//
//  Created by work on 2020/6/8.
//  Copyright © 2020 work. All rights reserved.
//

import UIKit

class MTHomeVC: UIViewController
{
    
    /// 当前点击的菜单
    var currentMenuView: MTMenuView?
    
    
    var currentPopver: UIPopoverController?
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
       //0.设置导航栏背景图片
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "bg_navigationBar_normal"), for: .default)
        //1. 设置左侧的logo
        let logoImageView = UIImageView(image: UIImage(named: "icon_meituan_logo"))
        let logoItem = UIBarButtonItem(customView: logoImageView)
        
        
        
        // 2. 设置左侧的三个菜单
        
        let menu1 = creatItem(imageName: "icon_category_-1", title: "美团网", subTitle: "全部分类")
        menu1.menuView.frame = CGRect(x: 0, y: 0, width: 120, height: 44)
        menu1.menuView.add(tagert: self, selector: #selector(categoryClick))
        

        let menu2 = creatItem(imageName: "icon_district_highlighted", title: "江苏省", subTitle: "南京市")
        menu2.menuView.add(tagert: self, selector: #selector(adressClick))
        
        let menu3 = creatItem(imageName: "icon_sort_highlighted", title: "排序", subTitle: "最新发布")
        
        menu3.menuView.add(tagert: self, selector: #selector(sortClick))
        navigationItem.leftBarButtonItems = [logoItem, menu1.item, menu2.item, menu3.item]

    }
    
    func creatItem(imageName: String, title: String?, subTitle:String? )-> (item: UIBarButtonItem, menuView: MTMenuView)
    {
       let menu = MTMenuView.menuView(with: UIImage(named: imageName), title: title, subTitle: subTitle)
        let menuItem = UIBarButtonItem(customView: menu)
        return (menuItem, menu)
    }


}
 //MARK:- 按钮事件 -
extension MTHomeVC
{
    @objc func categoryClick()
    {
        print("分类")
        
        currentPopver?.dismiss(animated: true)
        let contentVC = ContentVC()
        contentVC.delegate = self
        let popoverVC = UIPopoverController(contentViewController: contentVC)
        currentPopver = popoverVC
        DataTool.getCategoryTool
        { (categoryModels) in
            let leftRightM = DataBrigeTool.changeCategoryModel(categoryModels: categoryModels)
            contentVC.leftRightModels = leftRightM
                   
        }
        //弹出
        let item = navigationItem.leftBarButtonItems![1]
        currentMenuView = item.customView as! MTMenuView
        popoverVC.present(from: item, permittedArrowDirections: .any, animated: true)
        
        
        
    }
    @objc func adressClick()
    {
        print("地址")
        currentPopver?.dismiss(animated: true)
        let contentVC = ContentVC()
        contentVC.delegate = self
        let popoverVC = UIPopoverController(contentViewController: contentVC)
        currentPopver = popoverVC
        //弹出
        DataTool.getAddressModelTool
        { (addressModels) in
            let leftRightModels = DataBrigeTool.changeAddressModels(addressModels: addressModels)
            contentVC.leftRightModels = leftRightModels
        }
        let item = navigationItem.leftBarButtonItems![2]
        currentMenuView = item.customView as! MTMenuView
        popoverVC.present(from: item, permittedArrowDirections: .any, animated: true)

    }
    @objc func sortClick()
    {
        print("排序")
        currentPopver?.dismiss(animated: true)
        let contentVC = ContentVC()
        let popoverVC = UIPopoverController(contentViewController: contentVC)
        contentVC.delegate = self
        currentPopver = popoverVC
               //弹出
        DataTool.getSortModels
        { (sortModels) in
            contentVC.leftRightModels = DataBrigeTool.changeSorModels(sortModels: sortModels)
            
        }
        let item = navigationItem.leftBarButtonItems![3]
        currentMenuView = item.customView as! MTMenuView
        popoverVC.present(from: item, permittedArrowDirections: .any, animated: true)

    }
}
 //MARK:- ContentVCDelegate -
extension MTHomeVC: ContentVCDelegate
{
    func contentVC(_ content: ContentVC, didSelectModel model: LeftRightModel)
    {
        print("代理")
        print(model)
        print(model.title)
        //需要赋值
        currentMenuView?.image = model.image
        currentMenuView?.subTitle = model.title
        
            
    }
    
    
}
