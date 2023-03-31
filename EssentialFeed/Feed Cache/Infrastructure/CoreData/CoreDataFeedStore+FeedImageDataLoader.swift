//
//  CoreDataFeedStore+FeedImageDataLoader.swift
//  EssentialFeed
//
//  Created by João Noivo on 31/03/2023.
//

import Foundation

extension CoreDataFeedStore: FeedImageDataStore {

  public func insert(_ data: Data, for url: URL, completion: @escaping (FeedImageDataStore.InsertionResult) -> Void) {
    perform { context in
      guard let image = try? ManagedFeedImage.first(with: url, in: context) else { return }

      image.data = data
      try? context.save()
    }
  }

  public func retrieve(dataForURL url: URL, completion: @escaping (FeedImageDataStore.RetrievalResult) -> Void) {
    perform { context in
      completion(Result {
        return try ManagedFeedImage.first(with: url, in: context)?.data
      })
    }
  }

}
