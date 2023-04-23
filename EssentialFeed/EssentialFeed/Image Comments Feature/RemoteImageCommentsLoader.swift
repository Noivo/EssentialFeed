//
//  RemoteImageCommentsLoader.swift
//  EssentialFeed
//
//  Created by João Noivo on 23/04/2023.
//

import Foundation

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
  }
}
