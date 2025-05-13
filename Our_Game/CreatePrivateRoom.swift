import SwiftUI

struct ContentView1: View {
    @State private var selectedCards: Set<Int> = []
    @State private var scrollOffset: CGFloat = 0.0
    @State private var navigate = false // ⬅️ حالة للتنقل
    let scrollStep: CGFloat = 80
    let maxScrollOffset: CGFloat = 160

    let cardImagesTop = ["Group4", "Group2", "Group3", "Group5"]
    let cardImagesBottom = ["Group1"]

    var body: some View {
        NavigationStack { // ⬅️ غلاف التنقل
            ZStack {
                RadialGradient(gradient: Gradient(colors: [Color(hex: "07A5C3"), Color(hex: "2F6386")]), center: .center, startRadius: 100, endRadius: 470)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    Text("إنشاء غرفة خاصة")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom,50)

                    VStack(spacing: 16) {
                        VStack(alignment: .trailing, spacing: 15) {
                            Text("اختر الطابع الخاص بالجولة")
                                .font(.headline)
                                .foregroundColor(Color(hex: "282727"))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.top,20)
                                .padding(.bottom,10)
                                .padding(.trailing,20)

                            HStack {
                                Button(action: {
                                    withAnimation {
                                        scrollOffset = max(scrollOffset - scrollStep, -maxScrollOffset)
                                    }
                                }) {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(Color(hex: "3A6EA5"))
                                        .bold()
                                }

                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 12) {
                                        ForEach(["Rectangle5", "Rectangle4", "Rectangle3", "Rectangle2", "Rectangle"], id: \.self) { name in
                                            VStack {
                                                Image(name)
                                                    .resizable()
                                                    .frame(width: 60, height: 60)
                                                    .cornerRadius(8)
                                                Text(name == "Rectangle5" ? "حيوانات" : name == "Rectangle4" ? "بلوت" : name == "Rectangle3" ? "شطرنج" : name == "Rectangle2" ? "فلكي" : "كلاسيك")
                                                    .font(.caption)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                    .offset(x: scrollOffset)
                                }

                                Button(action: {
                                    withAnimation {
                                        scrollOffset = min(scrollOffset + scrollStep, 0)
                                    }
                                }) {
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color(hex: "3A6EA5"))
                                        .bold()
                                }
                            }
                        }

                        VStack(alignment: .trailing, spacing: 4) {
                            Text("اختر البطاقات الخاصة بك في هذه الجولة")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .foregroundColor(Color(hex: "282727"))
                                .padding(.top,20)
                                .padding(.trailing,20)
                            Text("(اختر ٢ كحد أقصى)")
                                .font(.subheadline)
                                .foregroundColor(Color(hex: "282727"))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing,20)
                        }

                        HStack(spacing: 16) {
                            ForEach(0..<cardImagesTop.count + cardImagesBottom.count, id: \.self) { index in
                                let imageName = (index < cardImagesTop.count) ? cardImagesTop[index] : cardImagesBottom[index - cardImagesTop.count]

                                ZStack(alignment: .topTrailing) {
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 45, height: 60)
                                        .cornerRadius(12)
                                        .onTapGesture {
                                            if selectedCards.contains(index) {
                                                selectedCards.remove(index)
                                            } else if selectedCards.count < 2 {
                                                selectedCards.insert(index)
                                            }
                                        }

                                    ZStack {
                                        Circle()
                                            .stroke(Color(hex: "3A6EA5"), lineWidth: 2)
                                            .background(Circle().fill(Color(hex: "07A5C3")))
                                            .frame(width: 30, height: 20)

                                        if selectedCards.contains(index) {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12, weight: .bold))
                                        }
                                    }
                                    .offset(x: 15, y: -2)
                                }
                            }
                        }
                        .padding(20)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color(hex: "11D1E3"), Color(hex: "07A6C4")]), startPoint: .top, endPoint: .bottom)
                        )
                        .cornerRadius(8)

                        Button(action: {
                            navigate = true // ⬅️ التفعيل
                        }) {
                            Text("إنشاء")
                                .foregroundColor(.white)
                                .bold()
                                .padding(.horizontal, 80)
                                .padding(.vertical, 12)
                                .background(Color(hex: "07A5C3"))
                                .cornerRadius(25)
                                .shadow(color: Color(hex: "3A6EA5").opacity(0.6), radius: 2, x: 0, y: 3)

                        }
                        .padding(.top,20)
                        .padding(.bottom,20)

                        // ⬇️ التنقل
                        NavigationLink(destination: RoomCreatedView(), isActive: $navigate) {
                            EmptyView()
                        }
                        .hidden()
                    }
                    .frame(maxWidth: 330)
                    .padding()
                    .background(Color(hex: "FFCE00"))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(hex: "3A6EA5"), lineWidth: 4)
                    )
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView1()
}
