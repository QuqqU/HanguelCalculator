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
    var solved = 0
    
    @IBOutlet weak var solvedProblem: UILabel!
    @IBOutlet weak var remainedTime: UILabel!
    @IBOutlet weak var numberOfCorrect: UILabel!
    @IBOutlet weak var problem: UILabel!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var summitButton: UIButton!
    
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
            summitButton.isEnabled = false
            return
        }
        if cnt <= 5 {
            remainedTime.textColor = UIColor.red
        }
        else {
            remainedTime.textColor = UIColor.black
        }
        remainedTime.text = "\(cnt)"
        cnt -= 1
    }
    
    func makeProblem() {
        self.problem.transform = .identity
        
        
        var numA = Int(arc4random() % 100)
        var numB = Int(arc4random() % 100)
        let a = HanguelNumber.intToHanguel(Number: numA)
        let b = HanguelNumber.intToHanguel(Number: numB)
        let symbol = HanguelArithSigne.arithSigneToHanguel(Number: Int(arc4random() % 4))
        if symbol == "빼기" && numA < numB {
            (numA, numB) = (numB, numA)
            (a, b) = (b, a)
        }
        
        if let _a = a, let _b = b, let _symbol = symbol {
            problem.text = _a + _symbol + _b
            switch _symbol {
            case "더하기" : problemAnswer = numA + numB
            case "빼기" : problemAnswer = numA - numB
            case "곱하기" : problemAnswer = numA * numB
            case "나누기" : problemAnswer = numA / numB
            default : ()
            }
        }
        
        UIView.animate(withDuration: TimeInterval(2),
                       animations: {
                        self.problem.transform = CGAffineTransform(scaleX: 2, y: 2)
        })
    }

    func checkAnswer(Answer ans: String?) -> Bool {
        if Int(ans!) == problemAnswer { return true }
        else { return false }
    }

    @IBAction func summitAnswer(_ sender: Any) {
        if checkAnswer(Answer: answer.text!) {
            setTimer()
            answer.textColor = UIColor.black
            solved += 1
            solvedProblem.text = "정답수 : \(solved)"
        }
        else {
            answer.shake()
            answer.textColor = UIColor.red
        }
    }
}

