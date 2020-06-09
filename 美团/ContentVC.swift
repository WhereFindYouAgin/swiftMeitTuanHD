//
//  ContentVC.swift
//  美团
//
//  Created by work on 2020/6/8.
//

import UIKit

protocol ContentVCDelegate: NSObjectProtocol
{
    ///选择了一个model
    func contentVC(_ content: ContentVC, didSelectModel model: LeftRightModel)
    
}

class ContentVC: UIViewController {

    @IBOutlet weak var rightTableView: UITableView!
    @IBOutlet weak var leftTableView: UITableView!
    var delegate: ContentVCDelegate?
    
    
    var leftRightModels: [LeftRightModel] = [LeftRightModel]()
    {
        didSet
        {
            //self.leftTableView.reloadData()
            preferredContentSize = CGSize(width: 150, height: 500)
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    var currentLRM: LeftRightModel = LeftRightModel()
    
}

//MARK: - TableViewDataSource -
extension ContentVC: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == leftTableView
        {
            return leftRightModels.count
        }
        
        if tableView == rightTableView
        {
            if currentLRM.hasSubMenu
            {
                return currentLRM.subMenues!.count
            }
            else
            {
                return 0
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //确定当前的数据模型
        let model = tableView == leftTableView ? leftRightModels[indexPath.row] : currentLRM.subMenues![indexPath.row]
        // 2. 根据数据模型的类型, 显示不同的cell 样式
        let  cellID = model.type == LRType.imageAndTitle ? "imageTitleId" : "titleID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        cell?.imageView?.image = model.image
        cell?.textLabel?.text = model.title
        return cell!

    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView == leftTableView
        {
            let model = leftRightModels[indexPath.row]
            currentLRM = model
            if model.hasSubMenu
            {
                self.rightTableView.reloadData()
                preferredContentSize = CGSize(width: 300, height: 500)
                print("有下一页")
                if model.image != nil
                {
                    delegate?.contentVC(self, didSelectModel: model)
                }
            }
            else
            {
                preferredContentSize = CGSize(width: 150, height: 500)
                
                delegate?.contentVC(self, didSelectModel: model)
                print("没有有下一页")
            }
            
            
        }
        
        if tableView == rightTableView
        {
            let  model = currentLRM.subMenues![indexPath.row]
            delegate?.contentVC(self, didSelectModel: model)
        }
        
    }
    
}
