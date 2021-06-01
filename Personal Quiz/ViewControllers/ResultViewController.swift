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
    
    private var dogAnswer = 0
    private var catAnswer = 0
    private var rabbitAnswer = 0
    private var turpleAnswer = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        for answer in answers {
            switch answer.type {
            case .dog:
                dogAnswer += 1
            case .cat:
                catAnswer += 1
            case .rabbit:
                rabbitAnswer += 1
            case .turtle:
                turpleAnswer += 1
            }
        }
        if dogAnswer > catAnswer && dogAnswer > rabbitAnswer && dogAnswer > turpleAnswer {
            resultLabel.text = "Вы - \(AnimalType.dog.rawValue)"
            resultDescriptionLabel.text = AnimalType.dog.definition
        } else if catAnswer > dogAnswer && catAnswer > rabbitAnswer && catAnswer > turpleAnswer {
            resultLabel.text = "Вы - \(AnimalType.cat.rawValue)"
            resultDescriptionLabel.text = AnimalType.cat.definition
        } else if rabbitAnswer > dogAnswer && rabbitAnswer > catAnswer && rabbitAnswer > turpleAnswer {
            resultLabel.text = "Вы - \(AnimalType.rabbit.rawValue)"
            resultDescriptionLabel.text = AnimalType.rabbit.definition
        } else if turpleAnswer > dogAnswer && turpleAnswer > catAnswer && turpleAnswer > rabbitAnswer {
            resultLabel.text = "Вы - \(AnimalType.turtle.rawValue)"
            resultDescriptionLabel.text = AnimalType.turtle.definition
        } else {
            resultLabel.text = "Упс"
            resultDescriptionLabel.text = "Мы не смогли определиться 😓"
        }
    }
}
