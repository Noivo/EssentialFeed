//
//  CoreDataFeedStore+FeedImageDataLoader.swift
//  EssentialFeed
//
//  Created by João Noivo on 31/03/2023.
//

import Foundation

extension CoreDataFeedStore: FeedImageDataStore {

  public func insert(_ data: Data, for url: URL, completion: @escaping (FeedImageDataStore.InsertionResult) -> Void) {

  }

  public func retrieve(dataForURL url: URL, completion: @escaping (FeedImageDataStore.RetrievalResult) -> Void) {
    completion(.success(.none))
  }

}
