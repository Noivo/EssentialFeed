//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by João Noivo on 23/02/2023.
//

import Foundation

public protocol FeedImageDataLoaderTask {
  func cancel()
}

public protocol FeedImageDataLoader {
  typealias Result = Swift.Result<Data, Error>
  
  func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> FeedImageDataLoaderTask
}
