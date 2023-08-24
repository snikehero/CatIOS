//
//  CoreDataManager.swift
//  CatAPP
//
//  Created by Moises Lopez on 21/08/23.
//

import CoreData

class CoreDataManager {
    private let persistenceContainer: NSPersistentContainer
    static let shared : CoreDataManager = {
       let coreDataManager = CoreDataManager(modelName: "CatAPP")
        coreDataManager.load()
        return coreDataManager
    }()

    private init(modelName: String) {
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

    func save() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                // Show some error here
            }
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

    func saveCat(singlePet: PetDetail) {
        let newCat = Cat(context: viewContext)
        newCat.name = singlePet.name
        newCat.age = Int32(singlePet.petYear)
        newCat.appointment = singlePet.appointment
        newCat.breed = singlePet.breed
        do {
            try viewContext.save()
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }

    func fetch() -> [Cat] {
        let fetchRequest = Cat.fetchRequest()
        if let result = try? self.viewContext.fetch(fetchRequest) {
            return result
        } else {
            return []
        }
    }

}
