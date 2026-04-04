//
//  OnboardingView.swift
//  launchScreen
//
//  Created by Arjun Rana on 01/04/26.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 30 // it is get the full width of the device
    @State private var buttonOffset: CGFloat = 0
    
    var body: some View {
        ZStack() {
            Image("backgroundimg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
          
            LinearGradient(
                    gradient: Gradient(colors: [.clear, .black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            LinearGradient(
                    gradient: Gradient(colors: [.clear, .black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            
            ZStack {
                Image(systemName: "motorcycle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                    .padding(.top, 20)
                    .padding(.leading, 20)
            }.offset(x: 155  , y: -400)
                   
            
            VStack(spacing: 0) {
                // Add onboarding content here
                Spacer()
               
                
                VStack {
                    Text("SAFETY NEVER GOES OUT OF STYLE").font(.system(size: 32, weight: .heavy, design: .serif)).foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [.white, .gray]),
                            startPoint: .top,
                            endPoint: .bottom
                        )).frame( height: 77).multilineTextAlignment(.center)
                    
                    
                    Text("Ride safer with premium helmets designed for protection, cofort, and performance").foregroundColor(.white).multilineTextAlignment(.center).fontDesign(.none)
                }.frame(width: 350 )
                    .padding(.bottom , 70)
                   
                ZStack{
                    Capsule().fill(Color("fontbig"))
                    HStack {
                        Spacer()
                        Spacer()
                        Text("Safe Riding").foregroundColor(.white).fontDesign(.default).font(.system(size: 18 ))
                        Spacer()
                       // Image(systemName: "chevron.right").foregroundColor(.gray)
                        //Image(systemName: "chevron.right").foregroundColor(Color(""))
                        Image(systemName: "chevron.right.dotted.chevron.right").foregroundColor(.white)
                        
                    }.padding(.trailing , 20)
                    HStack{
                        
                        Capsule().fill(Color("white")).frame(width: buttonOffset + 80 , height: 72)
                        Spacer()
                    }
                   
                //Circle
                    HStack {
                        ZStack{
                            Circle().fill(Color("white"))
                            Group{ Image("hellmate2").resizable().frame(width: 40 , height: 40)}
                        }.frame(width: 82 , height: 72 )
                            .offset(x: buttonOffset)
                            .gesture(
                                DragGesture()
                                    .onChanged{
                                        gesture in if gesture.translation.width > 0  && buttonOffset <= buttonWidth - 80{
                                            buttonOffset = gesture.translation.width
                                        }
                                    }.onEnded({ _ in
                                        if buttonOffset > buttonWidth/2{
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        }else if buttonOffset < buttonWidth / 2 {
                                            buttonOffset = 0
                                        }
                                        
                                        
                                    })
                            )
                        Spacer()
                    }
               
                }.frame(width: buttonWidth, height: 80)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
