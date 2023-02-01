//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by João Noivo on 01/02/2023.
//

import XCTest

class RemoteFeedLoader {
  func load() {
    HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
  }
}

class HTTPClient {
  static let shared = HTTPClient()
  var requestedURL: URL?
  
  private init() {}
  
}

class RemoteFeedLoaderTests: XCTestCase {
  
  func test_init_doesNotRequestDataFromURL() {
    let client = HTTPClient.shared
    _ = RemoteFeedLoader()
    
    XCTAssertNil(client.requestedURL)
  }
  
  func test_load_requestDataFromURL() {
    // Arrange - "Given a client and a sut"
    let client = HTTPClient.shared
    let sut = RemoteFeedLoader()
    
    // Act - "When we invoke sut.load()
    sut.load()
    
    // Assert - "Then assert that a URL request was initiated in the client"
    XCTAssertNotNil(client.requestedURL)
  }
}
