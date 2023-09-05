//
//  Vaccine+CoreDataProperties.swift
//  CatAPP
//
//  Created by Moises Lopez on 05/09/23.
//
//

import Foundation
import CoreData

extension Vaccine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vaccine> {
        return NSFetchRequest<Vaccine>(entityName: "Vaccine")
    }

    @NSManaged public var vaccineName: String
    @NSManaged public var vaccineDate: Date
    @NSManaged public var cat: Cat?

    func toPetVaccineModel() -> PetVaccineModel {
        return PetVaccineModel(vaccineName: self.vaccineName, vaccineDate: self.vaccineDate)
    }
    public override var description: String {
        """
        VaccineName: \(vaccineName)
        VaccineDate: \(vaccineDate)
        """
    }
}

extension Vaccine : Identifiable {

}
