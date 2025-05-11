//
//  ActionCardModel.swift
//  Our_Game
//
//  Created by Fai Alharthi on 09/11/1446 AH.
//

import Foundation
import SwiftUI

struct ActionCardModel: Identifiable {
    var id: UUID
    var description: String
    var icon: String
    var name: String
    var color: Color
    var price: Double
    var coins: Double
}

