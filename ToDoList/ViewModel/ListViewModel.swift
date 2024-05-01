//
//  ListViewModel.swift
//  ToDoList
//
//  Created by macOS on 29/04/2024.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [itemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemKey: String = "item_list"
    init() {
        getItem()
    }
    func getItem(){
//        let newItem = [
//        itemModel(title: "This is the firts item", isComplete: false),
//        itemModel(title: "This is the 2 item", isComplete: true),
//        itemModel(title: "This is the 3 item", isComplete: false)
   // ]
        guard
                let data = UserDefaults.standard.data(forKey: itemKey),
                let saveItems = try? JSONDecoder().decode([itemModel].self, from: data)
        else { return }
        
        self.items = saveItems
        
       // items.append(contentsOf: data)
    }
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
//        saveItems()
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
//        saveItems()
    }
    func addItem(title: String){
        let newItem = itemModel(title: title, isComplete: false)
        items.append(newItem)
//        saveItems()
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
//        saveItems()
    }
    func saveItems() {
        // Mã hóa mảng 'items' thành dữ liệu JSON.
        if let encodedData = try? JSONEncoder().encode(items) {
            // Lưu dữ liệu đã mã hóa vào UserDefaults với key là "item_list".
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }

}
