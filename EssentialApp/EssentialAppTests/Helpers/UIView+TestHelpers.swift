//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by João Noivo on 17/04/2023.
//

import UIKit

extension UIView {
  func enforceLayoutCycle() {
      layoutIfNeeded()
      RunLoop.current.run(until: Date())
  }
}
