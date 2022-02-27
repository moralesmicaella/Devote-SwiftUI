//
//  DevoteApp.swift
//  Devote
//
//  Created by Micaella Morales on 2/26/22.
//

import SwiftUI

@main
struct DevoteApp: App {
  let persistenceController = PersistenceController.shared
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
  }
}
