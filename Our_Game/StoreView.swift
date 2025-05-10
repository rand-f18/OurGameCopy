import SwiftUI

struct StoreView: View {
    var body: some View {
        ZStack {
            // Yellow gradient background
            LinearGradient(
                gradient: Gradient(colors: [Color.yellow, Color.yellow.opacity(0.6)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 10) {
                    // Header
                    Text("متجر عين")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(Color(red: 0.227, green: 0.431, blue: 0.647))

                    HStack(spacing: 8) {
                        Text("25000")
                            .font(.title3)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)

                        Image("coins")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                    .background(Color.white.opacity(0.7))
                    .clipShape(Capsule())
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.top, 20)

                // Cards
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(0..<10) { index in
                        let isBasic = index < 5
                        StoreCard(
                            index: index,
                            title: isBasic ? ["Protection", "+2", "Noise", "Freeze!", "Peek"][index] : ["Protection", "+15", "Noise", "Freeze!", "👻"][index - 5],
                            icon: isBasic ? ["shield", "square.on.square", "waveform", "snowflake", "eye"][index] : ["shield.fill", "square.on.square", "waveform", "snowflake", ""][index - 5],
                            price: isBasic ? "7500" : "90K",
                            duration: isBasic ? "2.80s" : "10s",
                            description: isBasic ?
                                ["حماية من إحدى بطاقات الخصم", "أضف ورقتين إضافية لأحد الأطراف", "تشويش لمدة ١٠ ثواني لأحد الأطراف", "تجميد لمدة ٦ ثواني لأحد الأطراف", "استرق النظر قبل الجميع"][index]
                                :
                                ["حماية من أي بطاقة طوال الجولة !", "أضف 15 ورقة إضافية لأحد الأطراف", "تشويش لمدة دقيقة لأحد الأطراف", "تجميد لمدة ٣٠ ثانية لأحد الأطراف", "اكشف عدد البطاقات في يد كل خصم دون رؤية محتواها"][index - 5]
                        )
                    }
                }
                .padding()
            }
        }
    }
}

// MARK: - StoreCard View
struct StoreCard: View {
    var index: Int
    var title: String
    var icon: String
    var price: String
    var duration: String
    var description: String

    var body: some View {
        let isBasic = index < 5
        let bgGradient = LinearGradient(
            gradient: Gradient(colors: isBasic ? [Color(hex: "#11D1E3"), Color.cyan] : [Color(hex: "#282727"), Color.black]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )

        VStack(spacing: 14) {
            // Icon and title
            VStack(spacing: 8) {
                if icon != "" {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                        .foregroundColor(.white)
                } else {
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                }

                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.white.opacity(0.2))
            .cornerRadius(20)

            // Coin price
            HStack(spacing: 6) {
                Text(price)
                    .font(.headline)
                    .foregroundColor(.black)

                Image("coins")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color.yellow)
            .clipShape(Capsule())

            // Dollar price
            Text(duration)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color(red: 0.17, green: 0.29, blue: 0.41))
                .clipShape(Capsule())

            // Description
            Text(description)
                .font(.caption)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(25)
        }
        .padding()
        .background(bgGradient)
        .cornerRadius(30)
        .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 4)
    }
}

// MARK: - Color extension for hex support
extension Color {
    init(hex0: String) {
        let hex0 = hex0.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex0).scanHexInt64(&int)
        let r = Double((int >> 16) & 0xFF) / 255
        let g = Double((int >> 8) & 0xFF) / 255
        let b = Double(int & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

// MARK: - Preview
struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}

