//
//  ListRowView.swift
//  ToDoList
//
//  Created by macOS on 26/04/2024.
//

import SwiftUI

struct ListRowView: View {
    let item: itemModel
    var body: some View {
        HStack {
            Image(systemName: item.isComplete ? "checkmark.circle" : "circle")
                .foregroundColor(item.isComplete ? .green : .red)
            Text(item.title)
            Spacer()
            
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = itemModel(title: "item 1", isComplete: false)
    static var item2 = itemModel(title: "item 2", isComplete: false)
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
    }
}

