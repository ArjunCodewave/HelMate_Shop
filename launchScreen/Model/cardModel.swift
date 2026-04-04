//
//  cardModel.swift
//  launchScreen
//
//  Created by Arjun Rana on 02/04/26.
//

import SwiftUI
import SwiftData

@Model
class cardModel : Identifiable {
    var id = UUID()
    var image : String
    var name : String
    var color1 : String
    var color2 : String
    var price : Int
    var subline : String
    var randomnum : String
    
    init(id: UUID = UUID(), image: String, name: String, color1: String, color2: String, price: Int, subline: String, randomnum: String) {
        self.id = id
        self.image = image
        self.name = name
        self.color1 = color1
        self.color2 = color2
        self.price = price
        self.subline = subline
        self.randomnum = randomnum
    }
    
    
}
