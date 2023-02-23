//
//  UIControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by João Noivo on 23/02/2023.
//

import UIKit

extension UIControl {
  func simulate(event: UIControl.Event) {
    allTargets.forEach { target in
      actions(forTarget: target, forControlEvent: event)?.forEach {
        (target as NSObject).perform(Selector($0))
      }
    }
  }
}
