//
//  ViewController.swift
//  MyQuiz
//
//  Created by Max Franz Immelmann on 10/30/22.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    
    @IBOutlet var questionProgressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedSlider: UISlider!
    @IBOutlet var rangesLabels: [UILabel]!
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    @IBAction func singleAnswerButtonTapped(_ sender: UIButton) {
    }
    @IBAction func multipleAnswerButtonTapped() {
    }
    @IBAction func rangedAnswerButtonTapped() {
    }
    
    // memory check
    deinit {
        print("QuestionsViewController has been deallocated")
    }
}

// MARK: - Private Methods
extension QuestionsViewController {
    
    private func updateUI() {
        // hide stacks
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        // get current question
        let currentQuestion = questions[questionIndex]
        
        // set current question for question label
        questionLabel.text = currentQuestion.title
        
        // calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // set progress for questionProgressView
        questionProgressView.setProgress(totalProgress, animated: true)
        
        // set navigation title
        title = "Question #\(questionIndex + 1) of \(questions.count)"
        
        
    }
}

