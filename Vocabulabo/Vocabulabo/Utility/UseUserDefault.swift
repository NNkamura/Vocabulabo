//
//  UseUserDefault.swift
//  Vocabulabo
//
//  Created by Shu Nakamura on 2020/02/02.
//  Copyright © 2020 ShuNakamura. All rights reserved.
//

import UIKit

class UseUserDefault{
    class func saveDatabaseStatus(_ isSuccess:Bool){
        UserDefaults.standard.set(isSuccess, forKey: "successWikipediaData")
    }
    
    class func getDatabaseStatus() -> Bool{
        UserDefaults.standard.bool(forKey: "successWikipediaData")
    }
}
