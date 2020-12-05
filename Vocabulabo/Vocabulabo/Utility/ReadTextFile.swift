//
//  ReadTextFile.swift
//  Vocabulabo
//
//  Created by Shu Nakamura on 2020/02/01.
//  Copyright © 2020 ShuNakamura. All rights reserved.
//

import UIKit

class ReadTextFile {
    static let shared = ReadTextFile()
    
    func read() -> String?{
        if let filePath = Bundle.main.path(forResource: String(Constants.fileName), ofType: "txt"),
        let str = try? String(contentsOfFile: filePath, encoding: String.Encoding.utf8) {
            return str
        }
        return nil
    }
}
