//
//  ViewController.swift
//  MyQuiz
//
//  Created by Max Franz Immelmann on 10/30/22.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    // MARK: @IBOutlet
    @IBOutlet var questionProgressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    // set slider range
    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            rangedSlider.maximumValue = answerCount
            // slider position
            rangedSlider.value = answerCount / 2
        }
    }
    
    @IBOutlet var rangesLabels: [UILabel]!
    
    // MARK: private
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    private var answersChoosen: [Answer] = []
    
    // MARK: override func
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultViewController = segue.destination as? ResultViewController else { return }
        
        resultViewController.answers = answersChoosen
    }
    
    // MARK: @IBAction func
    @IBAction func singleAnswerButtonTapped(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
        let answer = currentAnswers[buttonIndex]
        answersChoosen.append(answer)
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonTapped() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChoosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonTapped() {
        // int value of rangedSlider.value instead of round
        let index = lrintf(rangedSlider.value)
        answersChoosen.append(currentAnswers[index])
        nextQuestion()
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
        
        // show current answers
        showCurrentAnswers(for: currentQuestion.responseType)
        
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single: showSingleStackView(with: currentAnswers)
        case .multiple: showMultipleStackView(with: currentAnswers)
        case .ranged: showRangedStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        // zip - A sequence of pairs built out of two underlying sequences.
        // Creates a sequence of pairs built out of two underlying sequences.
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for eachSwitch in multipleSwitches {
            eachSwitch.isOn = false
        }
        
        // zip - A sequence of pairs built out of two underlying sequences.
        // Creates a sequence of pairs built out of two underlying sequences.
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    
    private func showRangedStackView(with answers: [Answer]) {
        rangedStackView.isHidden = false
        
        rangesLabels.first?.text = answers.first?.title
        rangesLabels.last?.text = answers.last?.title
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        
        performSegue(withIdentifier: "showResult", sender: nil)
    }
    
}

