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
    var countries = [(String, String)]()
    var score = 0
    let gap = UIScreen.main.bounds.height / 15
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        self.countries += [("estonia", "愛沙尼亞"), ("france", "法國"), ("germany", "德國"), ("ireland", "愛爾蘭"), ("italy", "義大利"), ("monaco", "摩納哥"), ("nigeria", "奈及利亞"), ("poland", "波蘭"), ("russia","俄羅斯"), ("spain","西班牙"), ("uk", "英國"), ("us", "美國")]
        
        for i in 1...3 {
            let button = UIButton()
            button.setImage(UIImage(named: "us")?.withRenderingMode(.alwaysOriginal), for: .normal)
            button.tag = i
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.addTarget(self, action: #selector(self.onButtonAction(_:)), for: .touchUpInside)
            
            self.view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            // 謝謝默司大大的提醒，不是對齊self.view.topAnchor而是對準navigationBar的buttomAnchor
            button.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: gap + (gap * CGFloat(i - 1) * 3)).isActive = true
            button.widthAnchor.constraint(equalToConstant: 200).isActive = true
            button.heightAnchor.constraint(equalToConstant: 100).isActive = true
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.buttons.append(button)
        }
        
        askQuestion()
    }
    
    func askQuestion(_ action: UIAlertAction? = nil) {
//        self.countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        self.countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [(String, String)]
        for (index, button) in self.buttons.enumerated() {
            button.setImage(UIImage(named: countries[index].0), for: .normal)
        }
        
        self.correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
//        self.title = self.countries[correctAnswer].uppercased()
        self.title = self.countries[self.correctAnswer].1
    }
    
    func onButtonAction(_ sender: UIButton) {
        let titleStr: String
        titleStr = sender.tag == self.correctAnswer + 1 ? "正確" : "錯誤"
        self.score = sender.tag == self.correctAnswer + 1 ? self.score + 1 : self.score > 0 ? self.score - 1 : 0

        let alert = UIAlertController(title: titleStr, message: "分數為\(self.score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "繼續", style: .default, handler: askQuestion))
        self.present(alert, animated: true)
    }
}

