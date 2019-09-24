//
//  LoginCoordinator.swift
//  Login
//
//  Created by Hans Fehrmann on 23/09/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

public protocol LoginCoordinatorDelegate {
    func didLogin()
}

public class LoginCoordinator {

    public var coordinatorDelegate: LoginCoordinatorDelegate?

    private let rootController: UIViewController

    public init(controller: UIViewController) {
        self.rootController = controller
    }

    public func start() {
        let loginController = LoginScreenViewController(coordinator: self)
        self.rootController.present(loginController, animated: true)
    }
}

extension LoginCoordinator {

    func didLogin() {
        self.coordinatorDelegate?.didLogin()
    }
}
