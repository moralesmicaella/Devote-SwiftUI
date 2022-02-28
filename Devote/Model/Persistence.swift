//
//  Persistence.swift
//  Devote
//
//  Created by Micaella Morales on 2/26/22.
//

import CoreData

struct PersistenceController {
  // MARK: - PERSISTENT CONTROLLER
  static let shared = PersistenceController()
  
  // MARK: - PERSISTENT CONTAINER
  let container: NSPersistentContainer
  
  // MARK: - INITIALIZATION (load the persistent store)
  init(inMemory: Bool = false) {
    container = NSPersistentContainer(name: "Devote")
    if inMemory {
      container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }
    container.viewContext.automaticallyMergesChangesFromParent = true
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
  }
  
  // MARK: - PREVIEW
  static var preview: PersistenceController = {
    let result = PersistenceController(inMemory: true)
    let viewContext = result.container.viewContext
    for i in 0..<5 {
      let newItem = Item(context: viewContext)
      newItem.id = UUID()
      newItem.task = "Sample task No\(i)"
      newItem.completion = false
      newItem.timestamp = Date()
    }
    do {
      try viewContext.save()
    } catch {
      let nsError = error as NSError
      fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    }
    return result
  }()
}
