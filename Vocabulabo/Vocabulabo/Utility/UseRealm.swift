//
//  SaveVocabularyToRealm.swift
//  Vocabulabo
//
//  Created by Shu Nakamura on 2020/02/01.
//  Copyright © 2020 ShuNakamura. All rights reserved.
//

import UIKit
import RealmSwift

class UseRealm {
    static let shared = UseRealm()

    // データを保存するための処理
    func saveWikipedia(category1:String,category2:String,titleName:String) -> Bool{
      do {
        let realm = try Realm()  // Realmのインスタンスを作成します。
        try realm.write {
            let dataSet = WikipediaTitleData()
            dataSet.category1 = category1
            dataSet.category2 = category2
            dataSet.titleName = titleName
            realm.add(dataSet)
        }
        return true
      } catch {
        print("!!Realm Write Error!!")
        return false
      }
    }

    func getWikipedia() -> [WikipediaTitleData]?{
        do {
            let realm = try Realm()  // Realmのインスタンスを作成します。
            let data:[WikipediaTitleData] = Array(realm.objects(WikipediaTitleData.self))
            return data
        } catch {
          print("!!Realm Get Error!!")
          return nil
        }
    }
}


class WikipediaTitleData: Object {
    @objc dynamic var category1:String = ""
    @objc dynamic var category2:String = ""
    @objc dynamic var titleName:String = ""
}
