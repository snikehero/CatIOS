//
//  CatObj.swift
//  CatAPP
//
//  Created by Moises Lopez on 24/08/23.
//

import Foundation
import CoreData

extension Cat {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cat> {
        return NSFetchRequest<Cat>(entityName: "Cat")
    }

    @NSManaged public var year: Int32
    @NSManaged public var appointment: Date
    @NSManaged public var breed: String
    @NSManaged public var name: String
    @NSManaged public var identifier: String
    @NSManaged public var vaccine: NSSet?
    func toPetDetail() -> PetDetail {
        let vaccines: Set<Vaccine> = self.vaccine as? Set<Vaccine> ?? Set<Vaccine>()
        return PetDetail(
            id: self.identifier,
            name: self.name,
            petYear: Int(self.year),
            breed: self.breed,
            appointment: self.appointment,
            vaccines: vaccines.map { $0.toPetVaccineModel() }
        )
    }
    public override var description: String {
        let vaccines: Set<Vaccine> = self.vaccine as? Set<Vaccine> ?? Set<Vaccine>()
        return """
                name: \(name)
                petYear: \(year)
                breed: \(breed)
                apointment: \(appointment)
                vaccines: \(vaccines.map { $0.description }
            )
            """
    }
}
extension Cat {

    @objc(addVaccineObject:)
    @NSManaged public func addToVaccine(_ value: Vaccine)

    @objc(removeVaccineObject:)
    @NSManaged public func removeFromVaccine(_ value: Vaccine)

    @objc(addVaccine:)
    @NSManaged public func addToVaccine(_ values: NSSet)

    @objc(removeVaccine:)
    @NSManaged public func removeFromVaccine(_ values: NSSet)

}
extension Cat: Identifiable { }
