//
//  AccessoryCell.swift
//  settings
//
//  Created by waltoncob on 2016/9/27.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class AccessoryCell:UITableViewCell,EventCell{

    private var listeners:[CellListener] = []
    private var detailSection:SectionManager
    private var tableContent:TableContent

    public init(text: String, detail: String, tableContent:TableContent, sections: [Section]){
        self.detailSection = SectionManager(sections:sections)
        self.tableContent = tableContent
        super.init(style: .value1,reuseIdentifier: nil)
        self.textLabel?.text = text
        self.detailTextLabel?.text = detail
        self.accessoryType = .disclosureIndicator
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//protocol
    public func getTableView() -> SettingTableView{
        let stView = SettingTableView(content: tableContent, sectionManager:detailSection)
        return stView
    }

//MARK:EvenCell
    public func add(listener:CellListener){
        self.listeners.append(listener)
    }

    public func remove(listener:CellListener){

    }

    public func setTrigger(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapAction))
        self.addGestureRecognizer(gesture)
    }

    public func tapAction(){
        print("T:AccesoryCell tapAction")
        for tapL in listeners{
            tapL.tapAction(cell: self)
        }
    }

    public func getContent() -> (String,Any){
        return (textLabel!.text!,detailTextLabel!.text!)
    }
    
}
