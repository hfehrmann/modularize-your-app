//
//  LoginScreenView.swift
//  Login
//
//  Created by Hans Fehrmann on 23/09/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

class LoginScreenView: UIView {

    private lazy var name: UITextField = UITextField()
    private lazy var password: UITextField = UITextField()
    private lazy var send: UIButton = {
        let button = UIButton()
        button.setTitle("Enviar", for: .normal)
        button.tintColor = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.8, alpha: 0)
        return button
    }()

    init(){
        super.init(frame: .zero)
        self.configureView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension LoginScreenView {

    func configureView() {
        self.backgroundColor = .white

        self.addSubview(name)
        self.addSubview(password)
        self.addSubview(send)
    }
}
