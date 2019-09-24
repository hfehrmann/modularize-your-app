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
    private let initialNumberOfController: Int

    public init(rootController: UINavigationController, initialNumberOfController: Int = 1) {
        self.initialNumberOfController = initialNumberOfController
        self.rootController = rootController
    }

    public func start() {
        let controller = Flow1ViewController(coordinator: self, numberOfController: self.initialNumberOfController)
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
