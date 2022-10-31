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
