//
//  DashboardCoordinator.swift
//  Modularizing
//
//  Created by Hans Fehrmann on 17/09/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

public protocol Flow1CoordinatorDelegate {
    func didLogout()
}

public class Flow1Coordinator {

    public var coordinatorDelegate: Flow1CoordinatorDelegate?

    private unowned let rootController: UINavigationController

    public init(rootController: UINavigationController) {
        self.rootController = rootController
    }

    public func start() {
        let controller = Flow1ViewController(coordinator: self, numberOfController: 1)
        self.rootController.pushViewController(controller, animated: true)
    }
}

extension Flow1Coordinator {

    func  goToFlow1(nextNumberOfDisplay: Int) {
        let controller = Flow1ViewController(coordinator: self, numberOfController: nextNumberOfDisplay)
        self.rootController.pushViewController(controller, animated: true)
    }

    func didLogout() {
        self.coordinatorDelegate?.didLogout()
    }
}
