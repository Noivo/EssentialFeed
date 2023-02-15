//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by João Noivo on 02/02/2023.
//

import Foundation

public enum HTTPClientResult {
  case success(Data, HTTPURLResponse)
  case failure(Error)
}

public protocol HTTPClient {
  /// The completion handler can be invoked in any thread.
  /// Clients are responsible to dispatch to approprate threads, if needed.
  func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
