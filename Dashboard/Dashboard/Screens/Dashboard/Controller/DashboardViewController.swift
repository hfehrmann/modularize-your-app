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

    override func loadView() {
        self.view = self.dashboardView
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension DashboardViewController: DashboardViewDelegate {

    func dashboardViewDidClickFlow1(_ dashboardView: DashboardView) {
        debugPrint("Flow 1")
    }

    func dashboardViewDidClickFlow2(_ dashboardView: DashboardView) {
        debugPrint("Flow 2")
    }

    func dashboardViewDidClickLogout(_ dashboardView: DashboardView) {
        debugPrint("Logout")
    }


}
