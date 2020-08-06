//
//  SceneDelegate.swift
//  FromHome
//
//  Created by Daniboy on 7/6/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var coordinator: MainCoordinator?

    let coreDataManager = CoreDataManager()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        defaultTasks()

        coordinator = MainCoordinator(withWindowScene: windowScene)

        coordinator?.start()
    }

    private func defaultTasks() {

        let getReadyList = TaskListEntity.init(context: coreDataManager.context)
        getReadyList.id = TaskType.getReady.rawValue

        let goHomeList = TaskListEntity.init(context: coreDataManager.context)
        goHomeList.id = TaskType.goHome.rawValue

        let getReadyPredicate = NSPredicate(format: "id CONTAINS[cd] %@", getReadyList.id!)
        let goHomePredicate = NSPredicate(format: "id CONTAINS[cd] %@", goHomeList.id!)

        if coreDataManager.find(objectType: TaskListEntity.self, predicate: getReadyPredicate).res != nil {

            getReadyList.tasks = ["Get dressed for work", "", ""]

            try? coreDataManager.context.save()
        }

        if coreDataManager.find(objectType: TaskListEntity.self, predicate: goHomePredicate).res != nil {

            goHomeList.tasks = ["Organize your desk", "", ""]

            try? coreDataManager.context.save()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
