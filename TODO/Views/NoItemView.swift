//
//  NoItemView.swift
//  TODO
//
//  Created by Azmat Ali Akhtar on 30/03/2023.
//

import SwiftUI

struct NoItemView: View {
    @State var isAnimated : Bool = false
    var body: some View {
        ScrollView{
            
            VStack(spacing: 10){
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are yoou a productive person? I think you should click the add button and add a bunch of items in your todo list!! " )
                    .padding()
                NavigationLink(destination: AddView(), label: {
                    Text("Add something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(isAnimated ? Color("SecondaryColor") : Color.accentColor)
                        .cornerRadius(20)
                }).padding(.horizontal , isAnimated ? 30 : 50)
                    .shadow(
                        color: isAnimated ? Color("SecondaryColor").opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: isAnimated ? 30 : 10,
                        x: 0,
                        y: isAnimated ? 50 : 30)
                    .scaleEffect(isAnimated ? 1.1 : 1.0)
                    .offset(y : isAnimated ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
        
    }
    
    func addAnimation(){
        guard !isAnimated else {
            return
        }
        DispatchQueue.main.asyncAfter(deadline : .now() + 2) {
            withAnimation(.easeInOut(duration: 2.0).repeatForever()){
                isAnimated.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemView()
                .navigationTitle("title")
        }
       
    }
}
