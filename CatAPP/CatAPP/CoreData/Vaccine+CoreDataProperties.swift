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

    @NSManaged public var vaccineName: String?
    @NSManaged public var vaccineDate: Date?
    @NSManaged public var cat: Cat?
}

extension Vaccine : Identifiable {

}
