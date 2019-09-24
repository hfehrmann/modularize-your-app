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

public class DashboardCoordinator {

    let rootController: UINavigationController

    public init(rootController: UINavigationController) {
        self.rootController = rootController
    }

    public func start() {
        let controller = DashboardViewController()
        self.rootController.pushViewController(controller, animated: false)
    }
}
