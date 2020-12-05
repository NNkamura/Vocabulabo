//
//  ViewController.swift
//  Vocabulabo
//
//  Created by Shu Nakamura on 2020/02/01.
//  Copyright © 2020 ShuNakamura. All rights reserved.
//

import UIKit


let boundHeight = UIScreen.main.bounds.size.height
let boundWidth = UIScreen.main.bounds.size.width

class ViewController: UIViewController {
    var buttonTitles:[WikipediaTitleData]?
    
    let clearSpace = boundWidth / 2
    let wordCount = floor((boundHeight - 50) / 25)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !UseUserDefault.getDatabaseStatus(){
            wikipediaDataSetup()
            buttonSetup()
        }else{
            if let buttonTitles = UseRealm.shared.getWikipedia(){
                self.buttonTitles = buttonTitles
            }
            buttonSetup()
        }
    }
    
    func buttonSetup(){
        var useButtonList:[UIButton] = []
        // ボタンの生成
        for i in 0 ..< Int(wordCount){
            let button: FlowButton = {
                let button = FlowButton(frame:CGRect(x: Int(boundWidth + clearSpace), y: 25 + (i * 25), width: 0, height: 0),title:"")
                button.addTarget(self, action: #selector(buttonAction(word:)), for: .touchDown)
                return button
            }()
            useButtonList.append(button)
        }
        
        // ボタン文字の代入
        for i in 0 ..< Int(wordCount){
            self.view.addSubview(useButtonList[i])
            let randomDouble = Double.random(in: 12 ... 16)
            
            var timer = Timer.scheduledTimer(withTimeInterval: randomDouble, repeats: true, block: { (timer) in
                textChange(wordButton: useButtonList[i])
                //                textMove(wordButton: useButtonList[i], duration: randomDouble, moveToX: boundWidth + self.clearSpace + self.clearSpace)
                textMove(wordButton: useButtonList[i], time: randomDouble, moveToX: boundWidth + self.clearSpace + self.clearSpace)
            })
        }
        
        func textChange(wordButton:UIButton){
            wordButton.setTitle(self.buttonTitles!.randomElement()!.titleName, for: .normal)
            wordButton.sizeToFit()
        }
        
        /// 未完成、タップ不可能だがイメージ通りの動作パターン
        func textMove(wordButton:UIButton,duration:TimeInterval,moveToX:CGFloat){
            UIView.animate(withDuration: duration, delay: 0, animations: {
                wordButton.center.x -= moveToX
            }, completion: { _ in
                wordButton.center.x += moveToX
            })
        }
        
        ///  未完成、タップ可能なボタンの動作パターン
        func textMove(wordButton:UIButton,time:Double,moveToX:CGFloat){
            var timer = Timer.scheduledTimer(withTimeInterval: time / 100, repeats: true, block: { (timer) in
                wordButton.center.x -= moveToX / 100
            })
        }
    }
    
    func wikipediaDataSetup(){
        if let wikipediaTextString = ReadTextFile.shared.read(),
            let wikipediaDataRow = WikipediaUtil.stringToArray(str:wikipediaTextString){
            var isSaveSuccess = true
            print("RealmCreateStart")
            var count = 0
            for wikipediaColumn in wikipediaDataRow{
                let isSave = UseRealm.shared.saveWikipedia(category1:String(wikipediaColumn.category1),
                                                           category2:String(wikipediaColumn.category2),
                                                           titleName:wikipediaColumn.titleName)
                // saveに一件でも失敗したらfalseにする
                if !isSave{
                    isSaveSuccess = isSave
                }
                count += 1
                if count % 1000 == 0{
                    print("\(count)件の処理が終わりました。残りは\(wikipediaDataRow.count - count)件です。")
                    print("DEBUG:もういいよ、break")
                    break
                }
            }
            print("RealmCreateFinish")
            if let buttonTitles = UseRealm.shared.getWikipedia(){
                self.buttonTitles = buttonTitles
                UseUserDefault.saveDatabaseStatus(isSaveSuccess)
            }
        }
    }
    
    @objc func buttonAction(word:UIButton){
        let wordStr = word.titleLabel?.text ?? ""
        let urlString = "https://ja.wikipedia.org/wiki/" + wordStr
        guard let encodeUrlString: String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string:encodeUrlString) else{
                return
        }
        if (UIApplication.shared.canOpenURL(url)) {
            UIApplication.shared.open(url)
        }
    }
}

