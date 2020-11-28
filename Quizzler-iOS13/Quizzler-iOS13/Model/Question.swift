//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Patrick O'Neill on 8/31/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation


// Template for storing a question's text, an array of answers, and the correct solution
struct Question {
    let text: String
    let answer: [String]
    let solution: String
    
    init(q: String, a: [String], correctAnswer: String)  {
        text = q
        answer = a
        solution = correctAnswer
        
    }
}
