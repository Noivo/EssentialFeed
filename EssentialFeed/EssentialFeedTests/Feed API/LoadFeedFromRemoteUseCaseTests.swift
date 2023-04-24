//
//  LoadFeedFromRemoteUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by João Noivo on 01/02/2023.
//

import XCTest
import EssentialFeed

class LoadFeedFromRemoteUseCaseTests: XCTestCase {
  
  func test_load_deliversErrorOnNon200HTTPResponse() {
    let (sut, client) = makeSUT()
    
    let samples =  [199, 201, 300, 400, 500]
    
    samples.enumerated().forEach { index, code in
      expect(sut, toCompleteWith: failure(.invalidData)) {
        let json = makeItemsJSON([])
        client.complete(withStatusCode: code, data: json, at: index)
      }
    }
  }
  
  func test_load_deliversErrorOn200HTTPResponseWithInvalidJSON() {
    let (sut, client) = makeSUT()
    
    expect(sut, toCompleteWith: failure(.invalidData)) {
      let invalidJSON = Data("invalid json".utf8)
      client.complete(withStatusCode: 200, data: invalidJSON)
    }
  }
  
  func test_load_deliversNoItemsOn200HTTPResponseWithEmptyJSONList() {
    let (sut, client) = makeSUT()

    expect(sut, toCompleteWith: .success([])) {
      let emptyListJSON = makeItemsJSON([])
      client.complete(withStatusCode: 200, data: emptyListJSON)
    }
  }
  
  // Happy path
  func test_load_deliversItemsOn200HTTPResponseWIthJSONItems() {
    let (sut, client) = makeSUT()
    
    let item1 = makeItem(
      id: UUID(),
      imageURL: URL(string: "http://a-url.com")!
    )
        
    let item2 = makeItem(
      id: UUID(),
      description: "description",
      location: "location",
      imageURL: URL(string: "http://another-url.com")!
    )
    
    let items = [item1.model, item2.model]
    
    expect(sut, toCompleteWith: .success(items)) {
      let json = makeItemsJSON([item1.json, item2.json])
      client.complete(withStatusCode: 200, data: json)
    }
  }
  
  // MARK: - Helpers
  
  private func makeSUT(
    url: URL = URL(string: "https://a-url.com")!,
    file: StaticString = #file,
    line: UInt = #line
  ) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
    let client = HTTPClientSpy()
    let sut = RemoteFeedLoader(url: url, client: client)
    trackForMemoryLeaks(sut, file: file, line: line)
    trackForMemoryLeaks(client, file: file, line: line)
    return (sut, client)
  }
  
  private func failure(_ error: RemoteFeedLoader.Error) -> RemoteFeedLoader.Result {
    return .failure(error)
  }
  
  private func makeItem(id: UUID, description: String? = nil, location: String? = nil, imageURL: URL) -> (model: FeedImage, json: [String: Any]) {
    let item = FeedImage(id: id, description: description, location: location, url: imageURL)
    
    let json = [
      "id": id.uuidString,
      "description": description,
      "location": location,
      "image": imageURL.absoluteString
    ].reduce(into: [String: Any]()) { (acc, e) in
      if let value = e.value { acc[e.key] = value }
    }
    
    return (item, json)
  }
  
  private func makeItemsJSON(_ items: [[String: Any]]) -> Data {
    let json = ["items": items]
    
    return try! JSONSerialization.data(withJSONObject: json)
  }
  
  private func expect(
    _ sut: RemoteFeedLoader,
    toCompleteWith expectedResult: RemoteFeedLoader.Result,
    when action: () -> Void,
    file: StaticString = #file,
    line: UInt = #line
  ) {
    
    let exp = expectation(description: "Wait for load completion")
    
    sut.load { receivedResult in
      switch (receivedResult, expectedResult) {
      case let (.success(receivedItems), .success(expectedItems)):
        XCTAssertEqual(receivedItems, expectedItems, file: file, line: line)
      
      case let (.failure(receivedError as RemoteFeedLoader.Error), .failure(expectedError as RemoteFeedLoader.Error)):
        XCTAssertEqual(receivedError, expectedError, file: file, line: line)
        
      default:
        XCTFail("Expected result \(expectedResult) got \(receivedResult) instead", file: file, line: line)
      }
      
      exp.fulfill()
    }
          
    action()
    
    wait(for: [exp], timeout: 1.0)
  }
  
}
