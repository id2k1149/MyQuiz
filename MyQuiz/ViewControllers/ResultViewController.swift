//
//  ResultViewController.swift
//  MyQuiz
//
//  Created by Max Franz Immelmann on 11/2/22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        calculateResult(from: answers)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        // option 1
//        view.window?.rootViewController?.dismiss(animated: true)
        
        // option 2
        navigationController?.dismiss(animated: true)
    }
    
    // memory check
    deinit {
        print("ResultViewController has been deallocated")
    }
}

// MARK: - Private Methods
extension ResultViewController {
    
    private func calculateResult(from answers: [Answer]) {
        print(answers)
        var resultCount = 0
        var resultType = answers[0].type
        
        AnimalType.allCases.forEach() {
            let each = $0
            
            let answerTypes = answers.filter { answer in
                answer.type == each
            }
            
            if answerTypes.count > resultCount {
                resultCount = answerTypes.count
                resultType = each
            }
        }
        
        updateUI(with: resultType)
    }
    
    private func updateUI(with resultType: AnimalType) {
        resultLabel.text = "You are - \(resultType.rawValue)"
        infoLabel.text = resultType.definition
    }
}
