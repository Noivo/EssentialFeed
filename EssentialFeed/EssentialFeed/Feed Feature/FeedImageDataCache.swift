//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by João Noivo on 10/04/2023.
//

import Foundation

public protocol FeedImageDataCache {
  func save(_ data: Data, for url: URL) throws
}
