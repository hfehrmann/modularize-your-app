//
//  LoginCoordinator.swift
//  Login
//
//  Created by Hans Fehrmann on 23/09/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

public class LoginCoordinator {

    let rootController: UIViewController

    public init(controller: UIViewController) {
        self.rootController = controller
    }

    public func start() {
        let loginController = LoginScreenViewController(coordinator: self)
        rootController.present(loginController, animated: true)
    }
}
