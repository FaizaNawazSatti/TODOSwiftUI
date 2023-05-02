//
//  ItemsModel.swift
//  TODO
//
//  Created by Azmat Ali Akhtar on 29/03/2023.
//

import Foundation
//immmutable struct
struct ItemModel : Identifiable , Codable{
    let id: String
    let title : String
    let isCompleted : Bool
    init(id : String = UUID().uuidString ,title: String, isCompleted: Bool) {
        self.title = title
        self.id = id
        self.isCompleted = isCompleted
    }
    func updateCompletion() -> ItemModel{
        return ItemModel(id : id, title: title, isCompleted: !isCompleted)
    }
}
