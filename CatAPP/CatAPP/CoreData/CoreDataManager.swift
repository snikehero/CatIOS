//
//  CoreDataManager.swift
//  CatAPP
//
//  Created by Moises Lopez on 21/08/23.
//

import CoreData
import SwiftUI

struct StoreTypes {
    static let NSSQLiteStoreType = "NsSQLiteStoreType"
    static let NSInMemoryStoreType = "NSInMemoryStoreType"
}

class CoreDataManager: ObservableObject {
    private let persistenceContainer: NSPersistentContainer

    let storeType: String

    init(modelName: String, storeType: String) {
        self.persistenceContainer = NSPersistentContainer(name: modelName)
        self.storeType = storeType
    }
    var viewContext: NSManagedObjectContext {
        return persistenceContainer.viewContext
    }

    func loadStore() {
        let persistenceStoreDescription = NSPersistentStoreDescription()
        persistenceStoreDescription.type = storeType
        persistenceContainer.loadPersistentStores { persistenceStoreDescription, error in
            guard error == nil else {
                fatalError(String(describing: error?.localizedDescription))
            }
            print(persistenceStoreDescription)
        }
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
        save()
    }

    func fetchAllCats() -> [Cat] {
        let fetchRequest = Cat.fetchRequest()
        if let result = try? self.viewContext.fetch(fetchRequest) {
            return result
        } else {
            return []
        }
    }

    func fetchSingleCat(singlePet: PetDetail) -> Cat {
        let fetchRequest = Cat.fetchRequest()
        let predicate = NSPredicate(format: "identifier BEGINSWITH %@", singlePet.id)
        fetchRequest.predicate = predicate
        let result = (try? self.viewContext.fetch(fetchRequest).first)!
        return result
    }

    func updateCat(singleCat: Cat, newCat: PetDetail) -> Cat {
        let catObject = fetchSingleCat(singlePet: singleCat.toPetDetail())
        catObject.name = newCat.name
        catObject.appointment = newCat.appointment
        catObject.breed = newCat.breed
        catObject.year = Int32(newCat.petYear)
        return catObject
    }

    func removeCat(singlePet: PetDetail) {
        let catObject = fetchSingleCat(singlePet: singlePet)
        self.viewContext.delete(catObject)
    }
}
