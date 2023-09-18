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

    func test_SaveCat_CatHasBeenSaved() { // Recibe los datos de la ui y crea el objeto de gato que se puede guardar en CoreData

        // Arrange
        let context = TestCoreDataStack().managedObjectContext
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
}
