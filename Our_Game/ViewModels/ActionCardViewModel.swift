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
            color: .cyan,   // اللون الأزرق
            price: 20.0      // السعر
        )
    }
    
    
    // دالة لإنشاء كارد "Noise"
    func createNoiseCard() -> ActionCardModel {
        return ActionCardModel(
            id: UUID(),
            description: "Make a noise to distract your opponent",
            icon: "lightspectrum.horizontal", // اسم الأيقونة
            name: "Noise", // اسم الكارد
            color: .yellow,
            price: 15.0      // السعر
        )
    }
}
