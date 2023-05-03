//
//  FeedEndpoint.swift
//  EssentialFeed
//
//  Created by João Noivo on 03/05/2023.
//

import Foundation

public enum FeedEndpoint {
    case get

    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            return baseURL.appendingPathComponent("/v1/feed")
        }
    }
}
