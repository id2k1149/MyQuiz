//
//  Question.swift
//  MyQuiz
//
//  Created by Max Franz Immelmann on 10/31/22.
//

struct Question {
    let title: String
    let type: ResponseType
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
                type: .single,
                answers: [
                    Answer(title: "Steak", type: .dog),
                    Answer(title: "Fish", type: .cat),
                    Answer(title: "Carrot", type: .rabbit),
                    Answer(title: "Corn", type: .frog)
                ]
            ),
            Question(
                title: "What do you like more?",
                type: .multiple,
                answers: [
                    Answer(title: "Swim", type: .dog),
                    Answer(title: "Sleep", type: .cat),
                    Answer(title: "Hug", type: .rabbit),
                    Answer(title: "Eat", type: .frog)
                ]
            ),
            Question(
                title: "Do you like car trips?",
                type: .ranged,
                answers: [
                    Answer(title: "Hate", type: .cat),
                    Answer(title: "I'm nervous", type: .rabbit),
                    Answer(title: "Don't notice", type: .frog),
                    Answer(title: "Love", type: .dog)
                ]
            ),
        ]
    }
}
