//
//  CoreDataStack.swift
//  StudentOrganizer
//
//  Created by Jonash De Guia on 10/23/26.
//

import CoreData

/// Shared owner of the app's Core Data container and context.
final class CoreDataStack {
    static let shared = CoreDataStack()

    let container: NSPersistentContainer

    /// The context screens use to create, fetch, and change records.
    var context: NSManagedObjectContext {
        container.viewContext
    }

    private init() {
        // This name must match StudentOrganizer.xcdatamodeld.
        container = NSPersistentContainer(name: "StudentOrganizer")

        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Core Data failed to load: \(error)")
            }

            print("Database file: \(storeDescription.url?.path ?? "unknown")")
        }
    }

    /// Saves pending changes to the local database.
    func save() {
        guard context.hasChanges else { return }

        do {
            try context.save()
        } catch {
            print("Core Data save failed: \(error)")
        }
    }
}
