//
//  CatDetailViewModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 17/08/23.
//

import Foundation
@MainActor class CatDetailViewModel: ObservableObject {
    @Published var pets: [PetDetail] = petsMock
    @Published var petName: String = ""
    @Published var petAge: String = ""
    @Published var petAppointment: Date = Date.now
    @Published var petBreed: String = ""
    func saveData(name: String, petAge: String, appointment: Date, breed: String ) {
        petName = name
        self.petAge = petAge
        petAppointment = appointment
        petBreed = breed
    }

    func printData() {
        print("Name" + petName)
        print("Age" + petAge)
        print("Appointment \(petAppointment)")
        print("Breed" + petBreed)
    }
}

extension CatDetailViewModel {
    static let petsMock = [PetDetail(name: "Pitt", petYear: 7, breed: "Cruza", appointment: Date.now),
                           PetDetail(name: "Jojo", petYear: 4, breed: "Electrico", appointment: Date.now),
                           PetDetail(name: "Momo", petYear: 3, breed: "Volador", appointment: Date.now),
                           PetDetail(name: "Mica", petYear: 5, breed: "Callejero", appointment: Date.now)
                           ]
}
