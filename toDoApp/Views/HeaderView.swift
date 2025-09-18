//
//  HeaderView.swift
//  toDoApp
//
//  Created by ilymily on 7.09.2025.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack{
            Text("Noted")
                .padding(.top, 30)
                .font(.system(size: 50, weight: .bold)) // istediğin kadar büyütebilirsin
                .foregroundStyle(.primary)
            Image("logo2")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                
        }
        .padding(.bottom, 60)
    }
}

#Preview {
    HeaderView()
}
