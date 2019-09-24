//
//  DashboardViewController.swift
//  Dashboard
//
//  Created by Hans Fehrmann on 24/09/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

class Flow2ViewController: UIViewController {

    private lazy var flow1View: Flow2View = {
        let view = Flow2View(numberToDisplay: self.numberOfController)
        view.delegate = self
        return view
    }()

    private let numberOfController: Int
    private let coordinator: Flow2Coordinator

    init(coordinator: Flow2Coordinator, numberOfController: Int) {
        self.numberOfController = numberOfController
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

extension Flow2ViewController: Flow1ViewDelegate {

    func flow1ViewDidClickFlow1(_ dashboardView: Flow2View) {
        self.coordinator.goToFlow1(nextNumberOfDisplay: self.numberOfController + 1)
    }

    func flow1ViewDidClickFlow2(_ dashboardView: Flow2View) {
        self.coordinator.goToFlow2(nextNumberOfDisplay: self.numberOfController + 1)
    }

    func flow1ViewDidClickLogout(_ dashboardView: Flow2View) {
        self.coordinator.didLogout()
    }
}
