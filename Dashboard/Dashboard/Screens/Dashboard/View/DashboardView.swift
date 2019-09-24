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

protocol DashboardViewDelegate: AnyObject {
    func dashboardViewDidClickFlow1(_ dashboardView: DashboardView)
    func dashboardViewDidClickFlow2(_ dashboardView: DashboardView)
    func dashboardViewDidClickLogout(_ dashboardView: DashboardView)
}

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
        button.addTarget(self, action: #selector(self.didClickFlow1), for: .touchUpInside)
        return button
    }()

    private lazy var flow2: UIButton = {
        let button = UIButton()
        button.setTitle("Flow 2", for: .normal)
        button.backgroundColor = .lightningBlue
        button.layer.cornerRadius = Constraints.rounderCorner
        button.addTarget(self, action: #selector(self.didClickFlow2), for: .touchUpInside)
        return button
    }()

    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.backgroundColor = .lightningBlue
        button.layer.cornerRadius = Constraints.rounderCorner
        button.addTarget(self, action: #selector(self.didClickLogout), for: .touchUpInside)
        return button
    }()

    weak var delegate: DashboardViewDelegate?

    init() {
        super.init(frame: .zero)
        configureView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Button targets

private extension DashboardView {

    @objc
    func didClickFlow1() {
        self.delegate?.dashboardViewDidClickFlow1(self)
    }

    @objc
    func didClickFlow2() {
        self.delegate?.dashboardViewDidClickFlow2(self)
    }

    @objc
    func didClickLogout() {
        self.delegate?.dashboardViewDidClickLogout(self)
    }

}

// MARK: - View Configuration

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
