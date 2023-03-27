//
//  ResultViewController.swift
//  PersonalityQuizz
//
//  Created by Ivan Komarov on 19.03.2023.
//

import UIKit

class ResultViewController: UIViewController {

    var responses: [Answer]
    var resultDictionary = [String : Int]()
    
    init?(coder: NSCoder, responses: [Answer]){
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDifinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
    }
    
    //Define personality
    func calculatePersonalityResult(){
        //creating a dictionary Counts from responses array
        let frequencyOfAnswers = responses.reduce(into: [:]){
            (counts, answer) in counts[answer.type, default: 0] += 1
        }
        //sorsting the dictionary to have an sorted descending array
        let frequencyOfAnswersSorted = frequencyOfAnswers.sorted(by:{(pair1, pair2) in
            return pair1.value > pair2.value
        })
        
        //take the most frequent answer
        let mostCommonAnswer = frequencyOfAnswersSorted.first!.key
        
        //Text of labels change
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDifinitionLabel.text = mostCommonAnswer.difinition
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
