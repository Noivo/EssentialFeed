//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by João Noivo on 31/01/2023.
//

import Foundation

public protocol FeedLoader {
  typealias Result = Swift.Result<[FeedImage], Error>
  
  func load(completion: @escaping (Result) -> Void)
}
