//
//  AnimalType.swift
//  Who are you
//
//  Created by Tatyana on 09.05.2020.
//  Copyright © 2020 Max&Co. All rights reserved.
//

enum AnimalType: String {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var difinition: String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь."
        case .cat:
            return "Вы себе на уме. Любите гулять сами по себе. Умеете ценить одиночество."
        case .rabbit:
            return "Вам нравится мягкость и комфорт. Вы здоровы и полны энергии. "
        case .turtle:
            return "Ваша сила - мудрость. Медленный и вдумчивый выигрывает на дальних дистанциях."
        }
    }
}
