//
//  CartModel.swift
//  launchScreen
//
//  Created by Arjun Rana on 03/04/26.
//

import SwiftUI
import SwiftData
import Combine


class CartModel: ObservableObject {
    @Published var  cartItems: [cardModel] = []
    
    init(cartItems: [cardModel] = []) {
        self.cartItems = cartItems
    }
    
    func addtoCart(_ product : cardModel){
       
            cartItems.append(product)
        
    }
    
    func removeFromCart(_ product: cardModel) {
       
            cartItems.removeAll { $0.id == product.id }
        
    }
    
    func clearCart() {
       
            cartItems.removeAll()
        
    }
     
    var totalPrice: Double {
        Double(cartItems.reduce(0) { $0 + $1.price })
    }

}
