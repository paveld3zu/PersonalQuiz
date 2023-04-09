//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var iconLabel: UILabel!
    @IBOutlet var yourResultLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func calculateResult() {
        var animals: [Animal: Int] = [:]
        var answers: [Animal] = []
        
        for answerChosen in answersChosen {
            answers.append(answerChosen.animal)
        }
        
        for answer in answers {
            if let count = animals[answer] {
                animals[answer] = count + 1
            } else {
                animals[answer] = 1
            }
        }
        
        var greaterValue: Animal!
        var maxCount = 1
        for (answer, count) in animals {
            if count > maxCount {
                maxCount = count
                greaterValue = answer
            }
        }
        
        iconLabel.text = "Вы - \(greaterValue.rawValue)"
        yourResultLabel.text = greaterValue.definition
    }
}

