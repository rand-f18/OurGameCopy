//
//  GameRoom2.swift
//  Our_Game
//
//  Created by Fai Alharthi on 10/11/1446 AH.
//

import SwiftUI

var countDownTimer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

// struct لحفظ خصائص كل عنصر في الكروت
struct PositionedImage: Identifiable {
    let id = UUID()
    let name: String
    let size: CGFloat
    let rotation: Double
    let offsetX: CGFloat
    let offsetY: CGFloat
}

struct GameRoom2: View {

    @Environment(\.dismiss) var dismiss
    let allElements = [
        "Camal", "Kabba", "man", "Dallah", "dates", "Desert",
        "Falcon", "Gecko", "metro", "Misbaha", "plam", "Riyal",
        "Ihram", "woman", "sheep", "water"
    ]

    @ObservedObject var viewModel = ActionCardViewModel()
    var freezeCard: ActionCardModel
    var noiseCard: ActionCardModel

    @State private var playerCard: [PositionedImage] = []
    @State private var centerCard: [PositionedImage] = []

    @State private var selectedPlayerElement: String? = nil
    @State private var selectedCenterElement: String? = nil

    @State private var showExitConfirmation = false
    @State private var navigateToDashboard = false

    init(viewModel: ActionCardViewModel) {
        self.freezeCard = viewModel.createFreezeCard()
        self.noiseCard = viewModel.createNoiseCard()
    }

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [.centerColor, .edgeColor]),
                center: .center,
                startRadius: 20,
                endRadius: 500
            )
            .ignoresSafeArea()

            VStack {
                NavigationLink(destination: DashboardView(matchManager: MatchManager()), isActive: $navigateToDashboard) {
                    EmptyView()
                }

                HStack(spacing: 0) {
                    VStack {
                        ZStack {
                            Circle()
                                .fill(Color(.lightBeige))
                                .stroke(Color(#colorLiteral(red: 0.039, green: 0.584, blue: 0.741, alpha: 1)), lineWidth: 4)
                                .frame(width: 50, height: 50)
                            Button(action: {
                                showExitConfirmation = true
                            }) {
                                Image(systemName: "door.right.hand.open")
                                    .resizable()
                                    .frame(width: 22, height: 30)
                                    .foregroundColor(.red)
                            }
                        }
                        .frame(height: 35)
                        .padding(.top, 120)
                        .padding(.trailing, 5)

                        Text("خروج")
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .foregroundColor(.red)
                            .padding(.top, 2)
                    }

                    ZStack {
                        Circle()
                            .trim(from: 0.0, to: 0.5)
                            .fill(Color(#colorLiteral(red: 0.039, green: 0.584, blue: 0.741, alpha: 1)))
                            .stroke(Color.lightBeige, lineWidth: 4)
                            .frame(width: 300, height: 250)
                            .padding(.trailing, 60)
                            .padding(.bottom, 60)

                        Text("Danah")
                            .font(.system(size: 26, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.trailing, 60)
                            .padding(.top, 150)
                    }
                    .frame(width: 300, height: 200)
                }

                // بطاقة اللاعب
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color(.lightBeige))
                        .frame(width: 280, height: 470)
                        .padding(.vertical, 5)

                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 20) {
                        ForEach(playerCard) { element in
                            Image(element.name)
                                .resizable()
                                .scaledToFit()
                                .frame(width: element.size, height: element.size)
                                .rotationEffect(.degrees(element.rotation))
                                .offset(x: element.offsetX, y: element.offsetY)
                                .padding(4)
                                .background(
                                    selectedPlayerElement == element.name && selectedCenterElement == element.name ?
                                    Color.green.opacity(0.4) :
                                    (selectedPlayerElement == element.name ? Color.blue.opacity(0.3) : Color.clear)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .onTapGesture {
                                    selectedPlayerElement = element.name
                                    checkMatch()
                                }
                        }
                    }
                    .padding(.top, 15)
                    .padding(.horizontal, 8)
                }.frame(width: 280, height: 470)

                // كرت المركز
                HStack(spacing: 0) {
                    ZStack {
                        Circle()
                            .fill(Color.orange)
                            .stroke(Color.lightBeige, lineWidth: 4)
                            .frame(width: 300, height: 255)
                            .padding(.bottom, 80)
                            .padding(.top, 5)

                        Circle().fill(Color.clear)
                            .frame(width: 290, height: 255)
                            .overlay {
                                LazyVGrid(columns: columns, spacing: 5) {
                                    ForEach(centerCard) { element in
                                        Image(element.name)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: element.size, height: element.size)
                                            .rotationEffect(.degrees(element.rotation))
                                            .offset(x: element.offsetX, y: element.offsetY)
                                            .padding(4)
                                            .background(
                                                selectedPlayerElement == element.name && selectedCenterElement == element.name ?
                                                Color.green.opacity(0.4) :
                                                (selectedCenterElement == element.name ? Color.blue.opacity(0.3) : Color.clear)
                                            )
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .onTapGesture {
                                                selectedCenterElement = element.name
                                                checkMatch()
                                            }
                                    }
                                }
                                .frame(width: 230, height: 220)
                            }.padding(.bottom, 65)

                        Text("Fai")
                            .font(.system(size: 26, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.bottom, 290)
                    }
                    .frame(width: 275)
                }
                .frame(width: 390)
            }
            .padding(.bottom, 50)

            HStack(spacing: 260) {
                ZStack {
                    Circle()
                        .fill(Color(.systemOrange))
                        .stroke(Color.lightBeige, lineWidth: 4)
                        .frame(width: 300, height: 250)

                    Text("نورة")
                        .font(.system(size: 26, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(90))
                        .padding(.leading, 200)
                }

                ZStack {
                    Circle()
                        .fill(Color(.systemRed))
                        .stroke(Color.lightBeige, lineWidth: 4)
                        .frame(width: 300, height: 250)

                    Text("Saad")
                        .font(.system(size: 26, weight: .regular, design: .rounded))
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(-90))
                        .padding(.trailing, 200)
                }
            }
            .padding(.bottom, 90)
        }
        .alert(isPresented: $showExitConfirmation) {
            Alert(
                title: Text("هل أنت متأكد؟"),
                message: Text("هل تريد الخروج من اللعبة؟"),
                primaryButton: .destructive(Text("خروج")) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        navigateToDashboard = true
                    }
                },
                secondaryButton: .cancel()
            )
        }
        .onAppear {
            let cards = generateCards(allElements: allElements)
            playerCard = cards.playerCard
            centerCard = cards.centerCard
        }
    }

    func generateCards(allElements: [String]) -> (playerCard: [PositionedImage], centerCard: [PositionedImage]) {
        let sharedCount = Int.random(in: 1...2)
        let sharedElements = allElements.shuffled().prefix(sharedCount)
        let remainingElements = allElements.filter { !sharedElements.contains($0) }.shuffled()

        let playerUnique = remainingElements.prefix(10 - sharedCount)
        let centerUnique = remainingElements.dropFirst(10 - sharedCount).prefix(10 - sharedCount)

        let playerCardStrings = Array(sharedElements) + playerUnique
        let centerCardStrings = Array(sharedElements) + centerUnique

        let playerCard = playerCardStrings.map { name in
            PositionedImage(
                name: name,
                size: CGFloat(Int.random(in: 70...85)),
                rotation: Double.random(in: -5...5),
                offsetX: CGFloat.random(in: -3...3),
                offsetY: CGFloat.random(in: -3...3)
            )
        }

        let centerCard = centerCardStrings.map { name in
            PositionedImage(
                name: name,
                size: CGFloat(Int.random(in: 45...60)),
                rotation: Double.random(in: -10...10),
                offsetX: CGFloat.random(in: -4...4),
                offsetY: CGFloat.random(in: -4...4)
            )
        }

        return (playerCard.shuffled(), centerCard.shuffled())
    }

    func checkMatch() {
        if let selectedPlayer = selectedPlayerElement,
           let selectedCenter = selectedCenterElement {

            if selectedPlayer == selectedCenter {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    let newCards = generateCards(allElements: allElements)
                    playerCard = newCards.playerCard
                    centerCard = newCards.centerCard
                    selectedPlayerElement = nil
                    selectedCenterElement = nil
                }
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    selectedPlayerElement = nil
                    selectedCenterElement = nil
                }
            }
        }
    }
}

#Preview {
    GameRoom2(viewModel: ActionCardViewModel())
}
