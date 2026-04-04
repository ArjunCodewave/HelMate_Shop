//
//  HomeView.swift
//  launchScreen
//
//  Created by Arjun Rana on 01/04/26.
//

import SwiftUI

struct HomeView: View {
    
    var card: [cardModel] = CardData
    var guid: [GuridModel] = guridData
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State var searchtext : String = ""
    var body: some View {
        ZStack{
            Color("HomeViewbackground").ignoresSafeArea()
            VStack(alignment: .leading){
               
                    Text("Choose").font(.system(size: 19 , design: .none))
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black , .gray]), startPoint: .top, endPoint: .bottom))
                        
                Text("FAVORITE HELMETS").font(.system(size: 35 , weight: .bold, design: .serif)).lineLimit(1)
                
               SearchTextFied()
                
                Text("Brands").padding(.top).font(.system(size: 18 , weight: .light , design: .rounded))
                
                VStack{
                    ScrollView(.horizontal , showsIndicators: false){
                        HStack
                        {
                            
                            ForEach(guid) { model in
                                Grid(gurid: model)
                            }
                            
                        }
                        
                    }
                    ScrollView(.vertical , showsIndicators: false){
                        VStack(spacing: 20) {
                               
                               ForEach(card) { item in
                                   
                                   CardView(card: item)
                               }
                        }
                    }.padding(.leading , -10)
                        
                }
                Spacer()
                
                 }.padding(.top , 3)
               .padding(.horizontal)
                .frame(width: 400 , alignment: .leading)
            
           
            
            
//        VStack(spacing: 20){
//            Text("Home")
//            .font(.largeTitle)
//            
//            Button(action: {
//                isOnboardingViewActive = true
//            }){
//                Text("restart")
//            }
//        }
        
        }
        
        
    }
}

#Preview {
    HomeView()
}
