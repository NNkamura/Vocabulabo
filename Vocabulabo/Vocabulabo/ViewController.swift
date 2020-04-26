//
//  ViewController.swift
//  Vocabulabo
//
//  Created by Shu Nakamura on 2020/02/01.
//  Copyright © 2020 ShuNakamura. All rights reserved.
//

import UIKit

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
        let button = FlowButton(frame:CGRect(x: 500, y: 50, width: 0, height: 0),title:"aaa")
        return button
    }()
    let word2: FlowButton = {
        let button = FlowButton(frame:CGRect(x: 500, y: 100, width: 0, height: 0),title:"aaa")
        return button
    }()
    let word3: FlowButton = {
        let button = FlowButton(frame:CGRect(x: 500, y: 150, width: 0, height: 0),title:"aaa")
        return button
    }()
    let word4: FlowButton = {
        let button = FlowButton(frame:CGRect(x: 500, y: 200, width: 0, height: 0),title:"aaa")
        return button
    }()
    let word5: FlowButton = {
        let button = FlowButton(frame:CGRect(x: 500, y: 250, width: 0, height: 0),title:"aaa")
        return button
    }()
    
    func buttonCreate(){
        self.view.addSubview(word1)
        self.view.addSubview(word2)
        self.view.addSubview(word3)
        self.view.addSubview(word4)
        self.view.addSubview(word5)
        
        moveButton()
    }
    
    func moveButton(){
        
        var timer1 = Timer()
        var timer2 = Timer()
        var timer3 = Timer()
        var timer4 = Timer()
        var timer5 = Timer()

        timer1 = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: { (timer) in
            textChange(wordButton: self.word1)
        })

        UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat], animations: {
            self.word1.center.x -= 600.0
        }, completion: { _ in
        })

        timer2 = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: { (timer) in
        textChange(wordButton: self.word2)
        })

        UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat], animations: {
            self.word2.center.x -= 600.0
        }, completion: { _ in
        })

        timer3 = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: { (timer) in
        textChange(wordButton: self.word3)
        })

        UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat], animations: {
            self.word3.center.x -= 600.0
        }, completion: { _ in
        })

        timer4 = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: { (timer) in
        textChange(wordButton: self.word4)
        })

        UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat], animations: {
            self.word4.center.x -= 600.0
        }, completion: { _ in
        })

        timer5 = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: { (timer) in
        textChange(wordButton: self.word5)
        })

        UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat], animations: {
            self.word5.center.x -= 600.0
        }, completion: { _ in
        })

        func textChange(wordButton:UIButton){
            wordButton.setTitle(self.buttonTitles!.randomElement()!.titleName, for: .normal)
            wordButton.sizeToFit()
        }
        
//        var timer1 = Timer()
//        var timer2 = Timer()
//        var timer3 = Timer()
//        var timer4 = Timer()
//        var timer5 = Timer()
//
//        timer1 = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: { (timer) in
//            self.word1.setTitle(self.buttonTitles!.randomElement()!.titleName, for: .normal)
//            self.word1.sizeToFit()
//        })
//
//        UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat], animations: {
//            self.word1.center.x -= 600.0
//        }, completion: { _ in
//        })
//
//        timer2 = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: { (timer) in
//            self.word2.setTitle(self.buttonTitles!.randomElement()!.titleName, for: .normal)
//            self.word2.sizeToFit()
//        })
//
//        UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat], animations: {
//            self.word2.center.x -= 600.0
//        }, completion: { _ in
//        })
//
//        timer3 = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: { (timer) in
//            self.word3.setTitle(self.buttonTitles!.randomElement()!.titleName, for: .normal)
//            self.word3.sizeToFit()
//        })
//
//        UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat], animations: {
//            self.word3.center.x -= 600.0
//        }, completion: { _ in
//        })
//
//        timer4 = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: { (timer) in
//            self.word4.setTitle(self.buttonTitles!.randomElement()!.titleName, for: .normal)
//            self.word4.sizeToFit()
//        })
//
//        UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat], animations: {
//            self.word4.center.x -= 600.0
//        }, completion: { _ in
//        })
//
//        timer5 = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: { (timer) in
//            self.word5.setTitle(self.buttonTitles!.randomElement()!.titleName, for: .normal)
//            self.word5.sizeToFit()
//        })
//
//        UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat], animations: {
//            self.word5.center.x -= 600.0
//        }, completion: { _ in
//        })
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
