import SwiftUI

struct LeaderBoard: View {
    var body: some View {
        ZStack {
            // الخلفية
            RadialGradient(
                gradient: Gradient(colors: [.centerColor, .edgeColor]),
                center: .center,
                startRadius: 20,
                endRadius: 500
            )
            .ignoresSafeArea()
            
            VStack {
                Text("لوحة الفائزين")
                    .font(.custom("SF Arabic Rounded", size: 30))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.top, 40) // نزّل النص تحت شوي
                
                Spacer()
            }
            .padding()
            
            // المربع البرتقالي
            VStack {
                Spacer()
                HStack {
                    // المربع البرتقالي على اليسار
                    Rectangle()
                        .fill(Color(hex: "F4B324"))
                        .frame(width: 130, height: 130)
                    
                    // المربع باللون FFD500 على اليمين
                    Rectangle()
                        .fill(Color(hex: "FFD500"))
                        .frame(width: 65, height: 130) // نصف الحجم بالضبط
                }
                .padding(.bottom, 420) // المسافة بين المربعات والجزء الأبيض
            }
            
            // المربع الأبيض في أسفل الشاشة
            VStack {
                Spacer() // يدفع المستطيل لتحت
                
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .fill(Color.white)
                    .frame(height: 400)
                    .ignoresSafeArea(edges: .bottom) // يظل المربع الأبيض في أسفل الشاشة
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LeaderBoard()
}
