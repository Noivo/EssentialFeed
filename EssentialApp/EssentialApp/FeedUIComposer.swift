//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by João Noivo on 23/02/2023.
//

import UIKit
import Combine
import EssentialFeed
import EssentialFeediOS

public final class FeedUIComposer {
  private init() {}
    
    private typealias FeedPresentationAdapter = LoadResourcePresentationAdapter<[FeedImage], FeedViewAdapter>
  
  public static func feedComposedWith(
    feedLoader: @escaping () -> AnyPublisher<[FeedImage], Error>,
    imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher
  ) -> ListViewController {
      let presentationAdapter = FeedPresentationAdapter(loader: feedLoader)
    
    let feedController = makeListViewController(
      delegate: presentationAdapter,
      title: FeedPresenter.title
    )
    
    presentationAdapter.presenter = LoadResourcePresenter(
      resourceView: FeedViewAdapter(
        controller: feedController,
        imageLoader: imageLoader),
      loadingView: WeakRefVirtualProxy(feedController),
      errorView: WeakRefVirtualProxy(feedController),
      mapper: FeedPresenter.map)
      
    return feedController
  }
  
  private static func makeListViewController(delegate: FeedViewControllerDelegate, title: String) -> ListViewController {
    let bundle = Bundle(for: ListViewController.self)
    let stroyboard = UIStoryboard(name: "Feed", bundle: bundle)
    let feedController = stroyboard.instantiateInitialViewController() as! ListViewController
    feedController.delegate = delegate
    feedController.title = FeedPresenter.title
    
    return feedController
  }

}
