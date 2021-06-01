//
//  ResultViewController.swift
//  Personal Quiz
//
//  Created by Дарья Яровая on 31.05.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
    var answers: [Answer] = []
    
    private var answersDictionary: [AnimalType: Int] = [:]
    private var maxCountOfAnswers = 0
    var result: String = ""
    var resultDescription: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        calculateResults()
    }
    
    private func calculateResults() {
        for answer in answers {
            if answersDictionary[answer.type] == nil {
                answersDictionary[answer.type] = 1
            } else {
                answersDictionary[answer.type] = answersDictionary[answer.type]! + 1
            }
        }
        
        for (key, value) in answersDictionary {
            if maxCountOfAnswers < value {
                maxCountOfAnswers = value
                result = "Вы - \(key.rawValue)"
                resultDescription = key.definition
            } else if maxCountOfAnswers == value {
                result = "Упс"
                resultDescription = "Мы не смогли определиться"
            }
        }
        
        updateUI(result: result, description: resultDescription)
    }
    
    private func updateUI(result: String, description: String) {
        resultLabel.text = result
        resultDescriptionLabel.text = description
    }
}
