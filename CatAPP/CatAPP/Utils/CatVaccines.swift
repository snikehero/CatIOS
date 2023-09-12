//
//  CatVaccines.swift
//  CatAPP
//
//  Created by Moises Lopez on 05/09/23.
//

import Foundation
enum CatVaccine: String, CaseIterable, Identifiable {
    case rabies = "Rabies"
    case felineLeukemia = "Feline Leukemia"
    case distemper = "Distemper"
    case felineHerpesVirus = "Feline herpes virus"
    case felineCalicivirus = "Feline calici virus"
    var id: String {self.rawValue}
}
