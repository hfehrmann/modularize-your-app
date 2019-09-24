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

    private var dashboardView: DashboardView = {
        let view = DashboardView()
        return view
    }()

    override func loadView() {
        self.view = self.dashboardView
    }
}
