//
//  ListView.swift
//  ToDoList
//
//  Created by macOS on 26/04/2024.
//

import SwiftUI

struct ListView: View {
    
  
    @EnvironmentObject var listViewModel: ListViewModel
    
//    @State var items: [itemModel] = [
//        itemModel(title: "This is the firts item", isComplete: false),
//        itemModel(title: "This is the 2 item", isComplete: true),
//        itemModel(title: "This is the 3 item", isComplete: false)
//    ]
    
    var body: some View {
        List{
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List")
        .navigationBarItems(leading: EditButton(),
        trailing:
            NavigationLink("Add", destination: AddView())
        )
    }
//    func deleteItem(indexSet: IndexSet) {
//        items.remove(atOffsets: indexSet)
//    }
//    func moveItem(from: IndexSet, to: Int){
//        items.move(fromOffsets: from, toOffset: to)
//    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
        
    }
}


