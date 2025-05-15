import SwiftUI

var countDownTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

struct GameRoom: View {
    @ObservedObject var matchManager: MatchManager
    let allElements = ["Camal", "Kabba", "man", "Dallah", "dates", "Desert", "Falcon", "Gecko", "metro", "Misbaha", "plam", "Riyal"]

    @State private var centerCard: [String] = []
    @State private var playerCard: [String] = []
    @State private var selectedElement: String? = nil
    @State private var centerCardOwner: String? = nil // من فاز بالجولة الحالية

    var body: some View {
       
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [.centerColor, .edgeColor]),
                center: .center,
                startRadius: 20,
                endRadius: 500
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Danah")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.top, 16)

                // الورقة المركزية
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white)
                    .overlay(
                        GridView(images: centerCard, selectedElement: $selectedElement)
                            .padding()
                    )
                    .frame(width: 300, height: 350)

                // ورقة اللاعب "Fai"
                ZStack {
                    Circle()
                        .fill(centerCardOwner == "Fai" ? Color.green : Color.orange)
                        .frame(width: 280, height: 280)
                        .animation(.easeInOut(duration: 0.4), value: centerCardOwner)
                        

                    VStack {
                        Text("Fai")
                            .font(.headline)
                            .foregroundColor(.white)
                        GridView(images: playerCard, selectedElement: $selectedElement)
                            .frame(height: 200)
                    }
                    
             

                }

                // زر محاكاة فوز اللاعب (مؤقت للتجربة)
                Button("فزت بالجولة!") {
                    centerCard = playerCard
                    centerCardOwner = "Fai"
                    playerCard = generateCard()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)

                Spacer()
            }

            // أسماء الجوانب مع دوائر الحالة
            VStack {
                Spacer()
                HStack {
                    VStack(spacing: 4) {
                        Circle()
                            .fill(centerCardOwner == "بندر" ? Color.green : Color.gray)
                            .frame(width: 12, height: 12)
                        Text("بندر")
                            .rotationEffect(.degrees(-90))
                            .foregroundColor(.white)
                            .font(.caption)
                    }

                    Spacer()

                    VStack(spacing: 4) {
                        Circle()
                            .fill(centerCardOwner == "Saad" ? Color.green : Color.gray)
                            .frame(width: 12, height: 12)
                        Text("Saad")
                            .rotationEffect(.degrees(90))
                            .foregroundColor(.white)
                            .font(.caption)
                    }
                }
                .padding(.horizontal)
            }

            // أزرار الأكشن (Freeze - Noise)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        Button("Freeze!") {
                            // Freeze logic
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)

                        Button("Noise") {
                            // Noise logic
                        }
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.black)
                        .cornerRadius(12)
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            centerCard = generateCard()
            playerCard = generateCard()
        }
    }

    func generateCard() -> [String] {
        Array(allElements.shuffled().prefix(8))
    }
}

struct GridView: View {
    var images: [String]
    @Binding var selectedElement: String?

    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 12) {
            ForEach(images, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .background(selectedElement == imageName ? Color.red.opacity(0.3) : Color.clear)
                    .cornerRadius(8)
                    .onTapGesture {
                        selectedElement = imageName
                    }
            }
        }
    }
}

struct GameRoom_Previews: PreviewProvider {
    static var previews: some View {
        GameRoom(matchManager : MatchManager())
    }
}
