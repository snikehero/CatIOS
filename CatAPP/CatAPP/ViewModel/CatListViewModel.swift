//
//  CatListViewModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 12/09/23.
//

import Foundation

class CatListViewModel: ObservableObject {
    @Published var pets: [PetDetail] = []

    static let shared: CatListViewModel = {
        let catListViewModel = CatListViewModel()
        return catListViewModel
    }()

    func transformData(petModel: [Cat]) {
        pets = petModel.map { $0.toPetDetail() }
    }

    func updateArray(singlePet: PetDetail) {
        pets.append(singlePet)
    }
    func updatePets(singlePet: PetDetail) {
        if let index = pets.firstIndex(where: { $0.id == singlePet.id }) {
            pets.remove(at: index)
            pets.insert(singlePet, at: index)
        }
    }
}
