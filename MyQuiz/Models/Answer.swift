//
//  Answer.swift
//  MyQuiz
//
//  Created by Max Franz Immelmann on 10/31/22.
//

struct Answer {
    let title: String
    let type: AnimalType
}

enum AnimalType: Character, CaseIterable {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "You like being with friends. You surround yourself with people who you will run into and are always ready to help."
        case .cat:
            return "You are on your mind. Love to walk on your own. Do you appreciate being alone?"
        case .rabbit:
            return "You like everything soft. You are healthy and full of energy"
        case .turtle:
            return "Your strength is in wisdom. Slow and thoughtful wins over long distances"
        }
    }
}
