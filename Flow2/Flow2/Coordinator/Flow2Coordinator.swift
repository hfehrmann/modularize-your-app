//
//  DashboardCoordinator.swift
//  Modularizing
//
//  Created by Hans Fehrmann on 17/09/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

public protocol Flow2CoordinatorDelegate {
    func flow2CoordinatorGoToFlow1(nextNumberOfDisplay: Int)
    func flow2CoordinatorDidLogout()
}

public class Flow2Coordinator {

    public var coordinatorDelegate: Flow2CoordinatorDelegate?

    private unowned let rootController: UINavigationController
    private let initialNumberOfController: Int

    public init(rootController: UINavigationController, initialNumberOfController: Int = 1) {
        self.initialNumberOfController = initialNumberOfController
        self.rootController = rootController
    }

    public func start() {
        let controller = Flow2ViewController(coordinator: self, numberOfController: self.initialNumberOfController)
        self.rootController.pushViewController(controller, animated: true)
    }
}

extension Flow2Coordinator {

    func  goToFlow1(nextNumberOfDisplay: Int) {
        self.coordinatorDelegate?.flow2CoordinatorGoToFlow1(nextNumberOfDisplay: nextNumberOfDisplay)
    }

    func  goToFlow2(nextNumberOfDisplay: Int) {
        let controller = Flow2ViewController(coordinator: self, numberOfController: nextNumberOfDisplay)
        self.rootController.pushViewController(controller, animated: true)
    }

    func didLogout() {
        self.coordinatorDelegate?.flow2CoordinatorDidLogout()
    }
}
