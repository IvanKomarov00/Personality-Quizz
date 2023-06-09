//
//  QuestionViewController.swift
//  PersonalityQuizz
//
//  Created by Ivan Komarov on 19.03.2023.
//

import UIKit

class QuestionViewController: UIViewController {
    //list of questions
    var questions:[Question] = questionList
    
    var questionIndex:Int = 0
    var answersChosen:[Answer] = []
    
    //Single Stack
    @IBOutlet weak var singleStackView: UIStackView!
    
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    //Multiple Stack
    @IBOutlet weak var multipleStackView: UIStackView!
    
    @IBOutlet weak var multipleLabel1: UILabel!
    @IBOutlet weak var multipleLabel2: UILabel!
    @IBOutlet weak var multipleLabel3: UILabel!
    @IBOutlet weak var multipleLabel4: UILabel!
    
    @IBOutlet weak var multipleSwitch1: UISwitch!
    @IBOutlet weak var multipleSwitch2: UISwitch!
    @IBOutlet weak var multipleSwitch3: UISwitch!
    @IBOutlet weak var multipleSwitch4: UISwitch!
    
    //Ranged Stack
    @IBOutlet weak var rangedStackView: UIStackView!
    
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    
    @IBOutlet weak var rangedSlider: UISlider!
    
    //Question text
    @IBOutlet weak var questionLabel: UILabel!
    
    //Progress
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender{
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        //Set answers
        if multipleSwitch1.isOn{
            answersChosen.append(currentAnswers[0])
        }
        if multipleSwitch2.isOn{
            answersChosen.append(currentAnswers[1])
        }
        if multipleSwitch3.isOn{
            answersChosen.append(currentAnswers[2])
        }
        if multipleSwitch4.isOn{
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    
    
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    
    //update display for Question View controller
    func updateUI(){
        //hide all stack views
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        
        //Current question
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress:Float = Float(questionIndex) / Float(questions.count)
        
        //set title text
        navigationItem.title = "Question # \(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        
        switch currentQuestion.type{
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    //update Single question interface
    func updateSingleStack(using answers: [Answer]){
        singleStackView.isHidden = false
        
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
        
    }
    
    //update Multiple question interface
    func updateMultipleStack(using answers: [Answer]){
        
        multipleStackView.isHidden = false
        
        multipleSwitch1.isOn = false
        multipleSwitch2.isOn = false
        multipleSwitch3.isOn = false
        multipleSwitch4.isOn = false
        
        multipleLabel1.text = answers[0].text
        multipleLabel2.text = answers[1].text
        multipleLabel3.text = answers[2].text
        multipleLabel4.text = answers[3].text
    }
    
    //update Range question interface
    func updateRangedStack(using answers: [Answer]){
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultViewController? {
        return ResultViewController(coder: coder, responses: answersChosen)
    }
    
    //Move to nex quesrion
    func nextQuestion(){
        questionIndex += 1
        
        if questionIndex < questions.count{
            updateUI()
        }else{
            performSegue(withIdentifier: "Results", sender: nil)
        }
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
