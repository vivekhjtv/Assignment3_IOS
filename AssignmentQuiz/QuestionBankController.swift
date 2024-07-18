//
//  QuestionBankController.swift
//  AssignmentQuiz
//
//  Created by Vivek Jethva on 2024-07-18.
//

import UIKit

class QuestionBankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func addQuestionTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "addQuestion", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestionManager.shared.questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath)
        cell.textLabel?.text = QuestionManager.shared.questions[indexPath.row].question
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           performSegue(withIdentifier: "editQuestion", sender: indexPath.row)
       }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addQuestion" {
            if let destination = segue.destination as? QuestionController {
                destination.delegate = self
            }
            
        }
        else if segue.identifier == "editQuestion" {
            if let destination = segue.destination as? EditQuestionViewController,
               let index = sender as? Int {
                destination.delegate = self
                destination.question = QuestionManager.shared.questions[index]
                destination.questionIndex = index
            }
            
        }
    }
}

extension QuestionBankViewController: QuestionDelegate {
    func didSaveQuestion(question: Questions) {
        QuestionManager.shared.addQuestion(question)
//        print("\(question)")
//        questions.append(question)
        tableView.reloadData()
    }
    func didUpdateQuestion(question: Questions, at index: Int) {
        QuestionManager.shared.questions[index] = question
            tableView.reloadData()
        }
}

