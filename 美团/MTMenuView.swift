//
//  MTMenuView.swift
//  美团
//
//  Created by work on 2020/6/8.
//  Copyright © 2020 work. All rights reserved.
//

import UIKit

class MTMenuView: UIView
{
    @IBOutlet weak var actionBtn: UIButton!
    
    /// 显示子标题的Label
    @IBOutlet weak var subtitleLabel: UILabel!
    
    /// 显示的图标
    @IBOutlet weak var imgeView: UIImageView!
    
    /// 显示的标题
    @IBOutlet weak var titleLabel: UILabel!
    class func menuView()->MTMenuView
    {
        return (Bundle.main.loadNibNamed("MTMenuView", owner: nil, options: nil)?.first)! as! MTMenuView
    }
    // 提供给外界赋值的数据源
    ///设置子标题
    var subTitle:String?
    {
        didSet
        {
            subtitleLabel.text = subTitle
        }
    }
    var image: UIImage?
    {
        didSet
        {
            if image != nil
            {
                imgeView.image = image
            }
        }
    }
    
    
    

    ///快速创建的方法
    class func menuView(with image: UIImage?, title: String?, subTitle: String?)->MTMenuView
    {
        let view = self.menuView()
        view.imgeView.image = image
        view.subtitleLabel.text = subTitle
        view.titleLabel.text = title
        
        return view
        
    }
    
    func add(tagert: Any?, selector: Selector)
    {
        actionBtn.addTarget(tagert, action: selector, for: .touchUpInside)
    }
    
    

}
