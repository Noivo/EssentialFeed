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
    sut.load { _ in }
    
    // Assert - "Then assert that a URL request was initiated in the client"
    XCTAssertEqual(client.requestedURLs, [url])
  }
  
  func test_loadTwice_requestsDataFromURLTwice() {
    let url = URL(string: "https://a-given-url.com")!
    let (sut, client) = makeSUT(url: url)
    
    sut.load { _ in }
    sut.load { _ in }
    
    XCTAssertEqual(client.requestedURLs, [url, url])
  }
  
  func test_load_deliversErrorOnClientError() {
    // Arrange - Given the sut and its HTTP client spy
    let (sut, client) = makeSUT()
    
    // Act - When we tell the sut to load and we complete the client's HTTP request with an error
    var capturedError = [RemoteFeedLoader.Error]()
    sut.load { capturedError.append($0) }
    
    let clientError = NSError(domain: "Test", code: 0)
    client.complete(with: clientError)
    
    // Assert - Then we expect the captured load error to be connectivity error
    XCTAssertEqual(capturedError, [.connectivity])
  }
  
  // MARK: - Helpers
  
  private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
    let client = HTTPClientSpy()
    let sut = RemoteFeedLoader(url: url, client: client)
     
    return (sut, client)
  }
  
  private class HTTPClientSpy: HTTPClient {
    private var messages = [(url: URL, completion: (Error) -> Void)]()
    
    var requestedURLs: [URL] {
      return messages.map { $0.url }
    }
    
    func get(from url: URL, completion: @escaping (Error) -> Void) {
      messages.append((url, completion))
    }
    
    func complete(with error: Error, at index: Int = 0) {
      messages[index].completion(error)
    }
  }
  
}
