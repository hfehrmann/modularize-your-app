//
//  LoginScreenViewController.swift
//  Login
//
//  Created by Hans Fehrmann on 23/09/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

class LoginScreenViewController: UIViewController {

    private var coordinator: LoginCoordinator

    private lazy var loginScreenView: LoginScreenView = {
        let view = LoginScreenView()
        view.delegate = self
        return view
    }()

    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = self.loginScreenView
    }

}

extension LoginScreenViewController: LoginScreenViewDelegate {

    func loginScreenViewDelegate(_ loginScreenView: LoginScreenView, name: String, password: String) {
        debugPrint(name)
        debugPrint(password)
        coordinator.didLogin()
    }
}
