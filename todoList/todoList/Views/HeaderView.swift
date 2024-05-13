//
//  HeaderView.swift
//  todoList
//
//  Created by Aakash Kumar on 13/05/24.
//

import SwiftUI

struct HeaderView: View {
    
    let title:String
    let subtitle:String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(title)
                    .foregroundColor(Color.white)
                    .font(.system(size: 50))
                    .bold()
                
                Text(subtitle)
                    .foregroundColor(Color.white)
                    .font(.system(size: 40))
            }
            .padding(.top,80)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 350)
        .offset( y: -150)
    }
}

#Preview {
    HeaderView(title: "title", subtitle: "subtitle", angle: 15, background: Color.pink)
}
