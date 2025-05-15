import Foundation
import PencilKit
import GameKit
import SwiftUI


enum PlayerAuthState11: String {
    case authenticating = "جاري تسجيل الدخول..."
    case unauthenticated = "غير مسجل دخول"
    case authenticated = "✅ تم تسجيل الدخول"
    case error = "❌ فشل تسجيل الدخول"
    case restricted = "🚫 الوصول ممنوع"
}
class MatchManager:NSObject, ObservableObject {
    @Published var inGame = false
    @Published var isGameOver = false
    @Published var authenticationState = PlayerAuthState.authenticating

    @Published var currentlyDrawing = false
    @Published var drawPrompt = ""
    @Published var pastGuesses = [PastGuess]()

    @Published var score = 0
    @Published var remainingTime = maxTimeRemaining
    @Published var lastReceivedData = PKDrawing()
    @Published var isTimeKeeper = false
    
    var match: GKMatch?
    var otherPlayer: GKPlayer?
    var localPlayer = GKLocalPlayer.local

    var playerUUIDKey = UUID().uuidString

    var rootViewController: UIViewController? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return windowScene?.windows.first?.rootViewController
    }

    func authenticateUser() {
        GKLocalPlayer.local.authenticateHandler = { [self] vc, e in
            if let viewController = vc {
                rootViewController?.present(viewController, animated: true)
                return
            }

            if let error = e {
                authenticationState = .error
                print(error.localizedDescription)
                return
            }

            if localPlayer.isAuthenticated {
                if localPlayer.isMultiplayerGamingRestricted {
                    authenticationState = .restricted
                } else {
                    authenticationState = .authenticated
                }
            } else {
                authenticationState = .unauthenticated
            }
        }
    }

    func startMatchmaking() {
        let request = GKMatchRequest()
        request.minPlayers = 2
        request.maxPlayers = 4

        let matchmakingVC = GKMatchmakerViewController(matchRequest: request)
        matchmakingVC?.matchmakerDelegate = self

        rootViewController?.present(matchmakingVC!, animated: true)
    }

    func startGame(newMatch: GKMatch) {
        match = newMatch
        match?.delegate = self
        otherPlayer = match?.players.first
       // drawPrompt = everydayObjects.randomElement()!

        sendString("began:\(playerUUIDKey)")
    }
    
    func receivedString(_ message: String) {
        let messageSplit = message.split(separator: ":")
        guard let messagePrefix = messageSplit.first else { return }

        let parameter = String(messageSplit.last ?? "")

        switch messagePrefix {
        case "began":
            if playerUUIDKey == parameter {
                playerUUIDKey = UUID().uuidString
                sendString("began:\(playerUUIDKey)")
                break
            }
            currentlyDrawing = playerUUIDKey < parameter
            inGame = true
            isTimeKeeper = true
            if isTimeKeeper {
                countDownTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                
                
            }
        default:
            break
        }
    }
}


//    .onReceive(countdownTimer) { _ in
//        guard matchManager.isTimeKeeper else { return }
//        matchManager.remainingTime -= 1
//    }
