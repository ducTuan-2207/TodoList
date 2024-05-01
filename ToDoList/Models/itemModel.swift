//
//  itemModel.swift
//  ToDoList
//
//  Created by macOS on 27/04/2024.
//

import Foundation

struct itemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isComplete: Bool
    
    init(id: String = UUID().uuidString , title: String, isComplete: Bool) {
        self.id = id
        self.title = title
        self.isComplete = isComplete
    }
    
    func updateCompletion() -> itemModel {
        return itemModel(id: id ,title: title, isComplete: !isComplete)
    }
}
