//
//  FTImageGallery.swift
//  FTImageGallery
//
//  Created by 竹田 on 2016/1/27.
//  Copyright © 2016年 ChuroCat. All rights reserved.
//

import UIKit

class FTImageGallery: UIView, UIScrollViewDelegate {
    
    // MARK: - Property
    
    /// view
    let scrollView = UIScrollView()
    
    /// state
    private(set) var currentPage = 0
    private(set) var scrollViewPage = 0
    var currentImageGalleryItem: FTImageGalleryItem? {
        get {
            return imageGalleryItems.count > scrollViewPage ? imageGalleryItems[self.scrollViewPage] : nil
        }
    }
    
    /// preferences
    var zoomEnabled = true
    var circularEnabled = true
    var draggingEnabled = true {
        didSet {
            self.scrollView.userInteractionEnabled = draggingEnabled
        }
    }
    var imageContentMode: UIViewContentMode = .ScaleAspectFit {
        didSet {
            for view in imageGalleryItems {
                view.imageView.contentMode = imageContentMode
            }
        }
    }
    
    /// data
    private(set) var images = [UIImage]()
    private var scrollViewImages = [UIImage]()
    private(set) var imageGalleryItems = [FTImageGalleryItem]()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        autoresizesSubviews = true
        clipsToBounds = true
        
        // scroll view configuration
        scrollView.frame = frame
        scrollView.delegate = self
        scrollView.pagingEnabled = true
        scrollView.bounces = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.autoresizingMask = autoresizingMask
        self.addSubview(scrollView)

        layoutScrollView()
    }
    
    override func layoutSubviews() {
        layoutScrollView()
    }
    
    // MARK: - ScrollView
    
    /// updates frame of the scroll view and its inner items
    func layoutScrollView() {
        scrollView.frame = frame
        scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * CGFloat(scrollViewImages.count), scrollView.frame.size.height)
        
        for (index, view) in imageGalleryItems.enumerate() {
            let origin = CGPoint(x: scrollView.frame.size.width * CGFloat(index), y: 0)
            view.frame = CGRect(origin: origin, size: scrollView.frame.size)
            view.zoomOut()
        }
        
        setCurrentPage(currentPage, animated: false)
    }
    
    /// reloads scroll view with latest slideshowItems
    func reloadScrollView() {
        for view in imageGalleryItems {
            view.removeFromSuperview()
        }
        imageGalleryItems = []
        
        for image in scrollViewImages {
            let item = FTImageGalleryItem(image: image, zoomEnabled: zoomEnabled)
            item.imageView.contentMode = imageContentMode
            imageGalleryItems.append(item)
            scrollView.addSubview(item)
        }
        
        if circularEnabled && scrollViewImages.count > 1 {
            scrollViewPage = 1
            
            let origin = CGPoint(x: scrollView.frame.size.width, y: 0)
            let rect = CGRect(origin: origin, size: scrollView.frame.size)
            scrollView.scrollRectToVisible(rect, animated: false)
        } else {
            scrollViewPage = 0
        }
    }
    
    // MARK: Image

    func setImageInputs(inputs: [UIImage]) {
        self.images = inputs
        
        // in circular mode we add dummy first and last image to enable smooth scrolling
        if circularEnabled && images.count > 1 {
            var scImages = [UIImage]()
            
            if let last = images.last {
                scImages.append(last)
            }

            scImages += images

            if let first = images.first {
                scImages.append(first)
            }
            
            self.scrollViewImages = scImages
        } else {
            self.scrollViewImages = images;
        }
        
        reloadScrollView()
    }
    
    // MARK: paging methods
    
    func setCurrentPage(currentPage: Int, animated: Bool) {
        var pageOffset = currentPage
        if circularEnabled {
            pageOffset += 1
        }
        
        self.setScrollViewPage(pageOffset, animated: animated)
    }
    
    func setScrollViewPage(scrollViewPage: Int, animated: Bool) {
        if scrollViewPage < scrollViewImages.count {
            self.scrollView.scrollRectToVisible(CGRectMake(scrollView.frame.size.width * CGFloat(scrollViewPage), 0, scrollView.frame.size.width, scrollView.frame.size.height), animated: animated)
            self.setCurrentPageForScrollViewPage(scrollViewPage)
        }
    }
    
    func setCurrentPageForScrollViewPage(page: Int) {
        if scrollViewPage != page {
            // current page has changed, zoom out this image
            if imageGalleryItems.count > scrollViewPage {
                imageGalleryItems[scrollViewPage].zoomOut()
            }
        }
        
        scrollViewPage = page
        
        if circularEnabled {
            if page == 0 {
                // first page contains the last image
                currentPage = Int(images.count) - 1
            } else if page == scrollViewImages.count - 1 {
                // last page contains the first image
                currentPage = 0
            } else {
                currentPage = page - 1
            }
        } else {
            currentPage = page
        }
    }
    
    // MARK: UIScrollViewDelegate
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        setCurrentPageForScrollViewPage(page)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if circularEnabled {
            let regularContentOffset = scrollView.frame.size.width * CGFloat(images.count)
            
            if scrollView.contentOffset.x >= scrollView.frame.size.width * CGFloat(images.count + 1) {
                scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x - regularContentOffset, 0)
            } else if scrollView.contentOffset.x < 0 {
                scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x + regularContentOffset, 0)
            }
        }
    }
}