//
//  TestCatDetailViewModel.swift
//  CatAPPTests
//
//  Created by Moises Lopez on 20/09/23.
//

import XCTest
@testable import CatAPP
import CoreData
final class TestCatDetailViewModel: XCTestCase {

    func test_saveData_DataCanbeSaved() {
        // Verificar que un gato se puede crear y guardar en PetDetail, para posteriormente
        // agregarse a coredata, se podria probar verificando que existe el objeto en CoreData
        // Arrange
        let coreDataManager = CoreDataManager(modelName: "CatAPP", storeType: StoreTypes.NSInMemoryStoreType)
        coreDataManager.loadStore()
        let catListViewModel = CatListViewModel()
        catListViewModel.transformData(petModel: coreDataManager.fetchAllCats())
        let catList = catListViewModel.pets
        let viewModel = CatDetailViewModel(catListViewModel: catListViewModel)
        let name = "Momito"
        let petAge = 4
        let catBreed = CatBreed.balinese
        let appointment = Date.now
        // Act
        viewModel.saveData(name: name, petAge: petAge, appointment: appointment, breed: catBreed.rawValue)
        let fetchedCat = coreDataManager.fetchSingleCat(singlePet: viewModel.singlePet)
        // Assert
        XCTAssertEqual(name, fetchedCat.name)
    }

    func test_CreateNewVaccine_VaccineCanBeCreated() {
        // Agregar un espacio en el arrglo de PetVaccines y PetVaccinesDate, se prueba verificando que el arreglo
        // contenga algo
        // Arrange
        let viewModel = CatDetailViewModel(catListViewModel: CatListViewModel())
        // Act
        viewModel.createNewVaccine()
        // Assert
        XCTAssertEqual(viewModel.petVaccines.count, 1)
        XCTAssertEqual(viewModel.petVaccinesDate.count, 1)
    }

    func test_AddToModel_VaccineCanBeAdded() {
        // Agregar una vacuna al arreglo de vacunas, verificar que la vacuna este dentro del arreglo
        // Arrange
        let viewModel = CatDetailViewModel(catListViewModel: CatListViewModel())
        viewModel.petVaccines.append("AIDS")
        viewModel.petVaccinesDate.append(Date.now)
        // Act
        viewModel.addToModel()
        // Assert
        XCTAssertEqual(viewModel.vaccines.count, 1)

    }
}
