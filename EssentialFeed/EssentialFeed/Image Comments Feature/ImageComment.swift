//
//  ImageComment.swift
//  EssentialFeed
//
//  Created by João Noivo on 23/04/2023.
//

import Foundation

public struct ImageComment: Equatable {
  public let id: UUID
  public let message: String
  public let createdAt: Date
  public let username: String

  public init(id: UUID, message: String, createdAt: Date, username: String) {
      self.id = id
      self.message = message
      self.createdAt = createdAt
      self.username = username
  }
}
