//
//  CartView.swift
//  launchScreen
//
//  Created by Arjun Rana on 03/04/26.
//

import SwiftUI
import SwiftData
struct CartView: View {
    @ObservedObject var cart: CartModel
   
    var body: some View {
        
        VStack {
            if cart.cartItems.isEmpty {
                Text("Your cart is empty")
                    .font(.title)
                    .padding()
            } else {
                List {
                    ForEach(cart.cartItems) { product in
                        HStack {
                            Image(product.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                                .transition(.scale)
                            
                            VStack(alignment: .leading) {
                                Text(product.name)
                                Text("\(product.price, specifier: "%.2f")$")
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Button(action: { cart.removeFromCart(product) }) {
                                Image(systemName: "trash.fill")
                                    .foregroundColor(.red)
                                    .transition(.opacity)
                            }
                        }
                        .padding()
                        .animation(.easeInOut, value: cart.cartItems.count)
                    }
                }.navigationTitle("Cart")
                .toolbar {
                    Text("Total: \(cart.totalPrice, specifier: "%.2f")$")
                        .bold()
                        .transition(.opacity)
                }
                
               
                
            }
        }
   }
}
    


#Preview {
    CartView(cart: CartModel(cartItems: [
        cardModel(
            image: "helmate04",
            name: "Suzuki",
            color1: "card13",
            color2: "card14",
            price: 14758, subline: "StormShell" ,
            randomnum: "JCV-R3205"
        )]
    )
)
}
