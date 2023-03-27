//
//  Question.swift
//  PersonalityQuizz
//
//  Created by Ivan Komarov on 19.03.2023.
//

import Foundation

//Question structure
struct Question{
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

//Question types
enum ResponseType{
    case single, multiple, ranged
}
struct Answer{
    var text: String
    var type: AnimalType
}

//Anymal types
enum AnimalType: Character{
    case dog = "🐶", cat = "😺", turtle = "🐢", rabbit = "🐰"
    
    var difinition: String{
        switch self{
        case .dog:
            return "You are very active person with good appetite. Also you should have a lot of friends!)"
        case .cat:
            return "You are probably an introvert and it is more comfortable to work alone, but your work perfonmance is insane!"
        case .turtle:
            return "You are not a fast learner or sprinter, but all the info you obtain are better assimilated!"
        case .rabbit:
            return "You are fast learner and usually do tasks much faster then other can!)"
        }
    }
}

//Questions in quiz
var questionList = [
    Question(
        text: "Which food do you like the most?",
        type: .single,
        answers: [
            Answer(text: "Steak", type: .dog),
            Answer(text: "Fish", type: .cat),
            Answer(text: "Carrot", type: .rabbit),
            Answer(text: "Corn", type: .turtle)
        ]
    ),
    Question(
        text: "Which activities do you enjoy?",
        type: .multiple,
        answers: [
            Answer(text: "Swimming", type: .turtle),
            Answer(text: "Sleepping", type: .cat),
            Answer(text: "Cuddling", type: .rabbit),
            Answer(text: "Eating", type: .dog)
        ]
    ),
    Question(
        text: "How much do you enjoy car rides?",
        type: .ranged,
        answers: [
            Answer(text: "I dislike them", type: .cat),
            Answer(text: "I get a little nervous", type: .rabbit),
            Answer(text: "I barely notice them", type: .turtle),
            Answer(text: "I like them", type: .dog)
        ]
    ),
    Question(
        text: "Which food do you like the most?",
        type: .single,
        answers: [
            Answer(text: "Steak", type: .dog),
            Answer(text: "Fish", type: .cat),
            Answer(text: "Carrot", type: .rabbit),
            Answer(text: "Corn", type: .turtle)
        ]
    ),
    Question(
        text: "Which activities do you enjoy?",
        type: .multiple,
        answers: [
            Answer(text: "Swimming", type: .turtle),
            Answer(text: "Sleepping", type: .cat),
            Answer(text: "Cuddling", type: .rabbit),
            Answer(text: "Eating", type: .dog)
        ]
    ),
    Question(
        text: "How much do you enjoy car rides?",
        type: .ranged,
        answers: [
            Answer(text: "I dislike them", type: .cat),
            Answer(text: "I get a little nervous", type: .rabbit),
            Answer(text: "I barely notice them", type: .turtle),
            Answer(text: "I like them", type: .dog)
        ]
    )
    ]
