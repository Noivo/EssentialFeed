//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by João Noivo on 09/02/2023.
//

import Foundation

public protocol FeedStore {
  typealias DeletionCompletion = (Error?) -> Void
  typealias InsertionCompletion = (Error?) -> Void
  
  func deleteCachedFeed(completion: @escaping DeletionCompletion)
  func insert(_ items: [LocalFeedItem], timestamp: Date, completion: @escaping InsertionCompletion)
}
