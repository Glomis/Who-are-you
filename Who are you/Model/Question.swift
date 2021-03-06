//
//  Question.swift
//  Who are you
//
//  Created by Tatyana on 09.05.2020.
//  Copyright © 2020 Max&Co. All rights reserved.
//

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
    
}

extension Question{
    static func getQuestion() -> [Question] {
        
        return [
            Question(text: "Какую пищу вы предпочитаете?",
                     type: .single,
                     answers: [
                        Answer(text: "Стейк", type: .dog),
                        Answer(text: "Рыба", type: .cat),
                        Answer(text: "Овощи", type: .rabbit),
                        Answer(text: "Фрукты", type: .turtle)
                ]
            ), Question(text: "Что вам нравится больше?",
                        type: .multiple,
                        answers: [
                            Answer(text: "Плавать", type: .dog),
                            Answer(text: "Спать", type: .cat),
                            Answer(text: "Обниматься", type: .rabbit),
                            Answer(text: "Есть", type: .turtle)
                ]
            ), Question(text: "Любите ли вы поездки на машине?",
                        type: .ranged,
                        answers: [
                            Answer(text: "Ненавижу", type: .cat),
                            Answer(text: "Нервничаю", type: .rabbit),
                            Answer(text: "Не замечаю", type: .turtle),
                            Answer(text: "Обожаю", type: .dog)
                ]
            )
        ]
    }
}

