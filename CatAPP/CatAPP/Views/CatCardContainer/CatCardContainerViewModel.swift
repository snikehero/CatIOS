//
//  CatCardContainerViewModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 12/09/23.
//

import Foundation

class CatCardContainerViewModel: ObservableObject {
    @Published var isPresented = false
    @Published var identifierValue = "123"
    @Published var filteredPets: [PetDetail] = []
    @Published var searchText = ""
    @Published var pets: [PetDetail]

    init(pets: [PetDetail]) {
        self.pets = pets
    }
    var filteredCats: [PetDetail] {
        if searchText.isEmpty {
            return pets
        }
        return pets.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    func deleteFromCoreData(at offsets: IndexSet) {
        for offset in offsets {
            let singlePet = pets[offset]
            CoreDataManager.shared.removeData(singlePet: singlePet)
            pets.remove(at: offset)
        }
    }
    func updatePets(singlePet: PetDetail) {
        if let index = pets.firstIndex(where: { $0.id == singlePet.id }) {
            pets.remove(at: index)
            pets.insert(singlePet, at: index)
        }
    }
}
