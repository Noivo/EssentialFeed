//
//  ImageCommentsEndpoint.swift
//  EssentialFeed
//
//  Created by João Noivo on 03/05/2023.
//

import Foundation

public enum ImageCommentsEndpoint {
    case get(UUID)

    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(id):
            return baseURL.appendingPathComponent("/v1/image/\(id)/comments")
        }
    }
}
