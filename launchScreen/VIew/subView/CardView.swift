//
//  CardView.swift
//  launchScreen
//
//  Created by Arjun Rana on 01/04/26.
//

import SwiftUI

struct CardView: View {
    @State private var showModel: Bool = false
    var card : cardModel
    var body: some View {
    
            
        ZStack(alignment: .bottom) {

            Rectangle().onTapGesture { showModel = true }
                .cornerRadius(40).shadow(color: .gray, radius: 9)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(card.color1), Color(card.color2)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

            VStack {
                HStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("transparentBlack"))
                            .frame(width: 90, height: 40)
                            .cornerRadius(15)

                        Text("₹\(card.price)")
                            .font(.system(size: 18, weight: .semibold)).foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.horizontal)

                Spacer()
            }

            Image(card.image)
                .resizable()
                .frame(width: 220, height: 220)
                .padding(.bottom, 50)
                .onTapGesture { showModel = true }

            HStack {
                VStack(alignment: .leading) {
                    Text(card.name)
                        .font(.system(size: 26, weight: .bold, design: .serif))
                        .foregroundColor(Color("card5"))

                    Text(card.subline)
                        .font(.system(size: 20, weight: .bold, design: .serif))
                        .foregroundColor(Color("logobackground"))
                }

                Spacer()

                Image(systemName: "bag.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    
            }
            .padding()
        }
        .frame(width: 390, height: 290)
        .sheet(isPresented: $showModel) {
            DetailView(card: self.card, cartt: CartModel())
        }
        }
    
}

#Preview(traits: .sizeThatFitsLayout) {
    CardView(card: CardData[0])
}
