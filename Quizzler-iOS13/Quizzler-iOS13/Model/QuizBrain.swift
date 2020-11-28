//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Patrick O'Neill on 9/2/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

// Stores each question's string data, properties for the current questionNumber and user score, and methods for evaluating user answers and progressing the quiz
struct QuizBrain {
    
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
        
    ]
    
    var questionNumber = 0
    var score = 0
    
    // Evaluates user's answer -> increases score and returns T if correct/ false if incorrect
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        
        if userAnswer == quiz[questionNumber].solution   {
            score += 1
            return true
            //user got answer correct
        } else {
            return false
            //user got answer incorrect
        }
    }
    
    // Progresses quiz to next question/ resets quiz if already on final question
    mutating func nextQuestion() {
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    
    // Methods for retrieving question text strings, progress, and score
    func getQuestionText() -> String  {
        return quiz[questionNumber].text
    }
    
    func getButtonText(index: Int) -> String  {
        return quiz[questionNumber].answer[index]
    }
    
    func getProgress() -> Float  {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    func getScore() -> Int  {
        return score
    }
    
    
}
