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
    
    private typealias FeedPresentationAdapter = LoadResourcePresentationAdapter<Paginated<FeedImage>, FeedViewAdapter>
  
  public static func feedComposedWith(
    feedLoader: @escaping () -> AnyPublisher<Paginated<FeedImage>, Error>,
    imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher,
    selection: @escaping (FeedImage) -> Void = { _ in }
  ) -> ListViewController {
      let presentationAdapter = FeedPresentationAdapter(loader: feedLoader)
    
      let feedController = makeListViewController(title: FeedPresenter.title)
      feedController.onRefresh = presentationAdapter.loadResource
    
    presentationAdapter.presenter = LoadResourcePresenter(
      resourceView: FeedViewAdapter(
        controller: feedController,
        imageLoader: imageLoader,
        selection: selection),
      loadingView: WeakRefVirtualProxy(feedController),
      errorView: WeakRefVirtualProxy(feedController),
      mapper: { $0 })
      
    return feedController
  }
  
  private static func makeListViewController(title: String) -> ListViewController {
    let bundle = Bundle(for: ListViewController.self)
    let stroyboard = UIStoryboard(name: "Feed", bundle: bundle)
    let feedController = stroyboard.instantiateInitialViewController() as! ListViewController
    feedController.title = FeedPresenter.title
    
    return feedController
  }

}
