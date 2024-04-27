//
//  itemModel.swift
//  ToDoList
//
//  Created by macOS on 27/04/2024.
//

import Foundation

struct itemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isComplete: Bool
}
