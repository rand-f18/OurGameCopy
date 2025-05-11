//
//  ActionCardViewModel.swift
//  Our_Game
//
//  Created by Fai Alharthi on 13/11/1446 AH.
//

import Foundation
import SwiftUI

class ActionCardViewModel: ObservableObject {
    // دالة لإنشاء كارد "Freeze"
    func createFreezeCard() -> ActionCardModel {
        return ActionCardModel(
            id: UUID(),
            description: "Freeze your opponent temporarily",
            icon: "wind.snow", // اسم الأيقونة
            name: "Freeze", // اسم الكارد
            color: Color(hex: "#07A5C3"),
            price: 20.0,
            coins: 0 // السعر
        )
    }
    
    
    // دالة لإنشاء كارد "Noise"
    func createNoiseCard() -> ActionCardModel {
        return ActionCardModel(
            id: UUID(),
            description: "Make a noise to distract your opponent",
            icon: "lightspectrum.horizontal", // اسم الأيقونة
            name: "Noise", // اسم الكارد
            color: Color(hex: "#F4B324"),
            price: 15.0,    // السعر
            coins: 0 // السعر

        )
    }
    
    
    func createAdd2Card() -> ActionCardModel {
        return ActionCardModel(
            id: UUID(),
            description: "Make a noise to distract your opponent",
            icon: "rectangle.portrait.on.rectangle.portrait.angled", // اسم الأيقونة
            name: "+2", // اسم الكارد
            color: Color(hex: "#2F6386"),
            price: 15.0,    // السعر
            coins: 0 // السعر

        )
    }
    
    
    
    func createPeekCard() -> ActionCardModel {
        return ActionCardModel(
            id: UUID(),
            description: "Make a noise to distract your opponent",
            icon: "eye", // اسم الأيقونة
            name: "Peek", // اسم الكارد
            color: .black,
            price: 15.0,   // السعر
            coins: 0 // السعر

        )
    }
    
    
    
    func createProtectionCard() -> ActionCardModel {
        return ActionCardModel(
            id: UUID(),
            description: "Make a noise to distract your opponent",
            icon: "shield", // اسم الأيقونة
            name: "Protection", // اسم الكارد
            color: Color(hex: "#F14902"),
            price: 15.0,  // السعر
            coins: 0 // السعر

        )
    }
    
    //--------------------------------------------------------------------------//
    
    func createFreezeCardPro() -> ActionCardModel {
        return ActionCardModel(
            id: UUID(),
            description: "Freeze your opponent temporarily",
            icon: "wind.snow", // اسم الأيقونة
            name: "Freeze", // اسم الكارد
            color: Color(hex: "#07A5C3"),   // اللون الأزرق
            price: 20.0,   // السعر
            coins: 0 // السعر

        )
    }
    
    
    // دالة لإنشاء كارد "Noise"
    func createNoiseCardPro() -> ActionCardModel {
        return ActionCardModel(
            id: UUID(),
            description: "Make a noise to distract your opponent",
            icon: "lightspectrum.horizontal", // اسم الأيقونة
            name: "Noise", // اسم الكارد
            color: Color(hex: "#F4B324"),
            price: 15.0,    // السعر
            coins: 0 // السعر

        )
    }
    
    
    func createAdd2CardPro() -> ActionCardModel {
        return ActionCardModel(
            id: UUID(),
            description: "Make a noise to distract your opponent",
            icon: "rectangle.portrait.on.rectangle.portrait.angled", // اسم الأيقونة
            name: "+2", // اسم الكارد
            color: Color(hex: "#2F6386"),
            price: 15.0,     // السعر
            coins: 0 // السعر

        )
    }
    
    
    
    func createProtectionCardPro() -> ActionCardModel {
        return ActionCardModel(
            id: UUID(),
            description: "Make a noise to distract your opponent",
            icon: "shield", // اسم الأيقونة
            name: "Protection", // اسم الكارد
            color: Color(hex: "#F14902"),
            price: 15.0,     // السعر
            coins: 0 // السعر

        )
    }
    
    
}
