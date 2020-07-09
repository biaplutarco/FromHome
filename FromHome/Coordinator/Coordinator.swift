//
//  Coordinator.swift
//  FromHome
//
//  Created by Daniboy on 7/6/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController! { get set }

    func start()
}

extension Coordinator {
    
    func childDidFinish(_ childCoordinator: Coordinator?) {
        
        guard let index = childCoordinators.firstIndex(where: { $0 === childCoordinator }) else {
            fatalError("Child not listed as child on parent")
        }

        childCoordinators.remove(at: index)

        if childCoordinators.isEmpty {
            
            start()
        }
    }
}
