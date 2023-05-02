//
//  ListViewController+TestHelpers.swift
//  EssentialAppTests
//
//  Created by João Noivo on 01/05/2023.
//

import UIKit
import EssentialFeediOS

extension ListViewController {
    
    @discardableResult
    func simulateFeedImageBecomingVisibleAgain(at row: Int) -> FeedImageCell? {
        let view = simulateFeedImageViewNotVisible(at: row)

        let delegate = tableView.delegate
        let index = IndexPath(row: row, section: feedImagesSection)
        delegate?.tableView?(tableView, willDisplay: view!, forRowAt: index)

        return view
    }
    
    private var feedImagesSection: Int { 0 }

}
