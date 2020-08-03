//
//  TabbedScrollView+Delegates.swift
//  FromHome
//
//  Created by Daniboy on 7/21/20.
//  Copyright © 2020 biaplutarco. All rights reserved.
//

import UIKit

extension TabbedScrollView: SegmentedTabViewDelegate {
    func segmentShouldChange(index: Int) {
        pagedScrollView.scrollToPage(page: index, animated: false)
        shouldUpdateTab = false
    }
}

extension TabbedScrollView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.pagedScrollView {
            if shouldUpdateTab {
                segmentedTabView.selectSegment(index: Int(pagedScrollView.currentPage.rounded()))
            }
        }
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        if scrollView == self.pagedScrollView {
            shouldUpdateTab = true
        }
    }
}
