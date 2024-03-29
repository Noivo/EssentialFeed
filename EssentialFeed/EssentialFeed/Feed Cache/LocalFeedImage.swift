//
//  LocalFeedImage.swift
//  EssentialFeed
//
//  Created by João Noivo on 09/02/2023.
//

import Foundation

public struct LocalFeedImage: Equatable {
  public let id: UUID
  public let description: String?
  public let location: String?
  public let url: URL
  
  // we need public for other modules can access
  public init(id: UUID, description: String?, location: String?, url: URL) {
    self.id = id
    self.description = description
    self.location = location
    self.url = url
  }
}
