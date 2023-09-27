//
//  TestCoreDataManager.swift
//  CatAPPTests
//
//  Created by Moises Lopez on 18/09/23.
//

import XCTest
@testable import CatAPP
import CoreData
final class TestCoreDataManager: XCTestCase {
    func test_Save_ViewContextCanBeSaved() {
        // Arrange
        let coreDataManager = CoreDataManager(modelName: "CatAPP", storeType: NSInMemoryStoreType)
        coreDataManager.loadStore()
        // coreDataManager.loadInMemory()
        // Act
        coreDataManager.save()
        // Assert
        XCTAssertNoThrow(coreDataManager.save())
    }
    func test_SaveCat_CatHasBeenSaved() {
        // Recibe los datos de la ui y crea el objeto de gato que se puede guardar en CoreData
        // Arrange
        let coreDataManager = CoreDataManager(modelName: "CatAPP", storeType: NSInMemoryStoreType)
        coreDataManager.loadStore()
       // let coreDataManager = CoreDataManager.shared
        let singlePet = PetDetail.mockJojo
        // Act
        coreDataManager.saveCat(singlePet: singlePet, vaccines: singlePet.vaccines)
        // Jalar el objeto de coredata         // Asignarlo a otro objeto
        let fetchedCat = coreDataManager.fetchSingleCat(singlePet: singlePet)
        // Probar que lo recibido es igual a singlepet. Coredata.name == singlePet.name
        // Assert
        XCTAssertEqual(singlePet.name, fetchedCat.name)
        XCTAssertEqual(singlePet.petYear, Int(fetchedCat.year))
        XCTAssertEqual(singlePet.breed, fetchedCat.breed)
        XCTAssertEqual(singlePet.vaccines.count, 1)
    }
    func test_UpdateCat_CatCanBeUpdated() {
        // Recibir un gato que exista en CoreData, posterior a ello,
        // Realizar un update de algun dato, y guardarlo en Coredata, probar buscando ese dato.
        // Arrange
        let coreDataManager = CoreDataManager(modelName: "CatAPP", storeType: NSInMemoryStoreType)
        coreDataManager.loadStore()
        let singleCat = PetDetail.mockJojo
        coreDataManager.saveCat(singlePet: singleCat, vaccines: singleCat.vaccines)
        let newCat = PetDetail.mockMica
        let fetchCat = coreDataManager.fetchSingleCat(singlePet: singleCat)
        // Act
        let returnedCat = coreDataManager.updateCat(singleCat: fetchCat, newCat: newCat)
        coreDataManager.save()
        // Assert
        XCTAssertEqual(returnedCat.name, newCat.name)
    }

    func test_DeleteCat_CatCanBeDeleted() {
        // Fetchear un gato en CoreData, aplicar el borrado, verificar que no se puede fetchear otra vez.
        // Arrange
        let coreDataManager = CoreDataManager(modelName: "CatAPP", storeType: NSInMemoryStoreType)
        coreDataManager.loadStore()
        let singleCat = PetDetail.mockMica
        coreDataManager.saveCat(singlePet: singleCat, vaccines: singleCat.vaccines)
        // Act
        coreDataManager.removeCat(singlePet: singleCat)
        let catsAfterDeletion = coreDataManager.fetchAllCats()
        coreDataManager.save()
        // Assert
        XCTAssertNotEqual(1, catsAfterDeletion.count)
    }

    func test_FetchAllCats_CatsCanBeFetched() {
        // Probar si el arreglo de fetched cats no esta vacio.
        // Arrange
        let coreDataManager = CoreDataManager(modelName: "CatAPP", storeType: NSInMemoryStoreType)
        coreDataManager.loadStore()
        // Act
        let fetchedCats = coreDataManager.fetchAllCats()
        // Assert
        XCTAssertFalse(fetchedCats.isEmpty, "Fetched cat array has data")

    }
    func test_FetchAllCats_CatsCantBeFetched() {
        // Probar si el arreglo de fetched cats esta vacio
        // Arrange
        let coreDataManager = CoreDataManager(modelName: "asd", storeType: NSInMemoryStoreType)
        // Act
        let fetchedCats = coreDataManager.fetchAllCats()
        // Assert
        XCTAssertTrue(fetchedCats.isEmpty, "Fetched cat array is empty")

    }

}
