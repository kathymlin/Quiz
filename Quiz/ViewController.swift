//
//  ViewController.swift
//  Quiz
//
//  Created by Kathy Lin on 4/1/17.
//  Copyright © 2017 Kathy Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // outlets are a reference to an object.
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    // arrays are delcared using let
    // a constant is denoted with let
    
    let questions: [String] = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is cognac made from?"
    ]
    
    let answers: [String] = [
        "14",
        "Montpelier",
        "Grapes"
    ]
    
    // variables are declared with var, their values are allowed to change
    var currentQuestionIndex: Int = 0;
    
    // an action method. when a UIButton is tapped, it calls a method on another object (the "target")
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        
        // if we are at the last question, go back to the beginning
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0;
        }
        
        let question: String = questions[currentQuestionIndex];
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    // overriding a method
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
}

