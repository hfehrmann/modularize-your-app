//
//  AppCoordinator.swift
//  Modularizing
//
//  Created by Hans Fehrmann on 17/09/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator {

    let window: UIWindow
    var loginCoordinator: LoginCoordinator?

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let controller = UIViewController()
        let loginCoordinator = LoginCoordinator(controller: controller)
        self.window.rootViewController = controller
        self.window.makeKeyAndVisible()
        loginCoordinator.start()
    }
}
