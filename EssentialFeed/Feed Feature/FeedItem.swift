//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by João Noivo on 31/01/2023.
//

import Foundation

public struct FeedItem: Equatable {
  public let id: UUID
  public let description: String?
  public let location: String?
  public let imageURL: URL
  
  // we need public for other modules can access
  public init(id: UUID, description: String?, location: String?, imageURL: URL) {
    self.id = id
    self.description = description
    self.location = location
    self.imageURL = imageURL
  }
}

extension FeedItem: Decodable {
  private enum CodingKeys: String, CodingKey {
    case id
    case description
    case location
    case imageURL = "image"
  }
}
