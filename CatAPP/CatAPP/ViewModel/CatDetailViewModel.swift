//
//  CatDetailViewModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 17/08/23.
//

import Foundation
@MainActor class CatDetailViewModel: ObservableObject {
    @Published var pets: [PetDetail] = []

    func saveData(name: String, petAge: Int, appointment: Date, breed: String ) {
        let singlePet = PetDetail(name: name, petYear: petAge, breed: breed, appointment: appointment)
        updateArray(singlePet: singlePet)
        saveToCoreData(singlePet: singlePet)
    }

    private func updateArray(singlePet: PetDetail) {
        pets.append(singlePet)
        print("Updated Array")
    }

    private func saveToCoreData(singlePet: PetDetail) {
        CoreDataManager.shared.saveCat(singlePet: singlePet)
        print("Saved to CoreData")
    }

    func transformData(petModel: [Cat]) {
        pets = petModel.map { $0.toPetDetail() }
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
