//
//  TestCatCardContainerViewModel.swift
//  CatAPPTests
//
//  Created by Moises Lopez on 22/09/23.
//

import XCTest
@testable import CatAPP
import CoreData
final class TestCatCardContainerViewModel: XCTestCase {

    func test_DeleteFromCoreData_CanBeDeleted() {
        // La funcion borra el gato especifico de coredata,
        // Tambien borra el gato del arreglo de pets.
        // Se puede probar verificando que el arreglo de gatos contiene -1 elemento.
        // Arrange
        let catListVM = CatListViewModel()
        let coreData = CoreDataManager(modelName: "CatAPP", storeType: StoreTypes.NSInMemoryStoreType)
        coreData.loadStore()
        catListVM.transformData(petModel: coreData.fetchAllCats())
        let catCardViewModel = CatCardContainerViewModel(pets: catListVM.pets, manager: coreData)
        let catsBeforeDeletion = catCardViewModel.pets
        // Act
        catCardViewModel.deleteFromCoreData(at: IndexSet(integer: 0)) // Will delete the first item
        // Assert
        XCTAssertNotEqual(catCardViewModel.pets.count, catsBeforeDeletion.count)
    }

    func test_filteredCats_catsCanBeFiltered() {
        // La variable filtered cats sirve para ir filtrando el total de gatos depentiendo de searchText
        // Se puede probar, verificando si cuando searchText es vacio, retorna el arreglo completo
        // Cuando searchText tenga algo, el arreglo disminuira.
        // Arrange
        let catListVM = CatListViewModel()
        let coreData = CoreDataManager(modelName: "CatAPP", storeType: StoreTypes.NSInMemoryStoreType)
        coreData.loadStore()
        catListVM.transformData(petModel: coreData.fetchAllCats())
        let catCardViewModel = CatCardContainerViewModel(pets: catListVM.pets, manager: coreData)
        let catsBefore = catCardViewModel.filteredCats
        // Act
        catCardViewModel.searchText = "Mica"
        let filteredCats = catCardViewModel.filteredCats
        // Assert
        XCTAssertNotEqual(catsBefore.count, filteredCats.count)
    }

    func test_FilteredCats_CatsDontHaveAFilter() {
        // Cuando SearchText esta vacio, el filtro debe retornar directamente el arreglo completo de pets.
        // Arrange
        let catListVM = CatListViewModel()
        let coreData = CoreDataManager(modelName: "CatAPP", storeType: StoreTypes.NSInMemoryStoreType)
        coreData.loadStore()
        catListVM.transformData(petModel: coreData.fetchAllCats())
        let catCardViewModel = CatCardContainerViewModel(pets: catListVM.pets, manager: coreData)
        let catsBefore = catCardViewModel.filteredCats
        // Act
        catCardViewModel.searchText = ""
        let filteredCats = catCardViewModel.filteredCats
        // Assert
        XCTAssertEqual(filteredCats.count, catsBefore.count)
    }
}
