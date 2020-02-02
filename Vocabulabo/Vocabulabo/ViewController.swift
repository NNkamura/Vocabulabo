//
//  ViewController.swift
//  Vocabulabo
//
//  Created by Shu Nakamura on 2020/02/01.
//  Copyright © 2020 ShuNakamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let wikipediaTextString = ReadTextFile.shared.read(),
            let wikipediaDataRow = WikipediaUtil.stringToArray(str:wikipediaTextString){
            for wikipediaColumn in wikipediaDataRow{
                
                print(wikipediaColumn.category1)
                print(wikipediaColumn.category2)
                print(wikipediaColumn.titleName)
            }
        }
    }
}

