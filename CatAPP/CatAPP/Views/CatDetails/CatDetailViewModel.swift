//
//  CatDetailViewModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 17/08/23.
//

import Foundation

class CatDetailViewModel: ObservableObject {
    var catListViewModel: CatListViewModel

    @Published var vaccines: [PetVaccineModel] = []
    @Published var singlePet: PetDetail = .mockMica
    @Published var petName: String = ""
    @Published var petAge: Int = 0
    @Published var petAppointment: Date = Date.now
    @Published var petBreed: String = CatBreed.abyssinian.rawValue
    @Published var showingAlert = false
    @Published var petVaccines: [String] = []
    @Published var petVaccinesDate: [Date] = []
    var manager: CoreDataManager
    init(catListViewModel: CatListViewModel, manager: CoreDataManager) {
        self.catListViewModel = catListViewModel
        self.manager = manager
    }

    func saveData(name: String, petAge: Int, appointment: Date, breed: String) {
        singlePet = PetDetail(name: name,
                                  petYear: petAge,
                                  breed: breed,
                                  appointment: appointment,
                                  vaccines: vaccines)
        catListViewModel.updateArray(singlePet: singlePet)
        saveToCoreData(singlePet: singlePet, vaccines: singlePet.vaccines )
    }

    private func saveToCoreData(singlePet: PetDetail, vaccines: [PetVaccineModel]) {
        manager.saveCat(singlePet: singlePet, vaccines: vaccines)
    }

    func createNewVaccine() {
        petVaccines.append("")
        petVaccinesDate.append(Date())
    }

    func addToModel() {
        for index in petVaccines.enumerated() {
            let vaccineName = petVaccines[index.offset]
            let vaccineDate = petVaccinesDate[index.offset]
            let petVaccineModel = PetVaccineModel(vaccineName: vaccineName, vaccineDate: vaccineDate)
            vaccines.append(petVaccineModel)
        }
    }
}

extension CatDetailViewModel {
    static let petsMock = [
        PetDetail.mockJojo,
        PetDetail.mockMica,
        PetDetail.mockMomo,
        PetDetail.mockSushi
    ]
}
