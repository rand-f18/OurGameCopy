//
//  GameRoom2.swift
//  Our_Game
//
//  Created by Fai Alharthi on 10/11/1446 AH.
//

import SwiftUI

var countDownTimer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

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

    @State private var playerCard: [String] = []
    @State private var centerCard: [String] = []

    @State private var selectedPlayerElement: String? = nil
    @State private var selectedCenterElement: String? = nil

    @State private var showExitConfirmation = false // عرض نافذة التأكيد
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
                // NavigationLink لاستخدامه عند الضغط على "خروج"
                NavigationLink(destination: DashboardView(matchManager: MatchManager()), isActive: $navigateToDashboard) {
                    EmptyView() // لا حاجة لعرض شيء هنا
                }

                HStack(spacing: 0) {
                    VStack {
                        ZStack {
                            Circle()
                                .fill(Color(.lightBeige))
                                .stroke(Color(#colorLiteral(red: 0.039, green: 0.584, blue: 0.741, alpha: 1)), lineWidth: 4)
                                .frame(width: 50, height: 50)
                            Button(action: {
                                showExitConfirmation = true // عرض نافذة التأكيد
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
                        ForEach(playerCard, id: \.self) { element in
                            Image(element)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80) // زيادة الحجم هنا
                                .padding(4)
                                .background(
                                    selectedPlayerElement == element && selectedCenterElement == element ?
                                    Color.green.opacity(0.4) :
                                    (selectedPlayerElement == element ? Color.blue.opacity(0.3) : Color.clear)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .onTapGesture {
                                    selectedPlayerElement = element
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
                                    ForEach(centerCard, id: \.self) { element in
                                        let randomSize: CGFloat = CGFloat(Int.random(in: 45...60))
                                        let rotationAngle: Double = Double.random(in: -10...10)
                                        let xOffset = CGFloat.random(in: -4...4)
                                        let yOffset = CGFloat.random(in: -4...4)

                                        Image(element)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: randomSize, height: randomSize)
                                            .rotationEffect(.degrees(rotationAngle))
                                            .offset(x: xOffset, y: yOffset)
                                            .padding(4)
                                            .background(
                                                selectedPlayerElement == element && selectedCenterElement == element ?
                                                Color.green.opacity(0.4) :
                                                (selectedCenterElement == element ? Color.blue.opacity(0.3) : Color.clear)
                                            )
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .onTapGesture {
                                                selectedCenterElement = element
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

            // لاعبين آخرين
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
                    // عند الضغط على "خروج"، قم بتعيين navigateToDashboard إلى true للتنقل
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { // تأخير صغير للتأكد من إغلاق التنبيه أولاً
                        navigateToDashboard = true
                    }
                },
                secondaryButton: .cancel() // إلغاء الخروج
            )
        }
        .onAppear {
            let cards = generateCards(allElements: allElements)
            playerCard = cards.playerCard
            centerCard = cards.centerCard
        }
    }

    func generateCards(allElements: [String]) -> (playerCard: [String], centerCard: [String]) {
        let sharedCount = Int.random(in: 1...2)
        let sharedElements = allElements.shuffled().prefix(sharedCount)
        let remainingElements = allElements.filter { !sharedElements.contains($0) }.shuffled()

        let playerUnique = remainingElements.prefix(10 - sharedCount)
        let centerUnique = remainingElements.dropFirst(10 - sharedCount).prefix(10 - sharedCount)

        let playerCard = Array(sharedElements) + playerUnique
        let centerCard = Array(sharedElements) + centerUnique

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
