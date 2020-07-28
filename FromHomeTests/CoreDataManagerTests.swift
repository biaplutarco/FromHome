//
//  CoreDataManagerTests.swift
//  FromHomeTests
//
//  Created by Daniboy on 7/26/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import XCTest
import CoreData
@testable import FromHome

class CoreDataManagerTests: XCTestCase {

    var manager: CoreDataManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main] )!
        print(managedObjectModel)

        let mockPersistantContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "PersistentTodoList", managedObjectModel: managedObjectModel)
            let description = NSPersistentStoreDescription()
            description.type = NSInMemoryStoreType
            description.shouldAddStoreAsynchronously = false // Make it simpler in test env

            container.persistentStoreDescriptions = [description]
            container.loadPersistentStores { (description, _) in
                // Check if the data store is in memory
                precondition( description.type == NSInMemoryStoreType )
            }
            return container
        }()

        let object = TaskListEntity.init(context: mockPersistantContainer.viewContext)
        object.id = "\(Double.random(in: 1...100))"
        object.tasks = ["\(Double.random(in: 1...100))", "\(Double.random(in: 1...100))", "\(Double.random(in: 1...100))"]
        try mockPersistantContainer.viewContext.save()

        manager = CoreDataManager.init(context: mockPersistantContainer.viewContext)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        manager = nil
    }

    func testWriteChanges_Success() {
        let object = TaskListEntity.init(context: manager.context)
        object.id = "\(Double.random(in: 1...100))"
        object.tasks = ["\(Double.random(in: 1...100))", "\(Double.random(in: 1...100))", "\(Double.random(in: 1...100))"]

        XCTAssertNil(manager.writeChanges())
    }

    func testDelete_Success() {
        let object = TaskListEntity.init(context: manager.context)
        object.id = "\(Double.random(in: 1...100))"
        object.tasks = ["\(Double.random(in: 1...100))", "\(Double.random(in: 1...100))", "\(Double.random(in: 1...100))"]
        try? manager.context.save()

        XCTAssertNil(manager.delete(object: object))
    }

    func testFetchAllOf_Success() {
        let object = TaskListEntity.init(context: manager.context)
        object.id = "\(Double.random(in: 1...100))"
        object.tasks = ["\(Double.random(in: 1...100))", "\(Double.random(in: 1...100))", "\(Double.random(in: 1...100))"]
        try? manager.context.save()

        let res = manager.fetchAllOf(objectType: TaskListEntity.self)

        if let list = res.0 {
            XCTAssertFalse(list.isEmpty)
            XCTAssertNil(res.1)
        }
    }

    func testFind_Success() {
        let object = TaskListEntity.init(context: manager.context)
        object.id = "\(Double.random(in: 1...100))"
        object.tasks = ["\(Double.random(in: 1...100))", "\(Double.random(in: 1...100))", "\(Double.random(in: 1...100))"]
        try? manager.context.save()

        let predicate = NSPredicate(format: "id CONTAINS[cd] %@", object.id!)

        let res = manager.find(objectType: TaskListEntity.self, predicate: predicate)

        if let list = res.0 {
            XCTAssertFalse(list.isEmpty)
            XCTAssertNil(res.1)
        }
    }
}
