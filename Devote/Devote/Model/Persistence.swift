//
//  Persistence.swift
//  Devote
//
//  Created by Myron on 1/1/22.
//

import CoreData

struct PersistenceController {
    //MARK: - 1. PERSISTENT CONTROLLER
    //This instance step up the model, context and storecortinator
    static let shared = PersistenceController()
    //MARK: - 2. PERSISTENT CONTAINER
    //Perffered way to initilize core data stack and load it later
    let container: NSPersistentContainer
    //MARK: - 3. INITIALIZATION (load the persistance store)
    /*
     1- Start by referring our Pcontainer to Core Data Store  "Devote"
     2- In Memomry (Important): When we configure information into memory rather than disk
                                meaning: All Changes you make get thrown away when your program ends
     3- Path to temp storage, good for unit testing and preview
     4- Load the Pstore or temp by using erro handeling
     */
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Devote")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    //MARK: - 4. PREVIEW
    //Set configuration for swiftui preview
    static var preview: PersistenceController = {
        //Switch to in Memory store (Enabling us to use any sample data)
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<5 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = "Sample task No.\(i)"
            newItem.completion = false
            newItem.id = UUID()
        }
        //Save data to in Memory store
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
