//
//  SearchTextFied.swift
//  launchScreen
//
//  Created by Arjun Rana on 02/04/26.
//

import SwiftUI

struct SearchTextFied: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State var searchtext : String = ""
    @State var showCart : Bool = false
    @StateObject var cart = CartModel(cartItems: [])
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "magnifyingglass.circle.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color("HomeViewbackground"))
                TextField("Searching helmets..." , text: $searchtext).foregroundColor(.gray)
            }.font(.subheadline).padding().background(
                RoundedRectangle(cornerRadius: 90)
                    .shadow(color: .gray, radius: 13)
            ).frame(width: 300 ).foregroundColor(.white)
            ZStack {
               
                    Circle().fill(.white)
                Image(systemName: "duffle.bag.fill").resizable().frame(width: 32 , height: 30).gesture(TapGesture().onEnded{
                  showCart = true
                }
               )
                
            }
        }.sheet(isPresented: $showCart){
            CartView(cart: cart)
        }
    }
}

#Preview {
    SearchTextFied()
}
