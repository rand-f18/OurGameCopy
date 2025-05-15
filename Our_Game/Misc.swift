import Foundation
enum PlayerAuthState: String {
    case authenticating = "Logging in to Game Center..."
    case unauthenticated = "Please sign in to Game Center to play."
    case authenticated = ""
    
    case error = "There was an error logging into Game Center."
    case restricted = "You're not allowed to play multiplayer games!"
}

struct PastGuess: Identifiable {
    let id = UUID()
    var message: String
    var correct: Bool
}

let maxTimeRemaining = 100
