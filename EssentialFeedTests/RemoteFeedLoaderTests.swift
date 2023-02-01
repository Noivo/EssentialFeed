//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by João Noivo on 01/02/2023.
//

import XCTest
import EssentialFeed

class RemoteFeedLoaderTests: XCTestCase {
  
  // Test Name Convencion
  // test_methodName_behaviourExpected
  func test_init_doesNotRequestDataFromURL() {
    let (_, client) = makeSUT()
    
    XCTAssertTrue(client.requestedURLs.isEmpty)
  }
  
  func test_load_requestsDataFromURL() {
    // Arrange - "Given a client and a sut"
    let url = URL(string: "https://a-given-url.com")!
    let (sut, client) = makeSUT(url: url)
    
    // Act - "When we invoke sut.load()
    sut.load()
    
    // Assert - "Then assert that a URL request was initiated in the client"
    XCTAssertEqual(client.requestedURLs, [url])
  }
  
  func test_loadTwice_requestsDataFromURLTwice() {
    let url = URL(string: "https://a-given-url.com")!
    let (sut, client) = makeSUT(url: url)
    
    sut.load()
    sut.load()
    
    XCTAssertEqual(client.requestedURLs, [url, url])
  }
  
  // MARK: - Helpers
  
  private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
    let client = HTTPClientSpy()
    let sut = RemoteFeedLoader(url: url, client: client)
     
    return (sut, client)
  }
  
  private class HTTPClientSpy: HTTPClient {
    var requestedURLs = [URL]()
    
    func get(from url: URL) {
      requestedURLs.append(url)
    }
  }
  
}
