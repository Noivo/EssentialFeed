//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by João Noivo on 23/02/2023.
//

import Foundation

public protocol FeedImageDataLoader {
  func loadImageData(from url: URL) throws -> Data
}
