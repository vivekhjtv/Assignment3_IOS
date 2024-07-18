//
//  EditQuestionViewController.swift
//  AssignmentQuiz
//
//  Created by Vivek Jethva on 2024-07-18.
//

import UIKit

class EditQuestionViewController: UIViewController {
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var correctAnswerTextField: UITextField!
    @IBOutlet weak var incorrectAnswer1TextField: UITextField!
    @IBOutlet weak var incorrectAnswer2TextField: UITextField!
    @IBOutlet weak var incorrectAnswer3TextField: UITextField!
    
    weak var delegate: QuestionDelegate?
    var question: Questions?
    var questionIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let question = question {
            questionTextField.text = question.question
            correctAnswerTextField.text = question.correctAnswer
                incorrectAnswer1TextField.text = question.answer2
                incorrectAnswer2TextField.text = question.answer3
                incorrectAnswer3TextField.text = question.answer4
            
        }
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        guard let questionText = questionTextField.text, !questionText.isEmpty,
              let correctAnswer = correctAnswerTextField.text, !correctAnswer.isEmpty,
              let incorrectAnswer1 = incorrectAnswer1TextField.text, !incorrectAnswer1.isEmpty,
              let incorrectAnswer2 = incorrectAnswer2TextField.text, !incorrectAnswer2.isEmpty,
              let incorrectAnswer3 = incorrectAnswer3TextField.text, !incorrectAnswer3.isEmpty else {
            // Show an alert for incomplete fields
            return
        }
        
        let updatedQuestion = Questions(
            question: questionText, correctAnswer: correctAnswer, answer2: incorrectAnswer1, answer3: incorrectAnswer2, answer4: incorrectAnswer3
           
        )
        
        if let index = questionIndex {
            delegate?.didUpdateQuestion(question: updatedQuestion, at: index)
        }
        
        navigationController?.popViewController(animated: true)
    }
   
}

