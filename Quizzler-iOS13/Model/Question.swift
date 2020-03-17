//
//  Question.swift
//  Quizz-iOS13
//
//  Created by Huseyin Can Dayan on 4.01.2020.
//  Copyright © 2020 Active Sludge. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], c: String) {
        text = q
        answer = a
        correctAnswer = c
    }
}
