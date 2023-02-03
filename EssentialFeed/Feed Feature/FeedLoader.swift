//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by João Noivo on 31/01/2023.
//

import Foundation

public enum LoadFeedResult<Error: Swift.Error> {
  case success([FeedItem])
  case failure(Error)
}

protocol FeedLoader {
  associatedtype Error: Swift.Error
  
  func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
