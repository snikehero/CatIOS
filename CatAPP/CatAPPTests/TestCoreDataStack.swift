//
//  TestCoreDataStack.swift
//  CatAPPTests
//
//  Created by Moises Lopez on 18/09/23.
//

import XCTest
import CoreData
@testable import CatAPP
class TestCoreDataStack: XCTestCase {
    var managedObjectContext: NSManagedObjectContext!

    override func setUp() {
        super.setUp()
        managedObjectContext = createTestManagedObjectContext()
    }

    override func tearDown() {
        managedObjectContext = nil
        super.tearDown()
    }

    func createTestManagedObjectContext() -> NSManagedObjectContext {
        let container = NSPersistentContainer(name: "CatAPP")
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType

        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }

        return container.viewContext
    }
}
