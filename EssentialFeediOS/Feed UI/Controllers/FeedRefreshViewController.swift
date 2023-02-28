//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by João Noivo on 23/02/2023.
//

import UIKit

protocol FeedRefreshViewControllerDelegate {
  func didRequestFeedRefresh()
}

final class FeedRefreshViewController: NSObject, FeedLoadingView {
  @IBOutlet private var view: UIRefreshControl?
  
  var delegate: FeedRefreshViewControllerDelegate?
  
  @IBAction func refresh() {
    delegate?.didRequestFeedRefresh()
  }
  
  func display(_ viewModel: FeedLoadingViewModel) {
    if viewModel.isLoading {
      view?.beginRefreshing()
    } else {
      view?.endRefreshing()
    }
  }
  
}

