//
//  MarvelApp.swift
//  Marvel
//
//  Created by Enrique Poyato Ortiz on 27/3/23.
//

import SwiftUI

@main
struct MarvelApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var rootViewModel = HeroViewModel()

    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(rootViewModel)
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
