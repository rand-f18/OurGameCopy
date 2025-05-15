import SwiftUI
import GameKit

struct ContentView: View {
    @StateObject var matchManager = MatchManager()

    var body: some View {
        ZStack {
            if matchManager.isGameOver {
                WinnerView(matchmanager: matchManager)
            } else if matchManager.inGame {
                GameRoom(matchManager: matchManager)
            } else {
                DashboardView(matchManager: matchManager)
            }
        }
        .onAppear {
            print("🟢 onAppear triggered")
            matchManager.authenticateUser()
         }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

