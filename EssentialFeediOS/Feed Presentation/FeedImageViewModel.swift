//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by João Noivo on 24/02/2023.
//

import Foundation
import EssentialFeed

struct FeedImageViewModel<Image> {
  let description: String?
  let location: String?
  let image: Image?
  let isLoading: Bool
  let shouldRetry: Bool
  
  var hasLocation: Bool {
    return location != nil
  }
  
}
