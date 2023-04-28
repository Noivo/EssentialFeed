//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by João Noivo on 16/03/2023.
//

import UIKit

extension UIRefreshControl {
  func update(isRefreshing: Bool) {
    isRefreshing ? beginRefreshing() : endRefreshing()
  }
}
