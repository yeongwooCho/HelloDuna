//
//  ColorStyle.swift
//  HelloDuna
//
//  Created by yeongwoocho on 2022/07/10.
//

import UIKit

enum ColorStyle: String {
    case backgroundColor
    case textColor
    case dividerColor

    var color: UIColor {
        switch  self {
        case .backgroundColor:
            return UIColor(red: 0.537, green: 0.564, blue: 0.592, alpha: 1)
        case .textColor:
            return .white
        case .dividerColor:
            return UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        }
    }
}
