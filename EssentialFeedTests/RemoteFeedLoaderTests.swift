//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by João Noivo on 01/02/2023.
//

import XCTest

class RemoteFeedLoader {
  
}

class HTTPClient {
  var requestedURL: URL?
  
}

class RemoteFeedLoaderTests: XCTestCase {
  
  func test_init_doesNotRequestDataFromURL() {
    let client = HTTPClient()
    _ = RemoteFeedLoader()
    
    XCTAssertNil(client.requestedURL)
  }
}
