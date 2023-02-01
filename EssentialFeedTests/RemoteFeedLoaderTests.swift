//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by João Noivo on 01/02/2023.
//

import XCTest

class RemoteFeedLoader {
  let client: HTTPClient
  let url: URL
  
  init(url: URL, client: HTTPClient) {
    self.client = client
    self.url = url
  }
  
  func load() {
    client.get(from: url)
  }
}

protocol HTTPClient {
  func get(from url: URL)
  
}

class HTTPClientSpy: HTTPClient {
  var requestedURL: URL?
  
  func get(from url: URL) {
    requestedURL = url
  }
}

class RemoteFeedLoaderTests: XCTestCase {
  
  func test_init_doesNotRequestDataFromURL() {
    let url = URL(string: "https://a-url.com")!
    let client = HTTPClientSpy()
    _ = RemoteFeedLoader(url: url, client: client)
    
    XCTAssertNil(client.requestedURL)
  }
  
  func test_load_requestDataFromURL() {
    // Arrange - "Given a client and a sut"
    let url = URL(string: "https://a-given-url.com")!
    let client = HTTPClientSpy()
    let sut = RemoteFeedLoader(url:URL(string: "https://a-given-url.com")!, client: client)
    
    // Act - "When we invoke sut.load()
    sut.load()
    
    // Assert - "Then assert that a URL request was initiated in the client"
    XCTAssertEqual(client.requestedURL, url)
  }
}
