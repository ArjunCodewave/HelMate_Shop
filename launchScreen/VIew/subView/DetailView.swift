//
//  DetailView.swift
//  launchScreen
//
//  Created by Arjun Rana on 02/04/26.
//

import SwiftUI

struct DetailView: View {
        
   var card : cardModel
    @State private var size : Bool = true
    @State private var selectedSize: String = "Medium"
    @State private var isFavorite: Bool = false
    @State private var AddColor: Bool = false
    @State private var pulsate: Bool = false
    @ObservedObject var cartt: CartModel
    var body: some View {
        ZStack {
            
            // Background
            LinearGradient(
                gradient: Gradient(colors: [Color(card.color1), Color(card.color2)]),
                startPoint: .top,
                endPoint: .bottom
            )
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                // 🔹 Top Bar
                HStack {
                    
                    
                    Spacer()
                    
                    HStack(spacing: 6) {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 8, height: 8)
                        Text("In Stock")
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                    
                        
                    
                }
                .padding(.horizontal)
                .padding(.vertical, 5)
                
                // 🔹 Title
                VStack(spacing: 5) {
                    Text(card.subline)
                        .font(.system(size: 30, weight: .bold, design: .serif))
                        .font(.title2)
                        .fontWeight(.bold)
                        .shadow(color: .gray ,radius: 7)
                    
                    Text(card.randomnum)
                        .font(.system(size: 14 , weight: .semibold))
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                VStack{Spacer()
                  
                }
                // 🔹 Helmet Image
                
                
                
                HStack {
                    Spacer()
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .red : .primary)
                    
                        .onTapGesture {
                            isFavorite.toggle()
                        }
                        .scaleEffect(self.pulsate ? 1.2 : 0.8 , anchor: .center).animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                    
                    
                }.padding(.trailing , 15)
                
            
                ZStack {
                    
                    Image(card.image) // use your image
                        .resizable()
                        .scaledToFit()
                        
                }.frame(height: size ? 190 : 220)
               VStack{Spacer()}
                // 🔹 Size Selector + Price
                HStack {
                    
                    // Sizes
                    VStack(spacing: 10) {
                        SizeButton(title: "Small", selected: selectedSize == "Small"){
                            selectedSize = "Small"
                            size = true
                        }
                        
                        SizeButton(title: "Medium", selected: selectedSize == "Medium") {
                            selectedSize = "Medium"
                            size = true
                        }
                        
                        SizeButton(title: "Big", selected: selectedSize == "Big") {
                            selectedSize = "Big"
                            size = false
                        }
                    }
                    
                    Spacer()
                    
                    // Price
                    VStack(spacing: 5) {
                        Text("Price")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text("₹\(card.price)")
                            .font(.title)
                            .fontWeight(.bold)
                    }.padding(.trailing , 33)
                  
                    Spacer()
                    
                    // Small previews
                    VStack(spacing: 10) {
                        ZStack{
                            Circle()
                                .fill(Color.white)
                                .frame(width: 40, height: 40)
                            Image("hellmate2").resizable().frame(width: 22, height: 22, alignment: .center)
                        }
                        
                        ZStack{
                            Circle()
                                .fill(Color.white)
                                .frame(width: 40, height: 40)
                            Image("hellmatemirro").resizable().frame(width: 22, height: 22, alignment: .center)
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // 🔹 Swipe Text
                Text("Get it Bro...")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                // 🔹 Button
                Button {
                   
                } label: {
                    HStack {
                        Spacer()
                        Button ( action:{
                            
                            //cartt.addtoCart(<#T##product: cardModel##cardModel#>)
                        }
                        ){
                            
                            Text("Add to Cart").fontDesign(.rounded).foregroundColor(AddColor ? Color.black : Color.white)
                            Spacer()
                        }
                        
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Capsule()
                            .fill(AddColor ? Color("card7") : Color.black)
                            .onTapGesture {
                                AddColor.toggle()
                            }
                    )
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
        .onAppear(){
            self.pulsate.toggle()
        }
    }
}

//---

//## 🔹 Reusable Size Button

struct SizeButton: View {
    var title: String
    var selected: Bool
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.caption)
                .padding(.vertical, 8)
                .frame(width: 70)
                .background(
                    Capsule()
                        .fill(selected ? Color.black : Color.white)
                )
                .foregroundColor(selected ? .white : .black)
        }
        
    }
}

#Preview {
    DetailView(card: cardModel(image: "helmate05",
                               name: "Ducati",
                               color1: "card9",
                               color2: "card8",
                               price: 39998, subline: "SkyArmor" ,
                               randomnum: "IJE Y88*5"
                              ), cartt: CartModel())
}

