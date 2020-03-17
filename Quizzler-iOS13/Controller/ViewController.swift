//
//  ViewController.swift
//  Quizzz-iOS13
//
//  Created by Huseyin Can Dayan on 4.01.2020.
//  Copyright © 2020 Active Sludge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
    
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        quizBrain.nextQuestion()
    }
    
        @objc func updateUI(){
            scoreLabel.text = quizBrain.getScore()
            questionLabel.text = quizBrain.getQuestionText()
            progressBar.progress = quizBrain.getProgress()
            choice1Button.backgroundColor = UIColor.clear
            choice2Button.backgroundColor = UIColor.clear
            choice3Button.backgroundColor = UIColor.clear
            choice1Button.setTitle(quizBrain.getChoices(answerOrder: 0), for: .normal)
            choice2Button.setTitle(quizBrain.getChoices(answerOrder: 1), for: .normal)
            choice3Button.setTitle(quizBrain.getChoices(answerOrder: 2), for: .normal)
        }
    
}
