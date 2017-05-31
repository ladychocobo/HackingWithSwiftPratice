//
//  ViewController.swift
//  Project2
//
//  Created by Jamie Chen on 5/31/17.
//  Copyright © 2017 Jamie Chen. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    var buttons = [UIButton]()
    var countries = [String]()
    var score = 0
    let gap = UIScreen.main.bounds.height / 15
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        for i in 1...3 {
            let button = UIButton()
            button.setImage(UIImage(named: "us")?.withRenderingMode(.alwaysOriginal), for: .normal)
            button.tag = i
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.addTarget(self, action: #selector(self.onButtonAction(_:)), for: .touchUpInside)
            
            self.view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: gap * CGFloat(i + 2) + (gap * 2 * CGFloat(i - 1))).isActive = true
            button.widthAnchor.constraint(equalToConstant: 200).isActive = true
            button.heightAnchor.constraint(equalToConstant: 100).isActive = true
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.buttons.append(button)
        }
        
        askQuestion()
    }
    
    func askQuestion(_ action: UIAlertAction? = nil) {
        self.countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        for (index, button) in self.buttons.enumerated() {
            button.setImage(UIImage(named: countries[index]), for: .normal)
        }
        
        self.correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        self.title = self.countries[correctAnswer].uppercased()
    }
    
    func onButtonAction(_ sender: UIButton) {
        let titleStr: String
        titleStr = sender.tag == self.correctAnswer + 1 ? "正確" : "錯誤"
        self.score = sender.tag == self.correctAnswer + 1 ? self.score + 1 : self.score < 0 ? 0 : self.score - 1
        print(score)
        
        let alert = UIAlertController(title: titleStr, message: "分數為\(self.score > 0 ? self.score : 0)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "繼續", style: .default, handler: askQuestion))
        self.present(alert, animated: true)
    }
}

