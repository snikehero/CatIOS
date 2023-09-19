//
//  TestCoreDataManager.swift
//  CatAPPTests
//
//  Created by Moises Lopez on 18/09/23.
//

import XCTest
@testable import CatAPP
import CoreData
final class TestCoreDataManager: TestCoreDataStack {

    func test_SaveCat_CatHasBeenSaved() {
        // Recibe los datos de la ui y crea el objeto de gato que se puede guardar en CoreData
        // Arrange
        let coreDataManager = CoreDataManager.shared
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
        let coreDataManager = CoreDataManager.shared
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
        let coreDataManager = CoreDataManager.shared
        let singleCat = PetDetail.mockMica
        coreDataManager.saveCat(singlePet: singleCat, vaccines: singleCat.vaccines)
        let catsBeforeDeletion = coreDataManager.fetchAllCats()
        print(catsBeforeDeletion.count)
        // Act
        coreDataManager.removeCat(singlePet: singleCat)
        let catsAfterDeletion = coreDataManager.fetchAllCats()
        coreDataManager.save()
        // Assert
        XCTAssertNotEqual(catsBeforeDeletion.count, catsAfterDeletion.count)
    }

}
