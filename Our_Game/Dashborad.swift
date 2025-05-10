import SwiftUI

struct DashboardView: View {
    
    @State private var levelPoints: Double = 250
    private let maxPoints: Double = 500
    
    var levelProgress: Double {
        levelPoints / maxPoints
    }
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(#colorLiteral(red: 0.1000694409, green: 0.3843396008, blue: 0.5841861963, alpha: 1)),
                    Color(#colorLiteral(red: 0.039, green: 0.584, blue: 0.741, alpha: 1))
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                // MARK: - Top Stats
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 16) {
                        // Level + Progress
                        HStack(spacing: 12) {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 50, height: 50)
                                    .shadow(radius: 9)
                                
                                Text("\(Int(levelPoints))")
                                    .foregroundColor(.blue)
                                    .fontWeight(.bold)
                            }
                            
                            VStack(alignment: .leading, spacing: 6) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(LinearGradient(
                                            gradient: Gradient(colors: [Color.yellow, Color.orange]),
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        ))
                                        .frame(width: 160, height: 24)

                                    Text("\(Int(levelPoints)) / \(Int(maxPoints))")
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        
                        // Coins Button
                        Button(action: {
                            print("Coin button tapped")
                        }) {
                            HStack(spacing: 8) {
                                Text("25000")
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color.yellow)
                                    .cornerRadius(30)
                                
                                Image("coins")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    // Right Side Icons (reordered to match the image)
                    VStack(spacing: 5) {
                        HStack(spacing: 12) {
                            Button(action: {
                                print("Winner tapped")
                            }) {
                                Image("winner")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            Button(action: {
                                print("Card tapped")
                            }) {
                                Image("card_16271793")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            Button(action: {
                                print("leaderboard tapped")
                            }) {
                                Image("store_869636")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                        }
                        
                        // Ghost and score
                        VStack(spacing: 5) {
                            Button(action: {
                                print("Ghost tapped")
                            }) {
                                Image("ghost_4955533 (1)")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }

                            Text("0")
                                .foregroundColor(.white)

                            Button(action: {
                                print("Help tapped")
                            }) {
                                HStack(spacing: 4) {
                                    
                                    Text("تعلم كيفية اللعب")
                                        .foregroundColor(.yellow)
                                        .font(.footnote)
                                        .lineLimit(1)
                                    Image(systemName: "questionmark.circle.fill")
                                        .foregroundColor(.yellow)
                                        .font(.footnote)

                                }
                                .frame(width: 140, alignment: .trailing)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 4)
                                .background(Color.cyan.opacity(0.3))
                                .cornerRadius(8)
                            }
                        }
                    }

                }
                .padding(.horizontal)
                
                Spacer()
                
                // MARK: - Game Preview + Buttons
                VStack(spacing: -19) {
                    Image("Preview")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                        .cornerRadius(20)
                    
                    Button(action: {
                        print("Start Game tapped")
                    }) {
                        Text("إبدأ اللعب !")
                            .font(.title2)
                            .foregroundColor(.red)
                            .frame(width: 340, height: 55)
                            .background(Color.yellow)
                            .cornerRadius(25)
                    }
                }
                
                Button(action: {
                    print("Create Private Room tapped")
                }) {
                    Text("أنشئ غرفة خاصة")
                        .foregroundColor(.white)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                        .background(Color(#colorLiteral(red: 0.0, green: 0.741, blue: 0.839, alpha: 1)))
                        .cornerRadius(30)
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
