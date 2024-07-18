//
//  Questions.swift
//  AssignmentQuiz
//
//  Created by Vivek Jethva on 2024-07-18.
//

import Foundation
struct Questions {
    var question: String
    var correctAnswer: String
    var answer2: String
    var answer3:String
    var answer4:String
    
//    init(question: String, correctAnswer: String, answer2: String,answer3:String,answer4:String) {
//        self.question = question
//        self.correctAnswer = correctAnswer
//        self.answer2 = answer2
//        self.answer3 = answer3
//        self.answer4 = answer4
//    }
}

class QuestionManager {
    static let shared = QuestionManager()
    var questions: [Questions] = []

    private init() {
        // Add initial products for testing purposes
        
    }

    func addQuestion(_ question: Questions) {
        questions.append(question)
    }

    func updateQuestion(_ question: Questions, Newquestion: String) {
        if let index = questions.firstIndex(where: { $0.question == question.question }) {
            questions[index].question = Newquestion
        }
    }
}
