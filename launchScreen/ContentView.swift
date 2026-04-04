//
//  ContentView.swift
//  launchScreen
//
//  Created by Arjun Rana on 01/04/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
   
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack{
            if isOnboardingViewActive{
                OnboardingView()
            }else{
                HomeView()
                    .modelContainer(for: [cardModel.self])
            }
        }
    }
}

#Preview {
    ContentView()
}
