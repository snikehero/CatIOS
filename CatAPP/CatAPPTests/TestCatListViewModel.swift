//
//  TestCatListViewModel.swift
//  CatAPPTests
//
//  Created by Moises Lopez on 19/09/23.
//

import XCTest
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
        let coreData = CoreDataManager.shared
        let catsData = coreData.fetchAllCats()
        // Act
        viewModel.transformData(petModel: catsData)
        let transformedPets = viewModel.pets
        print("TRANSFORMED PETS")
        print(transformedPets)

        // Assert
        

    }

}
