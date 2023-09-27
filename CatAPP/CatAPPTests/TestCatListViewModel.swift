//
//  TestCatListViewModel.swift
//  CatAPPTests
//
//  Created by Moises Lopez on 19/09/23.
//

import XCTest
import CoreData
@testable import CatAPP
final class TestCatListViewModel: XCTestCase {

    func test_UpdateArray_petWasAdded() {
        // Arrange
        let viewModel = CatListViewModel()
        let catToAdd = PetDetail.mockJojo
        // Act
        viewModel.updateArray(singlePet: catToAdd)
        let cats = viewModel.pets
        // Assert
        XCTAssertEqual(cats.count, 1)
    }

    func test_TransformData_CatCanBeTransformed() {
        // Arrange
        let viewModel = CatListViewModel()
        let coreDataManager = CoreDataManager(modelName: "CatAPP", storeType: StoreTypes.NSInMemoryStoreType)
        coreDataManager.loadStore()
        let catToSave = PetDetail.mockJojo
        coreDataManager.saveCat(singlePet: catToSave, vaccines: catToSave.vaccines)
        let catsData = coreDataManager.fetchAllCats()
        // Act
        viewModel.transformData(petModel: catsData)
        let transformedPets = viewModel.pets
        // Assert
        XCTAssertEqual(transformedPets.isEmpty, false)
    }

}
