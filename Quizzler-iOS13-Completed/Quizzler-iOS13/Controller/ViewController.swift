//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    let soruFotolari = [UIImage(named: "sorufoto1"),
                        UIImage(named: "sorufoto2"),
                        UIImage(named: "sorufoto3"),
                        UIImage(named: "sorufoto4"),
                        UIImage(named: "sorufoto5"),
                        UIImage(named: "sorufoto6"),
                        UIImage(named: "sorufoto7"),
                        UIImage(named: "sorufoto8"),
                        UIImage(named: "sorufoto9"),
                        UIImage(named: "sorufoto10"),
                        UIImage(named: "sorufoto11"),
                        UIImage(named: "Image 4")
    ]
    
    var soruFotoSirasi = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        soruFotoSirasi += 1
        quizBrain.nextQuestion()

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        
        if soruFotoSirasi < soruFotolari.count {
            imageView.image = soruFotolari[soruFotoSirasi]
        }
        else{
            scoreLabel.text = ""
            questionLabel.text = "% \(quizBrain.getScore()*9) SELİN İNKAYA'YIM"
        }

        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "% \(quizBrain.getScore()*9) SELİN İNKAYA'YIM"
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }

}


























