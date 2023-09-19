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

    init(catListViewModel: CatListViewModel, identifier: String) {
        self.catListViewModel = catListViewModel
        self.identifier = identifier
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

    func searchById(arrayOfPets: [PetDetail], identifier: String) -> PetDetail {
        if let singlePet = arrayOfPets.first(where: {$0.id == identifier}) {
            return singlePet
        }
        return PetDetail.mockJojo
    }

    func updateToCoreData(singlePet: PetDetail ) {
        fillCatToUpload(singlePet: singlePet)
       let fetchedCat =  CoreDataManager.shared.fetchSingleCat(singlePet: singlePet)
        _ =  CoreDataManager.shared.updateCat(singleCat: fetchedCat, newCat: catToUpload)
        CoreDataManager.shared.save()
        catListViewModel.updatePets(singlePet: singlePet)
    }
}
