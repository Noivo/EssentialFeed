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

public struct LocalFeedItem: Equatable {
  public let id: UUID
  public let description: String?
  public let location: String?
  public let imageURL: URL
  
  // we need public for other modules can access
  public init(id: UUID, description: String?, location: String?, imageURL: URL) {
    self.id = id
    self.description = description
    self.location = location
    self.imageURL = imageURL
  }
}

