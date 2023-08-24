//
//  CatObj.swift
//  CatAPP
//
//  Created by Moises Lopez on 24/08/23.
//

import Foundation
import CoreData

extension CatObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CatObject> {
        return NSFetchRequest<CatObject>(entityName: "Cat")
    }

    @NSManaged public var year: Int32
    @NSManaged public var appointment: Date
    @NSManaged public var breed: String
    @NSManaged public var name: String

}

extension CatObject : Identifiable {

}
