//
//  StartViewController.swift
//  HanguelCalculator
//
//  Created by 정기웅 on 2018. 4. 2..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
    @IBAction func start(_ sender: Any) {
        self.performSegue(withIdentifier: "go_game", sender: nil)
    }
    
}
