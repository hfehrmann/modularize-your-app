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
        let controller = Flow1ViewController(coordinator: self)
        self.rootController.pushViewController(controller, animated: false)
    }
}

extension Flow1Coordinator {

    func didLogout() {
        self.coordinatorDelegate?.didLogout()
    }
}
