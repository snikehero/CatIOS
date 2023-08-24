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

    func toPetDetail() -> PetDetail {
        return PetDetail(
            id: self.identifier,
            name: self.name,
            petYear: Int(self.year),
            breed: self.breed,
            appointment: self.appointment
        )
    }
}

extension Cat : Identifiable { }
