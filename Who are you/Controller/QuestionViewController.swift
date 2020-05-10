//
//  QuestionController.swift
//  Who are you
//
//  Created by Tatyana on 08.05.2020.
//  Copyright © 2020 Max&Co. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var progressLine: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStack: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multipleStack: UIStackView!
    @IBOutlet weak var multipleButton: UIButton!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwiches: [UISwitch]!
    
    @IBOutlet weak var rangedStack: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider!
    
    // MARK: - Private Properties
    private let questions = Question.getQuestion()
    private var questionIndex = 0
    private var choosenAnswers: [Answer] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    
    
    //MARK: - IB Actions
    @IBAction func singleQuestionBtnPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
        
        let currentAnswer = currentAnswers[currentIndex]
        
        choosenAnswers.append(currentAnswer)
        nextQuestion()
    }
    
    
    @IBAction func multipleQuestionBtnPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        for (multipleSwich, answer) in zip(multipleSwiches, currentAnswers) {
            if multipleSwich.isOn {
                choosenAnswers.append(answer)
            }
        }
        nextQuestion()
    }
    
    
    @IBAction func rangedQuestionBtnPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        choosenAnswers.append(currentAnswers[index])
        nextQuestion()
    }
    
    
    // MARK: - Private Metods
    private func updateUI() {
        // Hide elements
        multipleButton.isHidden = true
        
        for stack in [singleStack, multipleStack, rangedStack] {
            stack?.isHidden = true
        }
        // Set current question for question text
        let currentQuestion = questions[questionIndex]
        questionLabel.text = currentQuestion.text
        
        // Calculate progress for ProgressView
        let totalProgress = Float(questionIndex) / Float(questions.count)
        progressLine.setProgress(totalProgress, animated: true)
        
        // Set navigation tittle text
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        let currentAnswers = currentQuestion.answers
        
        switch currentQuestion.type {
        case .single:
            updateSingleStackView(answers: currentAnswers)
        case .multiple:
            updateMultipleStackView(answers: currentAnswers)
        case .ranged:
            updateRangedStackView(answers: currentAnswers)
        }
    }
    
    private func updateSingleStackView(answers: [Answer]) {
        singleStack.isHidden = false
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func updateMultipleStackView(answers: [Answer]) {
        multipleStack.isHidden = false
        multipleButton.isHidden = false
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func updateRangedStackView(answers: [Answer]) {
        rangedStack.isHidden = false
        
        rangedLabels.first?.text = "Ненавижу"
        rangedLabels.last?.text = "Обожаю"
    }
    
    // MARK: - Navigation
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultSegue" else { return }
        let resultVC = segue.destination as! ResultsViewController
        resultVC.responses = choosenAnswers
    }
}
