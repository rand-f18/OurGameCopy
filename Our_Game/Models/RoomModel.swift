//
//  RoomModel.swift
//  Our_Game
//
//  Created by Fai Alharthi on 09/11/1446 AH.
//

import Foundation

struct RoomModel: Identifiable {
    var id: Int
    var theme: String
    var Host:Bool
    var playerID: [PlayerModel]
}
