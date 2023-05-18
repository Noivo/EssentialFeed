//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by João Noivo on 30/03/2023.
//

import Foundation

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
