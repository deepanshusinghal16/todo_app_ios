//
//  TLButton.swift
//  todoList
//
//  Created by Aakash Kumar on 13/05/24.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let background: Color
    let action : ()->Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius:10)
                    .foregroundColor(background)
                Text(title)
                    .bold()
                    .foregroundColor(Color.white)
            }
        }
    }
}

#Preview {
    TLButton(title: "Value", background: .pink){}
}
