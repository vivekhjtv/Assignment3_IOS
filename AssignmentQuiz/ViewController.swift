//
//  ViewController.swift
//  AssignmentQuiz
//
//  Created by Vivek Jethva on 2024-07-18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func buildQuestionBankTapped(_ sender: UIButton) {
           performSegue(withIdentifier: "showQuestionBank", sender: self)
       }
       
       @IBAction func startQuizTapped(_ sender: UIButton) {
           performSegue(withIdentifier: "showQuiz", sender: self)
       }

}

