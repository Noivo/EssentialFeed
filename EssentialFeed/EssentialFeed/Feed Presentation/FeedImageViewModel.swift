//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by João Noivo on 23/03/2023.
//

public struct FeedImageViewModel {
  public let description: String?
  public let location: String?
  
  public var hasLocation: Bool {
    return location != nil
  }
}
