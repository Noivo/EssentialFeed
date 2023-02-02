//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by João Noivo on 31/01/2023.
//

import Foundation

public struct FeedItem: Equatable {
  let id: UUID
  let description: String?
  let location: String?
  let imageURL: URL
}
