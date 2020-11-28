//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    // Initialize a QuizBrain struct to hold question, score, and progress data
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        
        //load the initial UI
        updateUI()
    }
    
    //Evaluates user answer (T/F) and changes UIButton background to green (correct) or red (incorrect)
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        if quizBrain.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        // Progress quiz to next question, with a 0.2sec delay before loading next question's UI text
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)
    }
    
    // Update UI text (question, answers, score), update progress bar UI, and clear answer button background colors
    @objc func updateUI() {
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        
        aButton.setTitle(quizBrain.getButtonText(index: 0), for: .normal)
        bButton.setTitle(quizBrain.getButtonText(index: 1), for: .normal)
        cButton.setTitle(quizBrain.getButtonText(index: 2), for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        
        aButton.backgroundColor = UIColor.clear
        bButton.backgroundColor = UIColor.clear
        cButton.backgroundColor = UIColor.clear
    }
}
