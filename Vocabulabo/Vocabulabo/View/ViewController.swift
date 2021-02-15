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
        var useButtonList:[FlowButtonView] = []
        // ボタンの生成
        for i in 0 ..< Int(wordCount){
            let flowButtonView: FlowButtonView = {
                let createButton = FlowButtonView(frame:CGRect(x: Int(boundWidth + clearSpace), y: 25 + (i * 25), width: 20, height: 20))
                // タップジェスチャーを作成します。
                let singleTapGesture = TapgesutureWithView(target: self, action: #selector(singleTap(_:)))
                singleTapGesture.numberOfTapsRequired = 1
                singleTapGesture.myView = createButton
                createButton.addGestureRecognizer(singleTapGesture)
                return createButton
            }()
            
            useButtonList.append(flowButtonView)
        }
        
        // ボタン文字の代入
        for i in 0 ..< Int(wordCount){
            self.view.addSubview(useButtonList[i])
            let randomDouble = Double.random(in: 12 ... 16)
            
            var timer = Timer.scheduledTimer(withTimeInterval: randomDouble, repeats: true, block: { (timer) in
                textChange(wordButton: useButtonList[i])
                textMove(wordButton: useButtonList[i], duration: randomDouble, moveToX: boundWidth + self.clearSpace + self.clearSpace)
            })
        }
        func textChange(wordButton:FlowButtonView){
            wordButton.title.text = self.buttonTitles!.randomElement()!.titleName
            wordButton.title.sizeToFit()
            wordButton.frame.size = wordButton.title.frame.size
        }
        /// タップ可能なViewを動かす
        func textMove(wordButton:FlowButtonView,duration:TimeInterval,moveToX:CGFloat){
            UIView.animate(withDuration: duration, delay: 0, animations: {
                wordButton.center.x -= moveToX
            }, completion: { _ in
                wordButton.center.x += moveToX
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
    
//    @objc func buttonAction(word:UIButton){
//        let wordStr = word.titleLabel?.text ?? ""
//        let urlString = "https://ja.wikipedia.org/wiki/" + wordStr
//        guard let encodeUrlString: String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
//            let url = URL(string:encodeUrlString) else{
//                return
//        }
//        if (UIApplication.shared.canOpenURL(url)) {
//            UIApplication.shared.open(url)
//        }
//    }
    
    /**
     シングルタップされた時に呼び出されます。
     - Parameter gesture: タップジェスチャーオブジェクト
     */
    @objc func singleTap(_ gesture: TapgesutureWithView) {
        
        let wordStr = gesture.myView.title.text ?? ""
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


class TapgesutureWithView: UITapGestureRecognizer{
    var myView = FlowButtonView()
}
