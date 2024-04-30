//
//  ListViewModel.swift
//  ToDoList
//
//  Created by macOS on 29/04/2024.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [itemModel] = []
    init() {
        getItem()
    }
    func getItem(){
        let newItem = [
        itemModel(title: "This is the firts item", isComplete: false),
        itemModel(title: "This is the 2 item", isComplete: true),
        itemModel(title: "This is the 3 item", isComplete: false)
    ]
        items.append(contentsOf: newItem)
    }
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String){
        let newItem = itemModel(title: title, isComplete: false)
        items.append(newItem)
    }
    func updateItem(item: itemModel){
//        if let index = items.firstIndex { (existingItem ) -> Bool in
//            return existingItem.id == item.id
//        } {
//
//        }
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}
