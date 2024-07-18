//
//  QuestionController.swift
//  AssignmentQuiz
//
//  Created by Vivek Jethva on 2024-07-18.
//

import UIKit

class QuestionController: UIViewController {
    
    weak var delegate: QuestionDelegate?
    
    @IBOutlet weak var questionTextField: UITextField!
    
    
    @IBOutlet weak var correctAnswerTextField: UITextField!
    @IBOutlet weak var incorrectAnswer1TextField: UITextField!
    @IBOutlet weak var incorrectAnswer2TextField: UITextField!
    @IBOutlet weak var incorrectAnswer3TextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    @IBAction func doneButtonClicked(_ sender: UIButton) {
        guard let questionText = questionTextField.text, !questionText.isEmpty,
              let correctAnswer = correctAnswerTextField.text, !correctAnswer.isEmpty,
              let incorrectAnswer1 = incorrectAnswer1TextField.text, !incorrectAnswer1.isEmpty,
              let incorrectAnswer2 = incorrectAnswer2TextField.text, !incorrectAnswer2.isEmpty,
              let incorrectAnswer3 = incorrectAnswer3TextField.text, !incorrectAnswer3.isEmpty else {
            
            let alert = UIAlertController(title: "Incomplete Fields", message: "Please fill in all fields before saving.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        
        let newQuestion = Questions(question: questionText, correctAnswer: correctAnswer, answer2: incorrectAnswer1, answer3: incorrectAnswer2, answer4: incorrectAnswer3)
        
            delegate?.didSaveQuestion(question: newQuestion)
               navigationController?.popViewController(animated: true)
        
        
    }
    
}

