//
//  UpdateCatViewModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 12/09/23.
//

import Foundation

class UpdateCatViewModel: ObservableObject {
    var catListViewModel: CatListViewModel
    var identifier: String = ""
    var manager: CoreDataManager
    @Published var catToUpload = PetDetail.mockMica
    @Published var showingAlert = false
    @Published var petName: String = ""
    @Published var petAge: Int = 0
    @Published var petAppointment: Date = Date.now
    @Published var petBreed: String = ""
    @Published var isEditable = true
    @Published var singlePet = PetDetail.mockJojo
    @Published var isEditingState = true
    @Published var petVaccines: [String] = []
    @Published var petVaccinesDate: [Date] = []
    var function: (PetDetail) -> Void

    init(catListViewModel: CatListViewModel, identifier: String,
         manager: CoreDataManager, funcion: @escaping (PetDetail) -> Void) {
        // Pasar el arreglo como gato, y pasarle la funcion como closure.
        self.catListViewModel = catListViewModel
        self.identifier = identifier
        self.manager = manager
        self.function = funcion
    }

    func fillCatToUpload(singlePet: PetDetail) {
        catToUpload.name = singlePet.name
        catToUpload.breed = singlePet.breed
        catToUpload.petYear = singlePet.petYear
        catToUpload.appointment = singlePet.appointment
    }

    func fillData(singlePet: PetDetail) {
        petName = singlePet.name
        petBreed = singlePet.breed
        petAge = singlePet.petYear
        petAppointment = singlePet.appointment
    }

    func updateModel(singlePet: PetDetail) {
        self.singlePet.name = petName
        self.singlePet.breed = petBreed
        self.singlePet.petYear = petAge
        self.singlePet.appointment = petAppointment
    }

    func createSingleCat() {
       singlePet = searchById(arrayOfPets: catListViewModel.pets, identifier: identifier)
    }

    func searchById(arrayOfPets: [PetDetail], identifier: String) -> PetDetail {
        if let singlePet = arrayOfPets.first(where: {$0.id == identifier}) {
            return singlePet
        }
        return PetDetail.mockJojo
    }
    func updateToCoreData(singlePet: PetDetail ) {
        fillCatToUpload(singlePet: singlePet)
        let fetchedCat =  manager.fetchSingleCat(singlePet: singlePet)
        _ =  manager.updateCat(singleCat: fetchedCat, newCat: catToUpload)
        manager.save()
        function(singlePet)
    }
}
