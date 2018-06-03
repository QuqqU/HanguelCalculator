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
    @IBOutlet weak var problem: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var summitButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var numberButtons: UIStackView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.restartButton.isHidden = true
        self.answer.text = ""
        self.setTimer()
    }
    
    func gameEnd() {
        self.remainedTime.isHidden = true
        self.problem.isHidden = true
        self.answer.isHidden = true
        self.summitButton.isHidden = true
        self.restartButton.isHidden = false
        self.deleteButton.isHidden = true
        self.numberButtons.isHidden = true
        
        UIView.animate(withDuration: TimeInterval(2),
                       animations: {
                        self.solvedProblem.transform = CGAffineTransform(scaleX: 3, y: 3)
                        self.solvedProblem.transform = CGAffineTransform(translationX: -(self.solvedProblem.frame.minX + self.solvedProblem.frame.maxX) / 2 + UIScreen.main.bounds.width / 2,
                                                                         y: -(self.solvedProblem.frame.minY + self.solvedProblem.frame.maxY) / 2 + UIScreen.main.bounds.height / 2)
        })
    }
    
    
    func setTimer() {
        makeProblem()
        remainedTime.text = "10"
        remainedTime.textColor = UIColor.black
        cnt = 10
        
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(1),
                                     target: self,
                                     selector: #selector(setRemainTime),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func setRemainTime() {
        if cnt < 0 {
            timer.invalidate()
            gameEnd()
            return
        }
        if cnt <= 5 { remainedTime.textColor = UIColor.red }

        remainedTime.text = "\(cnt)"
        cnt -= 1
    }
    
    func makeProblem() {
        self.problem.transform = .identity
        self.problem.alpha = 1
        
        var numA = Int(arc4random() % 99 + 1)
        var numB = Int(arc4random() % 99 + 1)
        let symbol = HanguelArithSigne.arithSigneToHanguel(Number: Int(arc4random() % 4))
        if symbol == "빼기" && numA < numB { (numA, numB) = (numB, numA) }
        let a = HanguelNumber.intToHanguel(Number: numA)
        let b = HanguelNumber.intToHanguel(Number: numB)
        
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
        
        UIView.animate(withDuration: TimeInterval(10),
                       animations: {
                        self.problem.transform = CGAffineTransform(scaleX: 1.8, y: 2)
                        self.problem.alpha = 0.01
                        
        })
    }

    func checkAnswer(Answer ans: String?) -> Bool {
        if Int(ans!) == problemAnswer { return true }
        else { return false }
    }

    @IBAction func tabNumber1(_ sender: UIButton) {
        self.answer.text?.append((sender.titleLabel?.text)!)
    }
    
    @IBAction func DeleteAnswerSheet(_ sender: Any) {
        self.answer.text = ""
    }
    
    @IBAction func restart(_ sender: Any) {
        self.remainedTime.isHidden = false
        self.problem.isHidden = false
        self.answer.isHidden = false
        self.summitButton.isHidden = false
        self.restartButton.isHidden = true
        self.deleteButton.isHidden = false
        self.numberButtons.isHidden = false
        
        setTimer()
        self.answer.textColor = .black
        self.answer.text = ""
        self.solvedProblem.transform = .identity
        solved = 0
        solvedProblem.text = "정답수 : 0"
    }
    @IBAction func summitAnswer(_ sender: Any) {
        if checkAnswer(Answer: answer.text!) {
            setTimer()
            answer.textColor = UIColor.black
            answer.text = ""
            solved += 1
            solvedProblem.text = "정답수 : \(solved)"
        }
        else {
            answer.shake()
            answer.textColor = UIColor.red
        }
    }
    
}

