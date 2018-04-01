//
//  ViewController.swift
//  HanguelCalculator
//
//  Created by 정기웅 on 2018. 4. 1..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var problemAnswer: Int?
    var cnt: Int = 0
    var timer = Timer()
    
    @IBOutlet weak var remainedTime: UILabel!
    @IBOutlet weak var numberOfCorrect: UILabel!
    @IBOutlet weak var problem: UILabel!
    @IBOutlet weak var answer: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTimer()
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(1),
                                         target: self,
                                         selector: #selector(setRemainTime),
                                         userInfo: nil,
                                         repeats: true)
    }
    
    func setTimer() {
        makeProblem()
        remainedTime.text = "10"
        cnt = 10
    }
    
    @objc func setRemainTime() {
        if cnt < 0 {
            timer.invalidate()
            return
        }
        remainedTime.text = "\(cnt)"
        cnt -= 1
    }
    
    func makeProblem() {
        var numA = Int(arc4random() % 100)
        var numB = Int(arc4random() % 100)
        let a = HanguelNumber.intToHanguel(Number: numA)
        let b = HanguelNumber.intToHanguel(Number: numB)
        let symbol = HanguelArithSigne.arithSigneToHanguel(Number: Int(arc4random() % 4))
        if symbol == "빼기" && numA < numB { (numA, numB) = (numB, numA) }
        
        if let _a = a, let _b = b, let _symbol = symbol {
            problem.text = _a + _symbol + _b
            problemAnswer = numA + numB //
        }
    }

    func checkAnswer(Answer ans: String?) -> Bool {
        if Int(ans!) == problemAnswer { return true }
        else { return false }
    }

    @IBAction func summitAnswer(_ sender: Any) {
        if checkAnswer(Answer: answer.text!) {
            setTimer()
        }
        else {
            //violate
        }
    }
    
    
}

