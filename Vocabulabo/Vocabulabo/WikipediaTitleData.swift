//
//  WikipediaTitleData.swift
//  Vocabulabo
//
//  Created by Shu Nakamura on 2020/02/01.
//  Copyright © 2020 ShuNakamura. All rights reserved.
//

import UIKit
import RealmSwift

class WikipediaTitleData: Object {
    @objc dynamic var category1 = ""
    @objc dynamic var category2 = ""
    @objc dynamic var title = ""
}
