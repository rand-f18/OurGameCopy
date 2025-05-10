
//  Join
//  Our_Game
//
//  Created by Rand Soliman Alobaid on 09/11/1446 AH.
//

import SwiftUI

struct JoinPrivateRoom: View {
    @State private var selectedCards: Set<Int> = []
    @State private var roomCode: String = ""
    let scrollStep: CGFloat = 80
    let maxScrollOffset: CGFloat = 160
    
    let cardImagesTop = ["Group4", "Group2", "Group3", "Group5"]
    let cardImagesBottom = ["Group1"]
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color(hex: "07A5C3"), Color(hex: "2F6386")]), center: .center, startRadius: 100, endRadius: 470)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("انضمام إلى غرفة خاصة")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom,50)
                
                    
                    VStack(spacing: 16) {
                        VStack(alignment: .trailing, spacing: 12) {
                            Text("أدخل رقم الغرفة")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .foregroundColor(Color(hex: "282727"))
                                .padding(.top,20)
                                .padding(.trailing,20)
                            
                            TextField("", text: $roomCode)
                                .multilineTextAlignment(.trailing)
                                .padding()
                                .frame(width: 310, height: 45)
                                .background(Color.white)
                                .cornerRadius(12)
                                .padding(.trailing,10)
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
                        
                        // عرض البطاقات الخمس فقط
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
                            // Action
                        }) {
                            Text("إنضمام")
                                .foregroundColor(.white)
                                .bold()
                                .padding(.horizontal, 80)
                                .padding(.vertical, 12)
                                .background(Color(hex: "07A5C3"))
                                .cornerRadius(25)
                                .shadow(color: Color(hex: "3A6EA5").opacity(0.6), radius: 2, x: 0, y: 3)
                        }
                        .padding(.top,30)
                        .padding(.bottom,20)
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


#Preview {
    JoinPrivateRoom()
}

