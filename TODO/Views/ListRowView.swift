//
//  ListRowView.swift
//  TODO
//
//  Created by Azmat Ali Akhtar on 29/03/2023.
//

import SwiftUI

struct ListRowView: View {
    let item : ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
                .bold()
            Text(item.title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "first", isCompleted: false)
    static var item2 = ItemModel(title: "second", isCompleted: true)
    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }.previewLayout(.sizeThatFits)
    }
}
