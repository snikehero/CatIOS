//
//  CoreDataManager.swift
//  CatAPP
//
//  Created by Moises Lopez on 21/08/23.
//

import CoreData

class CoreDataManager {
    private let persistenceContainer: NSPersistentContainer

    init(modelName: String) {
        self.persistenceContainer = NSPersistentContainer(name: modelName)
    }
    var viewContext: NSManagedObjectContext {
        return persistenceContainer.viewContext
    }
    func load() {
        persistenceContainer.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                fatalError(String(describing: error?.localizedDescription))
            }
            print(storeDescription)
        }
    }
}

extension CoreDataManager {
    func createDefaultItem() {
        let defaultCat = Cat(context: viewContext)
        defaultCat.name = "Jojo"
        defaultCat.age = 5
        defaultCat.appointment = Date.now
        defaultCat.breed = "Electrico"
        do {
            try viewContext.save()
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }

    func saveCat(name: String, year: Int, appointment: Date, breed: String) {
        let newCat = Cat(context: viewContext)
        newCat.name = name
        newCat.age = Int32(year)
        newCat.appointment = appointment
        newCat.breed = breed
        do {
            try viewContext.save()
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}
