//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by João Noivo on 09/04/2023.
//

import Foundation

public protocol FeedCache {
  func save(_ feed: [FeedImage]) throws
}
