//
//  PetModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 17/08/23.
//

import Foundation

struct PetDetail: Identifiable, Codable {
    let id: String
    var name: String
    var petYear: Int
    var breed: String
    var appointment: Date
    var vaccines: [PetVaccineModel]
    init(id: String = UUID().uuidString,
         name: String,
         petYear: Int,
         breed: String,
         appointment: Date,
         vaccines: [PetVaccineModel]) {
        self.id = id
        self.name = name
        self.petYear = petYear
        self.breed = breed
        self.appointment = appointment
        self.vaccines = vaccines
    }
}

extension PetDetail {
    static var mockSushi = PetDetail(name: "Sushi",
                                     petYear: 7, breed: "Cruza",
                                     appointment: Date.now, vaccines: [.mock])
    static var mockJojo = PetDetail(name: "Jojo",
                                    petYear: 4, breed: "Electrico",
                                    appointment: Date.now, vaccines: [.mock])
    static var mockMomo = PetDetail(name: "Momo",
                                    petYear: 3, breed: "Volador"
                                    , appointment: Date.now, vaccines: [.mock])
    static var mockMica = PetDetail(name: "Mica",
                                    petYear: 5, breed: "Callejero",
                                    appointment: Date.now, vaccines: [.mock])
}
