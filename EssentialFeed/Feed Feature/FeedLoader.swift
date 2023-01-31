//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by João Noivo on 31/01/2023.
//

import Foundation

enum LoadFeedResult {
  case success([FeedItem])
  case error(Error)
}

protocol FeedLoader {
  func load(completion: @escaping (LoadFeedResult) -> Void)
}
