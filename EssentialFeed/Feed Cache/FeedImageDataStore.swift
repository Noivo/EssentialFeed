//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by João Noivo on 30/03/2023.
//

import Foundation

public protocol FeedImageDataStore {
  typealias Result = Swift.Result<Data?, Error>

  func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
