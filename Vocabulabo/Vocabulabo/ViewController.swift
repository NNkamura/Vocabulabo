//
//  ViewController.swift
//  Vocabulabo
//
//  Created by Shu Nakamura on 2020/02/01.
//  Copyright © 2020 ShuNakamura. All rights reserved.
//

import UIKit


let boundWidth = UIScreen.main.bounds.size.width
let clearSpace = UIScreen.main.bounds.size.width / 2

class ViewController: UIViewController {
    var buttonTitles:[WikipediaTitleData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let buttonTitles = UseRealm.shared.getWikipedia(){
//            self.buttonTitles = buttonTitles
//            buttonCreate()
//        }
        
        if !UseUserDefault.getDatabaseStatus(){
            wikipediaDataSetup()
            buttonCreate()
        }else{
            if let buttonTitles = UseRealm.shared.getWikipedia(){
                self.buttonTitles = buttonTitles
            }
            buttonCreate()
        }
    }
    
    
    let word1: FlowButton = {
        let button = FlowButton(frame:CGRect(x: boundWidth + clearSpace, y: 50, width: 0, height: 0),title:"aaa")
        return button
    }()
    let word2: FlowButton = {
        let button = FlowButton(frame:CGRect(x: boundWidth + clearSpace, y: 75, width: 0, height: 0),title:"aaa")
        return button
    }()
    let word3: FlowButton = {
        let button = FlowButton(frame:CGRect(x: boundWidth + clearSpace, y: 100, width: 0, height: 0),title:"aaa")
        return button
    }()
    let word4: FlowButton = {
        let button = FlowButton(frame:CGRect(x: boundWidth + clearSpace, y: 125, width: 0, height: 0),title:"aaa")
        return button
    }()
    let word5: FlowButton = {
        let button = FlowButton(frame:CGRect(x: boundWidth + clearSpace, y: 150, width: 0, height: 0),title:"aaa")
        return button
    }()
    let word6: FlowButton = {
        let button = FlowButton(frame:CGRect(x: boundWidth + clearSpace, y: 175, width: 0, height: 0),title:"aaa")
        return button
    }()
    let word7: FlowButton = {
        let button = FlowButton(frame:CGRect(x: boundWidth + clearSpace, y: 200, width: 0, height: 0),title:"aaa")
        return button
    }()
    let word8: FlowButton = {
        let button = FlowButton(frame:CGRect(x: boundWidth + clearSpace, y: 225, width: 0, height: 0),title:"aaa")
        return button
    }()
    let word9: FlowButton = {
        let button = FlowButton(frame:CGRect(x: boundWidth + clearSpace, y: 250, width: 0, height: 0),title:"aaa")
        return button
    }()
    let word10: FlowButton = {
        let button = FlowButton(frame:CGRect(x: boundWidth + clearSpace, y: 275, width: 0, height: 0),title:"aaa")
        return button
    }()
    
    func buttonCreate(){
        self.view.addSubview(word1)
        self.view.addSubview(word2)
        self.view.addSubview(word3)
        self.view.addSubview(word4)
        self.view.addSubview(word5)
        self.view.addSubview(word6)
        self.view.addSubview(word7)
        self.view.addSubview(word8)
        self.view.addSubview(word9)
        self.view.addSubview(word10)
        
        moveButton()
    }
    
    func moveButton(){
        let time1 = 10.0
        let time2 = 9.0
        let time3 = 8.3
        let time4 = 7.9
        let time5 = 8.2
        let time6 = 7.5
        let time7 = 8.1
        let time8 = 8.8
        let time9 = 9.4
        let time10 = 10.1
        
        
        var timer1 = Timer.scheduledTimer(withTimeInterval: time1, repeats: true, block: { (timer) in
            textChange(wordButton: self.word1)
            textMove(wordButton: self.word1, duration: time1, moveToX: boundWidth + clearSpace + clearSpace)
        })
        
        var timer2 = Timer.scheduledTimer(withTimeInterval: time2, repeats: true, block: { (timer) in
            textChange(wordButton: self.word2)
            textMove(wordButton: self.word2, duration: time2, moveToX: boundWidth + clearSpace + clearSpace)
        })
        
        var timer3 = Timer.scheduledTimer(withTimeInterval: time3, repeats: true, block: { (timer) in
            textChange(wordButton: self.word3)
            textMove(wordButton: self.word3, duration: time3, moveToX: boundWidth + clearSpace + clearSpace)
        })
        
        var timer4 = Timer.scheduledTimer(withTimeInterval: time4, repeats: true, block: { (timer) in
            textChange(wordButton: self.word4)
            textMove(wordButton: self.word4, duration: time4, moveToX: boundWidth + clearSpace + clearSpace)
        })
        
        var timer5 = Timer.scheduledTimer(withTimeInterval: time5, repeats: true, block: { (timer) in
            textChange(wordButton: self.word5)
            textMove(wordButton: self.word5, duration: time5, moveToX: boundWidth + clearSpace + clearSpace)
        })
        
        var timer6 = Timer.scheduledTimer(withTimeInterval: time6, repeats: true, block: { (timer) in
            textChange(wordButton: self.word6)
            textMove(wordButton: self.word6, duration: time6, moveToX: boundWidth + clearSpace + clearSpace)
        })
        
        var timer7 = Timer.scheduledTimer(withTimeInterval: time7, repeats: true, block: { (timer) in
            textChange(wordButton: self.word7)
            textMove(wordButton: self.word7, duration: time7, moveToX: boundWidth + clearSpace + clearSpace)
        })
        
        var timer8 = Timer.scheduledTimer(withTimeInterval: time8, repeats: true, block: { (timer) in
            textChange(wordButton: self.word8)
            textMove(wordButton: self.word8, duration: time8, moveToX: boundWidth + clearSpace + clearSpace)
        })
        
        var timer9 = Timer.scheduledTimer(withTimeInterval: time9, repeats: true, block: { (timer) in
            textChange(wordButton: self.word9)
            textMove(wordButton: self.word9, duration: time9, moveToX: boundWidth + clearSpace + clearSpace)
        })
        
        var timer10 = Timer.scheduledTimer(withTimeInterval: time10, repeats: true, block: { (timer) in
            textChange(wordButton: self.word10)
            textMove(wordButton: self.word10, duration: time10, moveToX: boundWidth + clearSpace + clearSpace)
        })

        func textMove(wordButton:UIButton,duration:TimeInterval,moveToX:CGFloat){
            UIView.animate(withDuration: duration, delay: 0.0, animations: {
                wordButton.center.x -= moveToX
            }, completion: { _ in
                wordButton.center.x += moveToX
            })
        }
        
        func textChange(wordButton:UIButton){
            wordButton.setTitle(self.buttonTitles!.randomElement()!.titleName, for: .normal)
            wordButton.sizeToFit()
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
}
