//
//  MakeCellProtocol.swift
//  Settings
//
//  Created by waltoncob on 2016/11/9.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

public protocol MakeCellProtocol{
    func packToCell() -> UITableViewCell
    func getCellContent() -> TextCellContent
}
