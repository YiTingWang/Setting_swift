//
//  ButtonCell.swift
//  Settings
//
//  Created by waltoncob on 2016/10/14.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit

public class ButtonCell:UITableViewCell{

    private let button = UIButton()

    public convenience init(text: String,color: UIColor){
        self.init(style: UITableViewCellStyle.value1,reuseIdentifier: nil)
        self.textLabel?.text = " "
        self.detailTextLabel?.text = " "
        button.setTitle(text, for: .normal)
        button.backgroundColor = color
        self.setupViews()
    }

    func setupViews(){
        contentView.addSubview(button)
        button.addTarget(self, action: #selector(ButtonCell.touchUp(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
    }

    func touchUp(sender: UISwitch){
        print("T: touchUp")
    }

    override public func layoutSubviews() {
        updateConstraints()
        super.layoutSubviews()
    }

    override public func updateConstraints() {
        contentView.addConstraint(NSLayoutConstraint(item: button, attribute: .trailing, relatedBy: .equal, toItem: detailTextLabel , attribute: .trailing, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: textLabel , attribute: .leading, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: contentView , attribute: .height, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: contentView , attribute: .centerY, multiplier: 1, constant: 0))

// ios9
//        boolSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
//        boolSwitch.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        super.updateConstraints()
    }
    
}
