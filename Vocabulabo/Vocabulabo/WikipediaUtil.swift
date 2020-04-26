//
//  WikipediaUtil.swift
//  Vocabulabo
//
//  Created by Shu Nakamura on 2020/02/01.
//  Copyright © 2020 ShuNakamura. All rights reserved.
//

import UIKit

class WikipediaUtil: NSObject {
    class func stringToArray(str:String) -> [WikipediaDataSet]?{
        var data:[WikipediaDataSet] = []
        
        for row in str.components(separatedBy: "\n"){
            let column = row.components(separatedBy: ":")
            if column.count != 3{
                 print("テキストファイルが正常に読み込めませんでした")
                print(column)
//                break
//                return nil
            }else{
                if let category1 = Int(column[0]),
                    let category2 = Int(column[1]){
                    data.append(WikipediaDataSet(category1: category1, category2: category2, titleName: column[2]))
                }else{
                    print("テキストファイルに誤りがあります")
                    return nil
                }
            }
        }
        return data
    }
}


struct WikipediaDataSet{
    let category1:Int// = 0
    let category2:Int// = 0
    let titleName:String// = ""
}
