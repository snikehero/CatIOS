//
//  TestUpdateCatViewModel.swift
//  CatAPPTests
//
//  Created by Moises Lopez on 20/09/23.
//

import XCTest
@testable import CatAPP
import CoreData
final class TestUpdateCatViewModel: XCTestCase {

    func test_FillCatToUpload_CatCanBeFilled() {
        // La funcion llena el objeto CatToUpload, dada la informacion de SinglePet, verificar que
        // despues de que se haga la funcion, CatToUpload contenga lo mismo que SinglePet.
        // Arrange
        let catListViewModel = CatListViewModel()
        let viewModel = UpdateCatViewModel(catListViewModel: catListViewModel, identifier: "1")
        let testingCat = PetDetail.mockJojo
        // Act
        viewModel.fillCatToUpload(singlePet: testingCat)
        // Assert
        XCTAssertEqual(viewModel.catToUpload.name, testingCat.name)
    }

    func test_FillData_DataCanBeFilled() {
        // Esta funcion llena las variables dependiendo el singlePet que se le pase, verificar que
        // despues de que se haga la funcion, petName corresponda a singlePet.
        // Arrange
        let catListViewModel = CatListViewModel()
        let viewModel = UpdateCatViewModel(catListViewModel: catListViewModel, identifier: "1")
        let testingCat = PetDetail.mockSushi
        // Act
        viewModel.fillData(singlePet: testingCat)
        // Assert
        XCTAssertEqual(testingCat.name, viewModel.petName)
    }

    func test_UpdateModel_ModelCanBeUpdated() {
        // Esta funcion prueba que el modelo se actualice cuando el boton de guardado se presiona,
        // se puede testear verificando los valores de singlepet y petname
        // Arrange
        let catListViewModel = CatListViewModel()
        let viewModel = UpdateCatViewModel(catListViewModel: catListViewModel, identifier: "1")
        let testingCat = PetDetail.mockMica
        let petName = testingCat.name
        let petBreed = testingCat.breed
        let petYear = testingCat.petYear
        let petAppointment = testingCat.appointment
        viewModel.petName = petName
        viewModel.petAge = petYear
        viewModel.petBreed = petBreed
        viewModel.petAppointment = petAppointment
        // Act
        viewModel.updateModel(singlePet: testingCat)
        // Assert
        XCTAssertEqual(viewModel.singlePet.name, petName)
    }

    func test_SearchById_CatCanBeFound() {
        // Esta funcion busca por el objeto single pet en el arreglo de gatos
        // Agregar un gato a la base de datos, agregarlo al CatListVM
        // Mandar este arreglo como inicializador para el UpdateCatVM
        // Buscar el gato guardado por id/
        // Arrange
        let coreData = CoreDataManager(modelName: "CatAPP", storeType: StoreTypes.NSInMemoryStoreType)
        coreData.loadStore()
        let catToAdd = PetDetail.mockMomo
        coreData.saveCat(singlePet: catToAdd, vaccines: catToAdd.vaccines)
        let catListVM = CatListViewModel()
        catListVM.transformData(petModel: coreData.fetchAllCats())
        let updateCatVM = UpdateCatViewModel(catListViewModel: catListVM, identifier: catToAdd.id)
        // Act
        let catReturned = updateCatVM.searchById(arrayOfPets: catListVM.pets, identifier: catToAdd.id)
        // Assert
        XCTAssertEqual(catToAdd.name, catReturned.name)
    }

    func test_SearchById_CatCannotBeFound() {
        // Esta funcion busca por el objeto single pet en el arreglo de gatos
        // Agregar un gato a la base de datos, agregarlo al CatListVM
        // Mandar este arreglo como inicializador para el UpdateCatVM
        // Buscar el gato guardado por id/
        // Arrange
        let coreData = CoreDataManager(modelName: "CatAPP", storeType: StoreTypes.NSInMemoryStoreType)
        coreData.loadStore()
        let catToAdd = PetDetail.mockMomo
        coreData.saveCat(singlePet: catToAdd, vaccines: catToAdd.vaccines)
        let catListVM = CatListViewModel()
        catListVM.transformData(petModel: coreData.fetchAllCats())
        let updateCatVM = UpdateCatViewModel(catListViewModel: catListVM, identifier: "1")
        // Act
        let catReturned = updateCatVM.searchById(arrayOfPets: catListVM.pets, identifier: updateCatVM.identifier)
        // Assert
        XCTAssertNotEqual(catToAdd.name, catReturned.name)
    }

    func test_CreateSingleCat_CatCanBeTested() {
        // Agregar un gato a la Base de datos, agregarlo al CatListVM para tener un arreglo de mascotas
        // Posterior a esto, mandar este arreglo como inicializador para el UpdateCatViewModel
        // Buscar por ID uno de los gatos mockeados y actualizar la variable single pet
        // Arrange
        let coreData = CoreDataManager(modelName: "CatAPP", storeType: StoreTypes.NSInMemoryStoreType)
        coreData.loadStore()
        let catToAdd = PetDetail.mockSushi
        coreData.saveCat(singlePet: catToAdd, vaccines: catToAdd.vaccines)
        let catListVM = CatListViewModel()
        catListVM.transformData(petModel: coreData.fetchAllCats())
        let updateCatVM = UpdateCatViewModel(catListViewModel: catListVM, identifier: catToAdd.id)
        let singlePetBeforeFunction = updateCatVM.singlePet
        // Act
        updateCatVM.createSingleCat()
        // Assert
        XCTAssertNotEqual(singlePetBeforeFunction.name, updateCatVM.singlePet.name)

    }

    func test_UpdateToCoreData_UpdateCanBeDone() {
        // La funcione utilizada cuando el boton de guardar es presionado, 
        // esta funcion guarda el objeto singlePet en la variable CatToUpload
        // Busca el gato que se mando en CoreData, y realiza un llamado a la funcion actualizar,
        // para actualizar los valores del Gato en coredata
        // Para finalizar, guarda CoreData y actualiza el arreglo de mascotas que existe en catListViewModel
        // Se puede probar verificando el cambio del gato en coredata,
        // asi como el cambio en el arreglo de gatos en catListViewModel.
        // Se probara primero haciendo cambio entre mockMica y mockSushi.
        // Arrange
        let coreData = CoreDataManager(modelName: "CatAPP", storeType: StoreTypes.NSInMemoryStoreType)
        coreData.loadStore()
        let catToAdd = PetDetail.mockMica
        coreData.saveCat(singlePet: catToAdd, vaccines: catToAdd.vaccines)
        let catListVM = CatListViewModel()
        catListVM.transformData(petModel: coreData.fetchAllCats())
        let previousCats = catListVM.pets
        let updateCatVM = UpdateCatViewModel(catListViewModel: catListVM, identifier: catToAdd.id)
        let catToUpdate = PetDetail.mockSushi
        updateCatVM.createSingleCat() // Se llena singlePet.
        updateCatVM.fillData(singlePet: catToUpdate) // Se llena la informacion nueva del gato
        updateCatVM.updateModel(singlePet: catToUpdate) // Se actualiza singlePet
        // Act
        // Se ejecuta la funcion para cambiar el entre mockMica y mockSushi
        updateCatVM.updateToCoreData(singlePet: updateCatVM.singlePet)
        // Assert
        XCTAssertNotEqual(catListVM.pets.last?.name, previousCats.last?.name)

    }

}
