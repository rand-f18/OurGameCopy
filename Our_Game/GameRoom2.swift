//
//  GameRoom2.swift
//  Our_Game
//
//  Created by Fai Alharthi on 10/11/1446 AH.
//


import SwiftUI

struct GameRoom2: View {
    let allElements = ["Camal", "Kabba", "man", "Dallah", "dates", "Desert", "Falcon", "Gecko", "metro", "Misbaha", "plam", "Riyal"]
    
    let columns = [
        GridItem(.flexible()),  // أول عمود مرن
        GridItem(.flexible()),  // ثاني عمود مرن
        GridItem(.flexible())   // ثالث عمود مرن
    ]

    var body: some View {
        ZStack{
            RadialGradient(
                gradient: Gradient(colors: [.centerColor, .edgeColor]),
                center: .center,
                startRadius: 20,
                endRadius: 500
            )
            .ignoresSafeArea()
            
            VStack{
                HStack(spacing:0){
                    VStack{
                        ZStack{
                            Circle().fill(Color(.lightBeige)).stroke(Color(#colorLiteral(red: 0.039, green: 0.584, blue: 0.741, alpha: 1)), lineWidth: 4).frame(width: 50, height: 50)
                            Image(systemName:"door.right.hand.open").resizable().frame(width: 22, height: 30).foregroundColor(Color(.red))
                        }.frame(height:35).padding(.top,120).padding(.trailing,5)
                        Text("خروج").font(.system(size: 12, weight:.bold, design: .rounded)).foregroundColor(Color.red).padding(.top,2)
                    }
                    ZStack{
                        Circle().trim(from:0.0 ,to:0.5).fill(Color(#colorLiteral(red: 0.039, green: 0.584, blue: 0.741, alpha: 1))).stroke(Color.lightBeige, lineWidth: 4).frame(width: 300, height: 250).padding(.trailing,60).padding(.bottom,60)
                        Text("Danah").font(.system(size: 26, weight:.regular, design: .rounded)).foregroundColor(Color.white).padding(.trailing,60).padding(.top,150)
                    }.frame(width:300,height: 200)
                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 50).fill(Color(.lightBeige)).frame(width:290, height:480).padding(.vertical,5)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(allElements.shuffled(), id: \.self) { element in  // استخدام shuffled لتغيير ترتيب الصور عشوائيًا
                            Image(element)  // افترض أن الصور موجودة في أصول المشروع
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 90)
                        }
                    }
                    .padding(.top, 10)
                    
                    
                }.frame(width:280, height:470)
                
                HStack {
                    ZStack {
                        Circle()
                            .fill(Color(#colorLiteral(red: 0.039, green: 0.584, blue: 0.741, alpha: 1)))
                            .stroke(Color.lightBeige, lineWidth: 4)
                            .frame(width: 550, height: 255)
                            .padding(.bottom,80)
                            .padding(.top,5)
                        
                        // Text "Fai" في أعلى الدائرة
                        Text("Fai")
                            .font(.system(size: 26, weight:.regular, design: .rounded))
                            .foregroundColor(Color.white)
                            .padding(.bottom,290)
                        
                        // عرض 6 صور عشوائيًا داخل الدائرة
                        LazyVGrid(columns: columns, spacing: 40) {
                            ForEach(allElements.shuffled().prefix(6), id: \.self) { element in  // عرض أول 6 صور فقط عشوائيًا
                                Image(element)  // افترض أن الصور موجودة في أصول المشروع
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                            }
                        }.frame(width: 190, height: 180)
                        
                    }
                }
                Spacer()
            }.padding(.bottom,50)
            
            HStack(spacing:260){
                ZStack{
                    Circle().fill(Color(.systemOrange)).stroke(Color.lightBeige, lineWidth: 4).frame(width: 300, height: 250)
                    Text("نورة").font(.system(size: 26, weight:.regular, design: .rounded)).foregroundColor(Color.white).rotationEffect(.degrees(90)).padding(.leading,200)
                }
                ZStack{
                    Circle().fill(Color(.systemRed)).stroke(Color.lightBeige, lineWidth: 4).frame(width: 300, height: 250)
                    Text("Saad").font(.system(size: 26, weight:.regular, design: .rounded)).foregroundColor(Color.white).rotationEffect(.degrees(-90)).padding(.trailing,200)
                }
                
            }.padding(.bottom,90)
        }
        
            
         
        
    }
}

#Preview {
    GameRoom2()
}
