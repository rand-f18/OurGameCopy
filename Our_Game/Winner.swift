// Winner

import SwiftUI

struct WinnerView: View {
    struct Player: Identifiable {
        let id = UUID()
        let name: String
        let score: Int
        let rank: Int
    }

    let players: [Player] = [
        Player(name: "Fai Ali", score: 250, rank: 1),
        Player(name: "Saad", score: 63, rank: 2),
        Player(name: "Danah", score: 32, rank: 3),
        Player(name: "نورة", score: 0, rank: 4)
    ]

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color(hex: "07A5C3"), Color(hex: "2F6386")]), center: .center, startRadius: 100, endRadius: 470)
                .ignoresSafeArea()

            VStack(spacing: 24) {
                Text("مبروك")
                    .font(.system(size: 60))
                    .foregroundColor(Color(hex: "FFD500"))
                    .padding(.top, 20)

                if let winner = players.first(where: { $0.rank == 1 }) {
                    VStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .background(Circle().fill(Color(hex: "F4B324")))
                                .frame(width: 100, height: 100)

                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 65, height: 65)
                                .foregroundColor(.white)

                            Image(systemName: "crown.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color(hex: "FFD500"))
                                .offset(y: -65)
                        }
                        .padding(.top, 30)

                        Text(winner.name)
                            .foregroundColor(.white)
                            .font(.title2)

                        HStack(spacing: 8) {
                            Image("coins")
                            Text("\(winner.score)")
                                .foregroundColor(Color(hex: "FFD500"))
                                .bold()
                            Image("Group2")
                                .resizable()
                                .frame(width: 20, height: 20)
                            VStack(spacing: 0) {
                                Text("Freeze")
                                    .foregroundColor(Color(hex: "07A5C3"))
                                    .font(.caption2)
                                Text("Action Card")
                                    .foregroundColor(Color(hex: "FFD500"))
                                    .font(.caption2)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color(hex: "2F6386"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hex: "07A5C3"), lineWidth: 4)
                        )
                        .cornerRadius(10)
                    }
                }

                ZStack {
                    HStack(spacing: 70) {
                        Spacer()
                        playerView(for: 3)
                        Spacer()
                        playerView(for: 4)
                        Spacer()
                    }
                    .offset(y: 45)

                    playerView(for: 2)
                }
                .padding(.top, 20)

                Spacer()

                Button(action: {
                    // Navigation action
                }) {
                    Text("الصفحة الرئيسية")
                        .foregroundColor(Color(hex: "2F6386"))
                        .font(.title3)
                        .bold()
                        .padding(.horizontal, 40)
                        .padding(.vertical, 14)
                        .background(Color(hex: "FFD500"))
                        .cornerRadius(25)
                }
                .padding(.bottom, 45)
            }
        }
    }

    func playerView(for rank: Int) -> some View {
        if let player = players.first(where: { $0.rank == rank }) {
            return AnyView(
                VStack(spacing: 0) {
                    HStack(alignment: .top, spacing: 0) {
                        Text(rankNumber(rank))
                            .foregroundColor(.white)
                            .font(.title)
                        Text(rankPostfix(rank))
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .baselineOffset(6)
                    }

                    ZStack {
                        Circle()
                            .stroke(Color.white, lineWidth: 4)
                            .background(Circle().fill(colorForRank(rank)))
                            .frame(width: 90, height: 80)

                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                    }

                    ZStack {
                        HStack(spacing: 6) {
                            Image("coins")
                            Text("\(player.score)")
                                .foregroundColor(Color(hex: "FFD500"))
                                .bold()
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(Color(hex: "2F6386"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(hex: "07A5C3"), lineWidth: 4)
                        )
                        .cornerRadius(20)
                        .offset(y: -10)
                    }

                    Text(player.name)
                        .foregroundColor(.white)
                        .font(.title3)
                }
            )
        } else {
            return AnyView(EmptyView())
        }
    }

    func colorForRank(_ rank: Int) -> Color {
        switch rank {
        case 1: return Color(hex: "F4B324")
        case 2: return Color(hex: "F14902")
        case 3: return Color(hex: "07A5C3")
        case 4: return Color(hex: "2F6386")
        default: return Color.gray
        }
    }

    func rankNumber(_ rank: Int) -> String {
        return String(rank)
    }

    func rankPostfix(_ rank: Int) -> String {
        switch rank {
        case 1: return "st"
        case 2: return "nd"
        case 3: return "rd"
        default: return "th"
        }
    }
}

#Preview {
    WinnerView()
}
