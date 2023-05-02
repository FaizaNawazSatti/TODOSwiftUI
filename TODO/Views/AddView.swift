//
//  AddView.swift
//  TODO
//
//  Created by Azmat Ali Akhtar on 29/03/2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText : String = ""
    var body: some View {
        ScrollView{
            VStack{
                TextField("type something here...", text: $textFieldText)
                    .padding()
                   // .textFieldStyle(.roundedBorder)
                    .background(Color.secondary.opacity(0.3).cornerRadius(20))
//
                    .font(.headline)
                
                Button {
                   
                    saveButtonPressed()
                } label: {
                    Text("save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textIsAppropriate() ? Color.blue : Color.gray)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        .font(.headline)
                    
                }.disabled(!textIsAppropriate())
            }.padding(14)
            
        }.navigationTitle("Add item 🖋️ ")
    }
    func textIsAppropriate() -> Bool{
        return (textFieldText.count >= 3) ? true : false
    }
    func saveButtonPressed(){
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
       
    }
}
