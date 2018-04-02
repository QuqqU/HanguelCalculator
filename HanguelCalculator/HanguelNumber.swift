//
//  HanguelNumber.swift
//  HanguelCalculator
//
//  Created by 정기웅 on 2018. 4. 1..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import Foundation



class HanguelNumber {
    static let shared = HanguelNumber()
    
    static func hanguelToInt(Hanguel hanguel: String) -> Int? {
        switch hanguel {
        case "일" : return 1
        case "이" : return 2
        case "삼" : return 3
        case "사" : return 4
        case "오" : return 5
        case "육" : return 6
        case "칠" : return 7
        case "팔" : return 8
        case "구" : return 9
        case "십" : return 10
        default : return nil
        }
    }
    
    static func intToHanguel(Number number: Int) -> String? {
        guard 0..<100 ~= number else { return nil }
        if number < 10 {
            return self.sigleDigitNumToHanguel(number)
        }
        else {
            let tenPlace = sigleDigitNumToHanguel(number / 10)
            let onePlace = sigleDigitNumToHanguel(number % 10)
            return (tenPlace == "일" ? "" : tenPlace) + "십" + onePlace
        }
    }
    
    static func sigleDigitNumToHanguel(_ a: Int) -> String {
        switch a {
        case 1 : return "일"
        case 2 : return "이"
        case 3 : return "삼"
        case 4 : return "사"
        case 5 : return "오"
        case 6 : return "육"
        case 7 : return "칠"
        case 8 : return "팔"
        case 9 : return "구"
        case 10 : return "십"
        default : return ""
        }
    }
}
























