//
//  FlowButtonView.swift
//  Vocabulabo
//
//  Created by Shu Nakamura on 2020/12/05.
//  Copyright © 2020 ShuNakamura. All rights reserved.
//

import UIKit

class FlowButtonView: UIView {
    @IBOutlet weak var title: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib() {
        
        if let view = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
        
//                if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
//                    view.frame = self.bounds
//                    self.addSubview(view)
//                }
    }
    }
}


