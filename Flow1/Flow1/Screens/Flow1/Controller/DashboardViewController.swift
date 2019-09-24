//
//  DashboardViewController.swift
//  Dashboard
//
//  Created by Hans Fehrmann on 24/09/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

class Flow1ViewController: UIViewController {

    private lazy var flow1View: Flow1View = {
        let view = Flow1View()
        view.delegate = self
        return view
    }()

    private let coordinator: Flow1Coordinator

    init(coordinator: Flow1Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = self.flow1View
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension Flow1ViewController: Flow1ViewDelegate {

    func flow1ViewDidClickFlow1(_ dashboardView: Flow1View) {
        debugPrint("Flow 1")
    }

    func flow1ViewDidClickFlow2(_ dashboardView: Flow1View) {
        debugPrint("Flow 2")
    }

    func flow1ViewDidClickLogout(_ dashboardView: Flow1View) {
        self.coordinator.didLogout()
    }
}
