
import SwiftUI

struct RoomCreatedView: View {
    let roomCode: String = "56978"
    let players: [Player1] = [
        Player1(name: "Fai Ali", isHost: true),
        Player1(name: "Danah", isHost: false),
        Player1(name: "Saad", isHost: false),
        Player1(name: "", isHost: false, isWaiting: true)
    ]

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color(hex: "07A5C3"), Color(hex: "2F6386")]), center: .center, startRadius: 100, endRadius: 470)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 24) {
                Text("إنشاء غرفة خاصة")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom,50)

                VStack(spacing: 24) {
                    VStack(spacing: 8) {
                        Text("رقم الغرفة:")
                            .bold()
                            .font(.title2)
                            .foregroundColor(Color(hex: "3A6EA5"))
                            .padding(.top,15)

                        HStack(spacing: 8) {
                            Text(roomCode)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                            Image(systemName: "doc.on.doc.fill")
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .background(Color(hex: "07A5C3"))
                        .cornerRadius(12)
                    }

                    VStack(spacing: 16) {
                        if let host = players.first(where: { $0.isHost }) {
                            VStack(spacing: 6) {
                                PlayerCircle(player: host)
                                Text(host.name)
                                    .font(.caption)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 4)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color(hex: "F14902"))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color(hex: "07A5C3"), lineWidth: 1)
                                            )
                                    )
                                    .foregroundColor(.white)
                                    .offset(y: -12)
                            }
                        }

                        HStack(spacing: 16) {
                            ForEach(players.filter { !$0.isHost }) { player in
                                VStack(spacing: 6) {
                                    PlayerCircle(player: player)
                                    if !player.name.isEmpty {
                                        Text(player.name)
                                            .font(.caption)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 4)
                                            .background(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .fill(Color(hex: "2F6386"))
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 20)
                                                            .stroke(Color(hex: "07A5C3"), lineWidth: 1)
                                                    )
                                            )
                                            .foregroundColor(.white)
                                            .offset(y: -12)
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    .background(
                        RadialGradient(gradient: Gradient(colors: [Color(hex: "11D1E3"), Color(hex: "07A5C3")]), center: .center, startRadius: 10, endRadius: 200)
                    )
                    .cornerRadius(20)

                    Button(action: {
                        // Start Action
                    }) {
                        Text("ابدأ")
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size: 20))
                            .padding(.horizontal, 80)
                            .padding(.vertical, 12)
                            .background(Color(hex: "07A5C3"))
                            .cornerRadius(25)
                            .shadow(color: Color(hex: "3A6EA5").opacity(0.6), radius: 2, x: 0, y: 3)
                    }
                    .padding(.top,25)
                    .padding(.bottom,15)
                }
                .padding()
                .background(Color(hex: "FFCE00"))
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(hex: "3A6EA5"), lineWidth: 4)
                )
                .padding()
            }
        }
    }
}

struct Player1: Identifiable {
    let id = UUID()
    let name: String
    let isHost: Bool
    var isWaiting: Bool = false
}

struct PlayerCircle: View {
    let player: Player1

    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(Color(hex: "07A5C3"), lineWidth: 2)
                .background(
                    Circle().fill(player.isHost ? Color(hex: "F14902") : Color(hex: "2F6386"))
                )
                .frame(width: 90, height: 70)

            if player.isWaiting {
                Image("Waited")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            } else {
                Image(systemName: "person.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 45))
                    .padding(.top, 10)
            }
        }
    }
}

#Preview {
    RoomCreatedView()
}

