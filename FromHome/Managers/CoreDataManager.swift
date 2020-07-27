//
//  CoreDataManager.swift
//  FromHome
//
//  Created by Daniboy on 7/26/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit
import CoreData

struct CoreDataManager {

    let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = AppContext.context) {
        self.context = context
    }

    func writeChanges() -> Error? {
        do {
            try self.context.save()
            return nil
        } catch {
            return error
        }
    }

    func delete<T: NSManagedObject>(object: T) -> Error? {
        self.context.delete(object)

        do {
            try self.context.save()
            return nil
        } catch {
            return error
        }
    }

    func fetchAllOf<T: NSManagedObject>(objectType: T.Type) -> (res: [T]?, err: Error?) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: objectType.description())
        fetchRequest.predicate = NSPredicate(value: true)
        fetchRequest.returnsObjectsAsFaults = false

        do {
            let res = try context.fetch(fetchRequest) as? [T]
            return (res, nil)
        } catch {
            return (nil, error)
        }
    }

    func find<T: NSManagedObject>(objectType: T.Type, predicate: NSPredicate) -> (res: [T]?, err: Error?) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: objectType.description())
        fetchRequest.predicate = predicate
        fetchRequest.returnsObjectsAsFaults = false

        do {
            let res = try context.fetch(fetchRequest) as? [T]
            return (res, nil)
        } catch {
            return (nil, error)
        }
    }
}
