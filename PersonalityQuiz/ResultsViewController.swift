//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Fabiola Saga on 3/1/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
    var responses: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        
        let responseTypes = responses.map { $0.type }
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: { (pair1, pair2) -> Bool in return pair1.value > pair2.value})
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
