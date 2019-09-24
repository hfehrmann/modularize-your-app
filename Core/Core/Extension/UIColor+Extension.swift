//
//  UIColor+Extension.swift
//  Core
//
//  Created by Hans Fehrmann on 24/09/19.
//  Copyright © 2019 Hans Fehrmann. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {

    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        let percentRed = CGFloat(red) / 255
        let percentGreen = CGFloat(green) / 255
        let percentBlue = CGFloat(blue) / 255
        self.init(red: percentRed, green: percentGreen, blue: percentBlue, alpha: alpha)
    }

    static var lightningBlue: UIColor { return UIColor(red: 0.22, green: 0.57, blue: 0.97, alpha: 1) }

    static var gray95: UIColor { return UIColor(hue: 0, saturation: 0, brightness: 0.95, alpha: 1) }

    static var flow1: UIColor { return UIColor(red: 188, green: 245, blue: 66, alpha: 1) }

    static var flow2: UIColor { return UIColor(red: 0.22, green: 0.57, blue: 0.97, alpha: 1) }
}
