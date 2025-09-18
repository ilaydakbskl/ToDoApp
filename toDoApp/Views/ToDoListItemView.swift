//
//  ToDoListItemView.swift
//  toDoApp
//
//  Created by ilymily on 7.09.2025.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.text)
                    .font(.title2)
                    .lineLimit(1)
                    .truncationMode(.tail)
                Text(Date(timeIntervalSince1970: item.date).formatted(date: .abbreviated, time: .omitted))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
            }
            Spacer()
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ?  "checkmark.circle.fill":"circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.primary)
                    .frame(width: 22, height: 22)
            }
            .buttonStyle(PlainButtonStyle()) // <-- Sadece ikon tıklanır


        }
        .padding()
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123", text: "Test", date: Date().timeIntervalSince1970, creatDate: Date().timeIntervalSince1970, isDone: true))
}
