//
//  CoreDataManager.swift
//  CatAPP
//
//  Created by Moises Lopez on 21/08/23.
//

import CoreData
import SwiftUI
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

    lazy var backgroundContext = persistenceContainer.newBackgroundContext()

    func load() {
        persistenceContainer.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                fatalError(String(describing: error?.localizedDescription))
            }
            print(storeDescription)
        }

    }

    func configureContext() {
        viewContext.automaticallyMergesChangesFromParent = true
        backgroundContext.automaticallyMergesChangesFromParent = true
        backgroundContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        backgroundContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
    }

    func save() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
    }

}

extension CoreDataManager {
    func createDefaultItem() {
        let defaultCat = Cat(context: viewContext)
        defaultCat.name = "Jojo"
        defaultCat.year = 5
        defaultCat.appointment = Date.now
        defaultCat.breed = "Electrico"
        do {
            try viewContext.save()
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }

    func saveCat(singlePet: PetDetail, vaccines: [PetVaccineModel]) {
        let newCat = Cat(context: viewContext)
        newCat.identifier = singlePet.id
        newCat.name = singlePet.name
        newCat.year = Int32(singlePet.petYear)
        newCat.appointment = singlePet.appointment
        newCat.breed = singlePet.breed
        vaccines.forEach { vaccineModel in
            let newVaccineEntry = Vaccine(context: viewContext)
            newVaccineEntry.vaccineName = vaccineModel.vaccineName
            newVaccineEntry.vaccineDate = vaccineModel.vaccineDate
            newVaccineEntry.cat = newCat
            newCat.addToVaccine(newVaccineEntry)
        }
        do {
            try viewContext.save()
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }

    func fetch() -> [Cat] {
        let fetchRequest = Cat.fetchRequest()
        if let result = try? self.viewContext.fetch(fetchRequest) {
            print("RESULTADO DE GATO \(result.description)")
            return result
        } else {
            return []
        }
    }

    func updateData(singlePet: PetDetail, identifier: String) {
        let fetchRequest = Cat.fetchRequest()
        let predicate = NSPredicate(format: "identifier BEGINSWITH %@", singlePet.id)
        fetchRequest.predicate = predicate
        backgroundContext.perform {
            if let catObject = try? self.backgroundContext.fetch(fetchRequest).first {
                catObject.name = singlePet.name
                catObject.appointment = singlePet.appointment
                catObject.breed = singlePet.breed
                catObject.year  = Int32(singlePet.petYear)
                try? self.backgroundContext.save()
            }
        }
    }

    func removeData(singlePet: PetDetail) {
        let fetchRequest = Cat.fetchRequest()
        let predicate = NSPredicate(format: "identifier BEGINSWITH %@", singlePet.id)
        fetchRequest.predicate = predicate
        backgroundContext.perform {
            if let catObject = try? self.backgroundContext.fetch(fetchRequest).first {
                self.backgroundContext.delete(catObject)
                try? self.backgroundContext.save()
            }
        }
    }
}
