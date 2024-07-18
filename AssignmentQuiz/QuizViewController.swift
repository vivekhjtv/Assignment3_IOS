//
//  QuizViewController.swift
//  AssignmentQuiz
//
//  Created by Vivek Jethva on 2024-07-18.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet var answerButtons: [UIButton]!
    
   
    
    var answers = [String]()
    var currentQuestionIndex = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadNextQuestion()
    }
    
    func loadNextQuestion() {
        if currentQuestionIndex < QuestionManager.shared.questions.count {
            let currentQuestion = QuestionManager.shared.questions[currentQuestionIndex]
            questionLabel.text = currentQuestion.question
            
            answers.append(currentQuestion.answer2)
            answers.append(currentQuestion.answer3)
            answers.append(currentQuestion.answer4)
            answers.append(currentQuestion.correctAnswer)
            answers.shuffle()
            
            for (index, button) in answerButtons.enumerated() {
                button.setTitle(answers[index], for: .normal)
            }
            
            progressView.progress = Float(currentQuestionIndex) / Float(QuestionManager.shared.questions.count)
        } else {
            // Show results
            performSegue(withIdentifier: "showResults", sender: self)
        }
    }
    
    @IBAction func answerTapped(_ sender: UIButton) {
        guard let answer = sender.titleLabel?.text else { return }
        
        let currentQuestion = QuestionManager.shared.questions[currentQuestionIndex]
        if answer == currentQuestion.correctAnswer {
            score += 1
        }
        
        currentQuestionIndex += 1
        loadNextQuestion()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showResults" {
                if let destination = segue.destination as? ResultViewController {
                    destination.score = score
                    destination.totalQuestions = QuestionManager.shared.questions.count
                }
            }
        }
}

