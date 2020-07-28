//
//  AppContext.swift
//  FromHome
//
//  Created by Daniboy on 7/26/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit
import CoreData

enum AppContext {
    static var context: NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("No aplication found")
        }
        return appDelegate.persistentContainer.viewContext
    }
}
