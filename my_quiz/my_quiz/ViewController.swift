//
//  ViewController.swift
//  my_quiz
//
//  Created by conley on 11/20/24.
//

import UIKit

class ViewController: UIViewController {
//    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var answerLabel: UILabel!
    let questions: [String] = [
        "From what is cognac made?",
        "What is 7+7?",
        "What is the capital of Vermont?"
    ]
    
    let answers: [String] = [
        "Montpelier",
        "14",
        "Grapes"
    ]
    
    var currentQuestionIndex: Int = 0
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question: String = questions[currentQuestionIndex]
//        questionLabel.text = question
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransition()
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        questionLabel.text = questions[currentQuestionIndex]
        currentQuestionLabel.text = questions[currentQuestionIndex]
        updateOffScreenLabel()
    }
    
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
    
    func animateLabelTransition() {
//        let animationClosure = { () -> Void in
//            self.questionLabel.alpha = 1
//        }
//        // 对透明度制作动画
//        UIView.animate(withDuration: 0.5, animations: animationClosure)

        // 强制更新布局
        view.layoutIfNeeded()
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [.curveLinear],
            animations: {
//            self.questionLabel.alpha = 1
                self.currentQuestionLabel.alpha = 0
                self.nextQuestionLabel.alpha = 1
                
                self.view.layoutIfNeeded()
            },
            completion: { _ in
                swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                
                self.updateOffScreenLabel()
            }
        )
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 设置标签的初始透明度
//        questionLabel.alpha = 0
        nextQuestionLabel.alpha = 0
    }
    
}

