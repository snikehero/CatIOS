//
//  PetVaccineModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 05/09/23.
//

import Foundation
struct PetVaccineModel: Codable {
    let vaccineName: String
    let vaccineDate: Date
}
extension PetVaccineModel {
    static var mock = PetVaccineModel(vaccineName: "AIDS", vaccineDate: Date.now)
}

