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
                            StoreCard(title: "Protection", imageName: "Group5", price: "7500", dollar: "2.80$", description: "حماية من إحدى بطاقات الخصم", color: .cyan)
                            StoreCard(title: "+2", imageName: "Group4", price: "7500", dollar: "2.80$", description: "أضف ورقتين إضافية لأحد الأطراف", color: .cyan)
                            StoreCard(title: "Noise", imageName: "Group3", price: "7500", dollar: "2.80$", description: "تشويش لمدة ١٠ ثواني لأحد الأطراف", color: .cyan)
                            StoreCard(title: "Freeze!", imageName: "Group2", price: "7500", dollar: "2.80$", description: "تجميد لمدة ٦ ثواني لأحد الأطراف", color: .cyan)
                            StoreCard(title: "Peek", imageName: "Group1", price: "10K", dollar: "5.80$", description: "استرق النظر قبل الجميع", color: .cyan)
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
                            StoreCard(title: "Protection", imageName: "Group5", price: "90K", dollar: "10$", description: "حماية من أي بطاقة طوال الجولة !", color: .red)
                            StoreCard(title: "+15", imageName: "Group4", price: "90K", dollar: "10$", description: "أضف 15 ورقة إضافية لأحد الأطراف", color: .blue)
                            StoreCard(title: "Noise", imageName: "Group3", price: "90K", dollar: "10$", description: "تشويش لمدة دقيقة لأحد الأطراف", color: .blue)
                            StoreCard(title: "Freeze!", imageName: "Group2", price: "90K", dollar: "10$", description: "تجميد لمدة ٣٠ ثانية لأحد الأطراف", color: .blue)
                            StoreCard(title: "👻", imageName: "Group1", price: "10K", dollar: "5.80$", description: "اكشف عدد البطاقات في يد كل خصم دون رؤية محتواها", color: .cyan)
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
        var imageName: String
        var price: String
        var dollar: String
        var description: String
        var color: Color

        var body: some View {
            VStack(spacing: 12) {
                // صورة الأيقونة داخل مربع أبيض
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .frame(width: 70, height: 80)
                    
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }


                // الاسم
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)

                // السعر بالذهب داخل خلفية صفراء
                HStack(spacing: 6) {
                    Text(price)
                        .font(.subheadline)
                        .foregroundColor(.black)
                    Image("coins")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.yellow.opacity(0.8))
                .cornerRadius(10)

                // "أو اشتر مقابل"
                Text("أو اشتر مقابل")
                    .font(.caption2)
                    .foregroundColor(.gray)

                // السعر بالدولار داخل مستطيل أزرق غامق
                Text(dollar)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Color(red: 0.23, green: 0.36, blue: 0.53))
                    .cornerRadius(8)

                // الوصف داخل شريط أبيض
                Text(description)
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(10)

                // زر شراء
                Button(action: {
                    print("تم شراء البطاقة: \(title)")
                }) {
                    Text("شراء")
                        .font(.footnote)
                        .foregroundColor(.black)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 6)
                        .background(color.blur(radius: 3))
                        .cornerRadius(10)
                }
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

#Preview {
    StoreView()
}
