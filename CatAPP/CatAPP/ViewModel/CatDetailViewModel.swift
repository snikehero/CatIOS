//
//  CatDetailViewModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 17/08/23.
//

import Foundation
@MainActor class CatDetailViewModel: ObservableObject {
    @Published var pets: [PetDetail] = []
    @Published var filteredPets: [PetDetail] = []
    @Published var searchText = ""
    @Published var  visibleTags: [String] = []
    private let tagsPerPage = 20
    var filteredCats: [PetDetail] {
        if searchText.isEmpty {
            return pets
        } else {
            return pets.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    func saveData(name: String, petAge: Int, appointment: Date, breed: String ) {
        let singlePet = PetDetail(name: name, petYear: petAge, breed: breed, appointment: appointment)
        updateArray(singlePet: singlePet)
        saveToCoreData(singlePet: singlePet)
    }

    private func updateArray(singlePet: PetDetail) {
        pets.append(singlePet)
    }

    private func saveToCoreData(singlePet: PetDetail) {
        CoreDataManager.shared.saveCat(singlePet: singlePet)
    }

    func transformData(petModel: [Cat]) {
        pets = petModel.map { $0.toPetDetail() }
    }

    func searchById(arrayOfPets: [PetDetail], identifier: String) -> PetDetail {
        if let singlePet = arrayOfPets.first(where: {$0.id == identifier}) {
            return singlePet
        } else {
            return PetDetail.mockJojo
        }
    }

    func updateToCoreData(singlePet: PetDetail, identifier: String ) {
        CoreDataManager.shared.updateData(singlePet: singlePet, identifier: identifier)
        updatePets(singlePet: singlePet)
    }

    private func updatePets(singlePet: PetDetail) {
        if let index = pets.firstIndex(where: { $0.id == singlePet.id }) {
            pets.remove(at: index)
            pets.insert(singlePet, at: index)
        }
    }
    func deleteFromCoreData(at offsets: IndexSet) {
        print(offsets)
        for offset in offsets {
            let singlePet = pets[offset]
            CoreDataManager.shared.removeData(singlePet: singlePet)
            pets.remove(at: offset)
        }
    }
    func shouldLoadData(id: Int) -> Bool {
        return id == pets.count - 2
    }
    func loadInitialTags() {
        visibleTags = Array(catTags.prefix(tagsPerPage))
    }

    func loadMoreTags() {
        let startIndex = visibleTags.count
        let endIndex = min(startIndex + tagsPerPage, catTags.count)

        if startIndex < endIndex {
            let newTags = Array(catTags[startIndex..<endIndex])
            visibleTags.append(contentsOf: newTags)
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
