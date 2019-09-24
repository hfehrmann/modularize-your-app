//
//  LoginScreenView.swift
//  Login
//
//  Created by Hans Fehrmann on 23/09/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Core

protocol LoginScreenViewDelegate: AnyObject {
    func loginScreenViewDelegate(_ loginScreenView: LoginScreenView, name: String, password: String)
}

class LoginScreenView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Modularizing your App"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()

    private lazy var nameInput: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 4
        return textField
    }()

    private lazy var passwordInput: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 4
        return textField
    }()

    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didClickSend), for: .touchUpInside)
        button.setTitle("Send", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .lightningBlue
        return button
    }()

    weak var delegate: LoginScreenViewDelegate?

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

        self.addSubview(self.titleLabel)
        self.addSubview(self.nameInput)
        self.addSubview(self.passwordInput)
        self.addSubview(self.sendButton)

        let height: CGFloat = 30
        let offset: CGFloat = 10
        let viewMultiply: CGFloat = 0.7

        self.titleLabel.snp.makeConstraints { maker in
            maker.top.equalTo(self.snp.topMargin).offset(50)
            maker.centerX.equalToSuperview()
            maker.width.equalToSuperview()
        }

        self.passwordInput.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
            maker.height.equalTo(height)
            maker.width.equalToSuperview().multipliedBy(viewMultiply)
        }

        self.nameInput.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.height.equalTo(height)
            maker.bottom.equalTo(passwordInput.snp.top).offset(-offset)
            maker.width.equalToSuperview().multipliedBy(viewMultiply)
        }

        self.sendButton.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.height.equalTo(height)
            maker.top.equalTo(passwordInput.snp.bottom).offset(offset)
            maker.width.equalToSuperview().multipliedBy(viewMultiply)
        }
    }

    @objc
    func didClickSend() {
        let name = self.nameInput.text ?? ""
        let password = self.passwordInput.text ?? ""
        self.delegate?.loginScreenViewDelegate(self, name: name, password: password)
    }
}
