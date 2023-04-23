//
//  ImageCommentsMapper.swift
//  EssentialFeed
//
//  Created by João Noivo on 23/04/2023.
//

import Foundation

final class ImageCommentsMapper {
  private struct Root: Decodable {
      let items: [RemoteFeedItem]
  }

  static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemoteFeedItem] {
      guard response.isOK, let root = try? JSONDecoder().decode(Root.self, from: data) else {
          throw RemoteImageCommentsLoader.Error.invalidData
      }

      return root.items
  }
}
