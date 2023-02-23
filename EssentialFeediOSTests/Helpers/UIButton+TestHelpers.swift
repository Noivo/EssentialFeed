//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by João Noivo on 23/02/2023.
//

import UIKit

extension UIButton {
  func simulateTap() {
    simulate(event: .touchUpInside)
  }
}
