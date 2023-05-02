//
//  ListView.swift
//  TODO
//
//  Created by Azmat Ali Akhtar on 29/03/2023.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
               NoItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List {
                    ForEach(listViewModel.items) { index in
                        
                        ListRowView(item: index)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    listViewModel.updateItem(item: index)
                                }
                            }
                    } .onDelete(perform: listViewModel.delete)
                        .onMove(perform: listViewModel.onMove)
                    
                }.listStyle(.plain)
            }
        }
       .navigationTitle("TO DO List 📝 ")
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: {
               AddView()
            }))
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
               
        }.environmentObject(ListViewModel())
    }
}


