//
//  DashboardViewController.swift
//  Dashboard
//
//  Created by Hans Fehrmann on 24/09/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

class DashboardViewController: UIViewController {

    private lazy var dashboardView: DashboardView = {
        let view = DashboardView()
        view.delegate = self
        return view
    }()

    private let coordinator: DashboardCoordinator

    init(coordinator: DashboardCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = self.dashboardView
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension DashboardViewController: DashboardViewDelegate {

    func dashboardViewDidClickFlow1(_ dashboardView: DashboardView) {
        self.coordinator.goToFlow1()
    }

    func dashboardViewDidClickFlow2(_ dashboardView: DashboardView) {
        debugPrint("Flow 2")
    }

    func dashboardViewDidClickLogout(_ dashboardView: DashboardView) {
        self.coordinator.didLogout()
    }
}
