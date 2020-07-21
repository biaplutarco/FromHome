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
        pagedScrollView.scrollToPage(index)
    }
}

extension TabbedScrollView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.pagedScrollView {
            segmentedTabView.selectSegment(index: Int(pagedScrollView.currentPage.rounded()))
        }
    }
}
