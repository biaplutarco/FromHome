//
//  CoreDataManager.swift
//  FromHome
//
//  Created by Daniboy on 7/26/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit
import CoreData

enum CoreDataModel {
    static var context: NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("No aplication found")
        }
        return appDelegate.persistentContainer.viewContext
    }

    static func writeChanges() {
        do {
            try Self.context.save()
        } catch {
            print(error)
        }
    }

    static func delete<T: NSManagedObject>(object: T) {
        Self.context.delete(object)
        do {
            try Self.context.save()
        } catch {
            print(error)
        }
    }

    static func allOf<T: NSManagedObject>(objectType: T.Type) -> [Self] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: objectType.description())
        fetchRequest.predicate = NSPredicate(value: true)
        fetchRequest.returnsObjectsAsFaults = false

        do {
            guard let response = try context.fetch(fetchRequest) as? [Self] else {
                fatalError("Received from coredata a unexpected type")
            }
            return response
        } catch {
            print(error)
            return []
        }
    }

    static func find<T: NSManagedObject>(objectType: T.Type, predicate: NSPredicate) -> [Self] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: objectType.description())
        fetchRequest.predicate = predicate
        fetchRequest.returnsObjectsAsFaults = false

        do {
            guard let response = try context.fetch(fetchRequest) as? [Self] else {
                fatalError("Received from coredata a unexpected type")
            }
            return response
        } catch {
            print(error)
            return []
        }
    }
}
