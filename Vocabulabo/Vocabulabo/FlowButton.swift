//
//  FlowButton.swift
//  Vocabulabo
//
//  Created by Shu Nakamura on 2020/02/05.
//  Copyright © 2020 ShuNakamura. All rights reserved.
//

import UIKit

class FlowButton: UIButton {
    var setTitle = ""
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle(setTitle, for: UIControl.State.normal)
        self.setTitleColor(UIColor.white, for: UIControl.State.normal)
        self.backgroundColor = UIColor.clear
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 2
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        self.sizeToFit()
    }
    
    convenience init(frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 40),title: String) {
        self.init(frame: frame)
        self.setTitle = title
    }
}
