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

protocol Flow1ViewDelegate: AnyObject {
    func flow1ViewDidClickFlow1(_ dashboardView: Flow1View)
    func flow1ViewDidClickFlow2(_ dashboardView: Flow1View)
    func flow1ViewDidClickLogout(_ dashboardView: Flow1View)
}

class Flow1View: UIView {

    private enum Constraints {
        static var rounderCorner: CGFloat { return 4 }
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        label.text = "Flow1 -> Nº \(self.numberToDisplay)"
        return label
    }()

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

    private let numberToDisplay: Int
    weak var delegate: Flow1ViewDelegate?

    init(numberToDisplay: Int) {
        self.numberToDisplay = numberToDisplay
        super.init(frame: .zero)
        configureView()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Button targets

private extension Flow1View {

    @objc
    func didClickFlow1() {
        self.delegate?.flow1ViewDidClickFlow1(self)
    }

    @objc
    func didClickFlow2() {
        self.delegate?.flow1ViewDidClickFlow2(self)
    }

    @objc
    func didClickLogout() {
        self.delegate?.flow1ViewDidClickLogout(self)
    }

}

// MARK: - View Configuration

private extension Flow1View {

    func configureView() {
        self.backgroundColor = .flow1

        self.addSubview(self.titleLabel)
        self.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.flow1)
        self.stackView.addArrangedSubview(self.flow2)
        self.stackView.addArrangedSubview(self.logoutButton)

        self.titleLabel.snp.makeConstraints { maker in
            maker.centerXWithinMargins.equalToSuperview()
            maker.topMargin.equalToSuperview().offset(30)
        }

        self.stackView.snp.makeConstraints { maker in
            maker.bottomMargin.equalToSuperview().offset(-20)
            maker.centerX.equalToSuperview()
            maker.width.equalToSuperview().multipliedBy(0.7)
        }
    }
}
