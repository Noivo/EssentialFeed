//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by João Noivo on 02/02/2023.
//

import Foundation

public protocol HTTPClientTask {
  func cancel()
}

public protocol HTTPClient {
  typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
  /// The completion handler can be invoked in any thread.
  /// Clients are responsible to dispatch to approprate threads, if needed.
  @discardableResult
  func get(from url: URL, completion: @escaping (Result) -> Void) -> HTTPClientTask
}
