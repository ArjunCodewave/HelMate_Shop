//
//  Grid.swift
//  launchScreen
//
//  Created by Arjun Rana on 01/04/26.
//

import SwiftUI

struct Grid: View {
    var gurid : GuridModel
    var body: some View {
        ZStack{
            
            Color("HomeViewbackground")
            Button{
                
            }
            label: { Rectangle().cornerRadius(20).foregroundColor(.white)
            }
        
                
                
                
            Circle().foregroundColor(.white).frame(width: 22)
                .offset(x: -30)
            Circle().foregroundColor(Color("logobackground")).frame(width: 20)
                .offset(x: -30)
            Image(gurid.image).resizable().frame(width: 10 , height: 10)
                .offset(x: -30)
            
            HStack{
                Spacer()
                Text(gurid.name).font(.system(size: 9 , weight: .bold)).lineLimit(1).frame(width: 40).foregroundColor(Color(.gray))
                Spacer()
            }
        }.frame(width: 100 ,height: 35 , alignment: .leading)
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Grid(gurid: guridData[0])
}
