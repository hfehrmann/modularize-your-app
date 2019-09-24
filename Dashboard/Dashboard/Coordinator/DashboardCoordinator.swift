//
//  DashboardCoordinator.swift
//  Modularizing
//
//  Created by Hans Fehrmann on 17/09/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

protocol DashboardCoordinatorDelegate {

}

class DashboardCoordinator {

    let rootController: UINavigationController

    init(controller: UINavigationController) {
        self.rootController = controller
    }

    func start() {
        let controller = UIViewController()
        self.rootController.pushViewController(controller, animated: false)
    }
}
