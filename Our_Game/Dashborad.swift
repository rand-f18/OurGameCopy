import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.105, green: 0.388, blue: 0.584, alpha: 1)), Color(#colorLiteral(red: 0.039, green: 0.584, blue: 0.741, alpha: 1))]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                // Top Stats
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 10) {
                        // Level progress
                      
                        HStack(alignment: .center, spacing: 12) {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 50, height: 50)
                                    .shadow(radius: 2)
                                
                                Text("50")
                                    .foregroundColor(.blue)
                                    .fontWeight(.bold)
                            }

                            VStack(alignment: .leading, spacing: 4) {
                                ProgressView(value: 0.5)
                                    .progressViewStyle(LinearProgressViewStyle(tint: Color.orange))
                                    .frame(width: 120)
                                    .background(Color.yellow.opacity(0.2))
                                    .cornerRadius(5)

                                Text("50 / 100")
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }

                        // Coins
                        HStack(spacing: -30) {
                            Text("25000")
                                .foregroundColor(.black)
                                .padding(.horizontal, 39)
                                .padding(.vertical, 5)
                                .background(Color.yellow)
                                .cornerRadius(100)

                            Image("coins") // Make sure you add this image to Assets
                                .resizable()
                                .frame(width: 30, height: 30)
                                
                        }
                    }

                    Spacer()

                    // Right-side icons + ghost + learn how
                   
                        Image("card_16271793") // Folder icon
                            .resizable()
                            .frame(width: 40, height: 40)
                    VStack(spacing: 12) {
                        Image("store_869636") // Store icon
                            .resizable()
                            .frame(width: 40, height: 40)

                        VStack(spacing: 5) {
                            Image("ghost_4955533 (1)") // Ghost icon
                                .resizable()
                                .frame(width: 40, height: 40)

                            Text("0")
                                .foregroundColor(.white)

                            Button(action: {
                                // Show how to play
                            }) {
                                HStack(spacing: 4) {
                                    Text("تعلم كيفية اللعب")
                                        .foregroundColor(.yellow)
                                        .font(.footnote).background(Color.cyan.opacity(0.449))
                                    Image(systemName: "questionmark.circle.fill")
                                        .foregroundColor(.yellow)
                                        .font(.footnote)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)

                Spacer()

                // Game card
                // Game card
                VStack(spacing: -12) {
                    Image("Preview")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                        .cornerRadius(20)
                    
                    Button(action: {
                        // Start game action
                    }) {
                        Text("إبدأ اللعب !")
                            .font(.title2)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(25)
                    }}
                    .padding(.horizontal, 30)

                    Button(action: {
                        // Create private room action
                    }) {
                        
                        Text("أنشئ غرفة خاصة")
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 10)
                            .background(Color(#colorLiteral(red: 0.0, green: 0.741, blue: 0.839, alpha: 1)))
                            .cornerRadius(30)
                    
                }


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

