//
//  TODOApp.swift
//  TODO
//
//  Created by Azmat Ali Akhtar on 29/03/2023.
//

import SwiftUI
/*
 MVVM Architecture
 
 Model : data Point
 View : UI
 ViewModel : manages models for views
 
 */
@main
struct TODOApp: App {
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }.navigationViewStyle(.stack)
            .environmentObject(listViewModel)
            
        }
    }
}
