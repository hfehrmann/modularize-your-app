//
//  DashboardView.swift
//  Dashboard
//
//  Created by Hans Fehrmann on 24/09/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Core

class DashboardView: UIView {

    private enum Constraints {
        static var rounderCorner: CGFloat { return 4 }
    }

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        return view
    }()

    private lazy var flow1: UIButton = {
        let button = UIButton()
        button.setTitle("Flow 1", for: .normal)
        button.backgroundColor = .lightningBlue
        button.layer.cornerRadius = Constraints.rounderCorner
        return button
    }()

    private lazy var flow2: UIButton = {
        let button = UIButton()
        button.setTitle("Flow 2", for: .normal)
        button.backgroundColor = .lightningBlue
        button.layer.cornerRadius = Constraints.rounderCorner
        return button
    }()

    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.backgroundColor = .lightningBlue
        button.layer.cornerRadius = Constraints.rounderCorner
        return button
    }()

    init() {
        super.init(frame: .zero)
        configureView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension DashboardView {

    func configureView() {
        self.backgroundColor = .lightGray

        self.addSubview(stackView)
        self.stackView.addArrangedSubview(self.flow1)
        self.stackView.addArrangedSubview(self.flow2)
        self.stackView.addArrangedSubview(self.logoutButton)

        self.stackView.snp.makeConstraints { maker in
            maker.bottomMargin.equalToSuperview().offset(-20)
            maker.centerX.equalToSuperview()
            maker.width.equalToSuperview().multipliedBy(0.7)
        }
    }
}
