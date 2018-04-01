//
//  HanguelToArithSigne.swift
//  HanguelCalculator
//
//  Created by 정기웅 on 2018. 4. 1..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import Foundation



class HanguelArithSigne {
    static let shared = HanguelArithSigne()
    
    static func arithSigneToHanguel(Symbol s: String) -> String? {
        switch s {
        case "+" : return "더하기"
        case "-" : return "빼기"
        case "*" : return "곱하기"
        case "/" : return "나누기"
        default : return nil
        }
    }

    static func arithSigneToHanguel(Number n: Int) -> String? {
        var symbol: String
        switch n {
        case 0 : symbol = "+"
        case 1 : symbol = "-"
        case 2 : symbol = "*"
        case 3 : symbol = "/"
        default: return nil
        }
        return arithSigneToHanguel(Symbol: symbol)
    }
}
