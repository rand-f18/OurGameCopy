import SwiftUI

struct MyCardsView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(#colorLiteral(red: 0.09, green: 0.55, blue: 0.74, alpha: 1)),
                    Color(#colorLiteral(red: 0.08, green: 0.38, blue: 0.58, alpha: 1))
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                HStack {
                    Button(action: {
                        // Handle back action
                    }) {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .frame(width: 20, height: 30)
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 4) {
                        HStack {
                            Text("بطاقاتي")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Image("card-game")
                                .foregroundColor(.white)
                        }
                        
                        Text("بطاقات تمنح اللاعب قدرات تكتيكية أو مفاجئة تؤثر مباشرة على مجريات اللعب\nاضغط على البطاقة لمعرفة وظيفتها")
                            .font(.footnote)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }
                
                // Card grid container
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color(#colorLiteral(red: 0.07, green: 0.65, blue: 0.85, alpha: 1)))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .overlay(
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            CardView(image: "protection_card", count: 2, label: "Protection")
                            CardView(image: "duplicate_card", count: 1, label: "+2")
                            CardView(image: "freeze_card", count: 1, label: "Freeze!", description: "تجميد لمدة ٦ ثواني لأحد الأطراف")
                        }
                        .padding()
                    )
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 8, y: 8)
            }
            .padding()
        }
    }
}

// MARK: - Single Card View
struct CardView: View {
    var image: String
    var count: Int
    var label: String
    var description: String? = nil
    
    var body: some View {
        VStack(spacing: 4) {
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white.opacity(0.1))
                    .frame(width: 90, height: 100)
                    .overlay(
                        VStack {
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            
                            Text(label)
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                    )
                
                // Count badge
                if count > 0 {
                    Text("\(count)")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .frame(width: 20, height: 20)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .offset(x: -6, y: 6)
                }
            }
            
            // Optional description
            if let desc = description {
                Text(desc)
                    .font(.caption2)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 80)
            }
        }
    }
}

#Preview {
    MyCardsView()
}
