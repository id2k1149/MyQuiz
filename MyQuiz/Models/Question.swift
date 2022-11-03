//
//  Question.swift
//  MyQuiz
//
//  Created by Max Franz Immelmann on 10/31/22.
//

struct Question {
    let title: String
    let responseType: ResponseType
    let answers: [Answer]
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

extension Question {
    
    static func getQuestions() -> [Question] {
        // questions array
          [
            Question(
                title: "What food do you prefer?",
                responseType: .single,
                answers: [
                    Answer(title: "Steak", type: .dog),
                    Answer(title: "Fish", type: .cat),
                    Answer(title: "Carrot", type: .rabbit),
                    Answer(title: "Corn", type: .turtle)
                ]
            ),
            Question(
                title: "What do you like more?",
                responseType: .multiple,
                answers: [
                    Answer(title: "Swim", type: .dog),
                    Answer(title: "Sleep", type: .cat),
                    Answer(title: "Hug", type: .rabbit),
                    Answer(title: "Eat", type: .turtle)
                ]
            ),
            Question(
                title: "Do you like car trips?",
                responseType: .ranged,
                answers: [
                    Answer(title: "Hate", type: .cat),
                    Answer(title: "I'm nervous", type: .rabbit),
                    Answer(title: "Don't notice", type: .turtle),
                    Answer(title: "Love", type: .dog)
                ]
            ),
        ]
    }
}
