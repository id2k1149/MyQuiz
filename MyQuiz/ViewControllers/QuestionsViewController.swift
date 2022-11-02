//
//  ViewController.swift
//  MyQuiz
//
//  Created by Max Franz Immelmann on 10/30/22.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedSlider: UISlider!
    @IBOutlet var rangesLabels: [UILabel]!
    
    private let questions = Question.getQuestions()

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
        
    }
}

