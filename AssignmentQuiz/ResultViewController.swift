//
//  ResultViewController.swift
//  AssignmentQuiz
//
//  Created by Vivek Jethva on 2024-07-18.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score: Int = 0
    var totalQuestions: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "You scored \(score) out of \(totalQuestions)"
    }
    
    @IBAction func homeButton(_ sender: UIButton) {
        performSegue(withIdentifier: "showHome", sender: self)
    }
    
}
