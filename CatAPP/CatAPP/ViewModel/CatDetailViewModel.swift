//
//  CatDetailViewModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 17/08/23.
//

import Foundation
@MainActor class CatDetailViewModel: ObservableObject {
    @Published var pets: [PetDetail] = []
    let coreDataManager = CoreDataManager(modelName: "CatAPP")
    func saveData(name: String, petAge: Int, appointment: Date, breed: String ) {
        print("Saving Data to VM")
        let singlePet = PetDetail(name: name, petYear: petAge, breed: breed, appointment: appointment)
        pets.append(singlePet)
        print(singlePet)

    }
}

extension CatDetailViewModel {
    static let petsMock = [PetDetail.mockJojo,
                           PetDetail.mockMica,
                           PetDetail.mockMomo,
                           PetDetail.mockSushi
                           ]
}
