//
//  PlayerModel.swift
//  Our_Game
//
//  Created by Fai Alharthi on 09/11/1446 AH.
//

import Foundation
import SwiftUI

struct PlayerModel:Identifiable{
    var id:UUID
    var Nickname:String
    var score:Int
    var rank:Int
    var color:Color
    var myCards:[ActionCardModel]
    var shabohi: Int
}
