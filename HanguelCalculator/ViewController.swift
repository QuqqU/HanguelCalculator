//
//  ViewController.swift
//  HanguelCalculator
//
//  Created by 정기웅 on 2018. 4. 1..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberOfCorrect: UILabel!
    @IBOutlet weak var problem: UILabel!
    @IBOutlet weak var answer: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func makeProblem() {
        let a = arc4random() % 100
        let b = arc4random() % 100
        
        
        
    }



    @IBAction func summitAnswer(_ sender: Any) {
        
        
    }
    
    
}

