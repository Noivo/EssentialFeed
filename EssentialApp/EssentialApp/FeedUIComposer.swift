//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by João Noivo on 23/02/2023.
//

import UIKit
import EssentialFeed
import EssentialFeediOS

public final class FeedUIComposer {
  private init() {}
  
  public static func feedComposedWith(feedLoader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController {
    let presentationAdapter = FeedLoaderPresentationAdapter(feedLoader: MainQueueDispatchDecorator(decoratee: feedLoader))
    
    let feedController = makeFeedViewController(
      delegate: presentationAdapter,
      title: FeedPresenter.title
    )
    
    presentationAdapter.presenter = FeedPresenter(
      feedView: FeedViewAdapter(
        controller: feedController,
        imageLoader: MainQueueDispatchDecorator(decoratee: imageLoader)
      ),
      loadingView: WeakRefVirtualProxy(feedController),
      errorView: WeakRefVirtualProxy(feedController)
    )
    return feedController
  }
  
  private static func makeFeedViewController(delegate: FeedViewControllerDelegate, title: String) -> FeedViewController {
    let bundle = Bundle(for: FeedViewController.self)
    let stroyboard = UIStoryboard(name: "Feed", bundle: bundle)
    let feedController = stroyboard.instantiateInitialViewController() as! FeedViewController
    feedController.delegate = delegate
    feedController.title = FeedPresenter.title
    
    return feedController
  }

}