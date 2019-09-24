//
//  AppCoordinator.swift
//  Modularizing
//
//  Created by Hans Fehrmann on 17/09/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit
import Login
import Dashboard

class AppCoordinator {

    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let controller = UIViewController()
        let loginCoordinator = LoginCoordinator(controller: controller)
        loginCoordinator.coordinatorDelegate = self
        self.window.rootViewController = controller
        self.window.makeKeyAndVisible()
        loginCoordinator.start()
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {

    func didLogin() {
        self.window.rootViewController?.dismiss(animated: false)
        let navigationController = UINavigationController()
        let dashboardCoordinator = DashboardCoordinator(rootController: navigationController)
        dashboardCoordinator.coordinatorDelegate = self
        self.window.rootViewController = navigationController
        dashboardCoordinator.start()
    }
}

extension AppCoordinator: DashboardCoordinatorDelegate {

    func didLogout() {
        self.window.rootViewController?.dismiss(animated: false)
        self.window.backgroundColor = .white
        self.start()
    }
}
