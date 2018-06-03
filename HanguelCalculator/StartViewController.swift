//
//  StartViewController.swift
//  HanguelCalculator
//
//  Created by 정기웅 on 2018. 4. 2..
//  Copyright © 2018년 정기웅. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
 
    
    private let gradientLayer = CAGradientLayer()
    private var currentGradientIndex: Int = 0
    private let gradientSet = [
        [UIColor.orange.cgColor, UIColor.green.cgColor],
        [UIColor.green.cgColor, UIColor.red.cgColor],
        [UIColor.red.cgColor, UIColor.yellow.cgColor],
        [UIColor.yellow.cgColor, UIColor.orange.cgColor]
    ]

    private let gradientView = UIView(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(start)))
        makeGradientLabel()
    }

    func makeGradientLabel() {
        let title = UILabel(frame: UIScreen.main.bounds)
        title.text = "시작하기"
        title.font = UIFont(name: "GodoM", size: 72)
        title.textAlignment = .center
        gradientView.addSubview(title)
        gradientView.mask = title
        
        gradientLayer.frame = gradientView.bounds
        gradientLayer.colors = gradientSet[currentGradientIndex]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.drawsAsynchronously = true
        gradientView.layer.addSublayer(gradientLayer)
    
        self.view.addSubview(gradientView)
        animateGradient()
    }
    
    private func animateGradient() {
        let gradientAnimation = CABasicAnimation(keyPath: "colors")
        gradientAnimation.fromValue = gradientSet[currentGradientIndex]
        currentGradientIndex = (currentGradientIndex + 1) % gradientSet.count
        gradientAnimation.toValue = gradientSet[currentGradientIndex]
        
        gradientAnimation.delegate = self
        gradientAnimation.duration = 3.0
        gradientAnimation.fillMode = kCAFillModeForwards
        gradientAnimation.isRemovedOnCompletion = false
        gradientLayer.add(gradientAnimation, forKey: "colorChange")
    }

    
    @objc func start(_ sender: Any) {
        self.performSegue(withIdentifier: "go_game", sender: nil)
    }
    
}

extension StartViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            gradientLayer.colors = gradientSet[currentGradientIndex]
            animateGradient()
        }
    }
}
