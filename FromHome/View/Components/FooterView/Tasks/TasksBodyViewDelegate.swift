//
//  TasksBodyViewDelegate.swift
//  FromHome
//
//  Created by Bia Plutarco on 25/07/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

protocol TasksBodyViewDelegate: AnyObject {
    func present(_ viewController: UIViewController, completion: (() -> Void)?)
}
