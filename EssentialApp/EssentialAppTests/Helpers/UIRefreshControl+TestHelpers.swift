//
//  UIRefreshControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by João Noivo on 23/02/2023.
//

import UIKit

extension UIRefreshControl {
  func simulatePullToRefresh() {
    simulate(event: .valueChanged)
  }
}
