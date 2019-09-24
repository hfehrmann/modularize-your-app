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

class DashboardView: UIView {

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 2
        return view
    }()

    private lazy var flow1: UIButton = {
        let button = UIButton()
        button.setTitle("Flow 1", for: .normal)
        return button
    }()

    private lazy var flow2: UIButton = {
        let button = UIButton()
        button.setTitle("Flow 2", for: .normal)
        return button
    }()

    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
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
        }
    }
}
