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
                    Text("متجر عين")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(Color(red: 0.227, green: 0.431, blue: 0.647))
                    HStack {
                        Spacer() // يدفع المحتوى إلى اليمين
                        
                        HStack(spacing: 8) {
                            Text("25000")
                                .font(.title3)
                                .foregroundColor(.black)
                                .padding(.vertical, 6)
                            
                            Image("coins")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .alignmentGuide(.firstTextBaseline) { $0[.bottom] }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 4)
                        .background(Color.white.opacity(0.7))
                        .clipShape(Capsule())
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(red: 0.0, green: 0.3, blue: 0.0), lineWidth: 2) // إطار أخضر غامق
                        )
                    }
                    .padding(.top, 20)
                    
                    
                    
                    
                    
                    // MARK: - Basic Level Cards
                    VStack(alignment: .trailing, spacing: 20) {
                        Text("بطاقات المستوى الأساسي")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color(red: 0.227, green: 0.431, blue: 0.647))
                            .padding(.trailing)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            StoreCard(title: "Protection", icon: "shield", price: "7500", duration: "2.80s", description: "حماية من إحدى بطاقات الخصم", color: .gray)
                            StoreCard(title: "+2", icon: "square.on.square", price: "7500", duration: "2.80s", description: "أضف ورقتين إضافية لأحد الأطراف", color: .gray)
                            StoreCard(title: "Noise", icon: "waveform", price: "7500", duration: "2.80s", description: "تشويش لمدة ١٠ ثواني لأحد الأطراف", color: .gray)
                            StoreCard(title: "Freeze!", icon: "snowflake", price: "7500", duration: "2.80s", description: "تجميد لمدة ٦ ثواني لأحد الأطراف", color: .gray)
                            StoreCard(title: "Peek", icon: "eye", price: "10K", duration: "5.80s", description: "استرق النظر قبل الجميع", color: .gray)
                        }
                    }
                    .padding()
                    
                    // MARK: - Advanced Level Cards
                    VStack(alignment: .trailing, spacing: 20) {
                        Text("بطاقات المستوى المتقدم")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.trailing)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            StoreCard(title: "Protection", icon: "shield.fill", price: "90K", duration: "10s", description: "حماية من أي بطاقة طوال الجولة !", color: .red)
                            StoreCard(title: "+15", icon: "square.on.square", price: "90K", duration: "10s", description: "أضف 15 ورقة إضافية لأحد الأطراف", color: .blue)
                            StoreCard(title: "Noise", icon: "waveform", price: "90K", duration: "10s", description: "تشويش لمدة دقيقة لأحد الأطراف", color: .yellow)
                            StoreCard(title: "Freeze!", icon: "snowflake", price: "90K", duration: "10s", description: "تجميد لمدة ٣٠ ثانية لأحد الأطراف", color: .blue)
                            StoreCard(title: "👻", icon: "", price: "10K", duration: "5.80s", description: "اكشف عدد البطاقات في يد كل خصم دون رؤية محتواها", color: .cyan)
                        }
                    }
                    .padding()
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [.black, Color(red: 0.18, green: 0.39, blue: 0.52)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .cornerRadius(20)
                    )
                }
                .padding(.bottom, 40)
            }
        }
    }
    
    
    // MARK: - StoreCard View
    struct StoreCard: View {
        var title: String
        var icon: String
        var price: String
        var duration: String
        var description: String
        var color: Color
        
        var body: some View {
            VStack(spacing: 8) {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white)
                        .frame(height: 130)
                    
                    VStack(spacing: 6) {
                        if !icon.isEmpty {
                            Image(systemName: icon)
                                .font(.system(size: 30))
                                .foregroundColor(color)
                        } else {
                            Text(title)
                                .font(.system(size: 30))
                        }
                        
                        Text(title)
                            .foregroundColor(.black)
                            .font(.headline)
                    }
                }
                
                HStack(spacing: 4) {
                    Text(price)
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    Image(systemName: "creditcard")
                        .foregroundColor(.yellow)
                }
                
                Text(duration)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(description)
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 4)
            }
            .padding()
            .background(Color.white.opacity(0.7))
            .cornerRadius(20)
            .shadow(radius: 2)
        }
    }
    
    // MARK: - Preview
    struct StoreView_Previews: PreviewProvider {
        static var previews: some View {
            StoreView()
        }
    }
}
