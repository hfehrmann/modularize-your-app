//
//  DashboardCoordinator.swift
//  Modularizing
//
//  Created by Hans Fehrmann on 17/09/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit
import Flow1

public protocol DashboardCoordinatorDelegate {
    func didLogout()
}

public class DashboardCoordinator {

    public var coordinatorDelegate: DashboardCoordinatorDelegate?

    private unowned let rootController: UINavigationController

    public init(rootController: UINavigationController) {
        self.rootController = rootController
    }

    public func start() {
        let controller = DashboardViewController(coordinator: self)
        self.rootController.pushViewController(controller, animated: false)
    }
}

extension DashboardCoordinator {

    func didLogout() {
        self.coordinatorDelegate?.didLogout()
    }

    func goToFlow1() {
        let coordinator = Flow1Coordinator(rootController: self.rootController)
        coordinator.start()
    }

    func goToFlow2() {

    }
}
