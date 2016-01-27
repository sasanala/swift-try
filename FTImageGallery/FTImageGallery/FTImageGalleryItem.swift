//
//  FTImageGalleryItem.swift
//  FTImageGallery
//
//  Created by 竹田 on 2016/1/27.
//  Copyright © 2016年 ChuroCat. All rights reserved.
//

import UIKit

class FTImageGalleryItem: UIScrollView, UIScrollViewDelegate {
    
    // MARK: - Property

    var imageView = UIImageView()
    let zoomEnabled: Bool
    
    // MARK: - Initializer
    
    init(image: UIImage, zoomEnabled: Bool) {
        self.zoomEnabled = zoomEnabled
        
        super.init(frame: CGRectNull)

        imageView.image = image
        imageView.clipsToBounds = true
        imageView.userInteractionEnabled = true
        
        setImageCenter()
        
        // scroll view configuration
        self.delegate = self
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.addSubview(imageView)
        self.minimumZoomScale = 1.0
        self.maximumZoomScale = calculateMaximumScale()
        
        // tap gesture recognizer
        let tap = UITapGestureRecognizer(target: self, action: "tapZoom")
        tap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Zoom
    
    func isZoomed() -> Bool {
        return self.zoomScale != self.minimumZoomScale
    }
    
    func zoomOut() {
        setZoomScale(minimumZoomScale, animated: false)
    }
    
    // MARK: - Action
    
    func tapZoom() {
        if isZoomed() {
            setZoomScale(minimumZoomScale, animated: true)
        } else {
            setZoomScale(maximumZoomScale, animated: true)
        }
    }
    
    // MARK: - Layout
    
    private func screenSize() -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
    private func calculateImageViewSize() -> CGSize {
        if let image = imageView.image {
            let picSize = image.size
            let picRatio = picSize.width / picSize.height
            let screenRatio = screenSize().width / screenSize().height
            
            if (picRatio > screenRatio){
                return CGSize(width: screenSize().width, height: screenSize().width / picSize.width * picSize.height)
            } else {
                return CGSize(width: screenSize().height / picSize.height * picSize.width, height: screenSize().height)
            }
        } else {
            return CGSize(width: screenSize().width, height: screenSize().height)
        }
    }
    
    private func calculateMaximumScale() -> CGFloat {
        // maximum scale is fixed to 3.0 for now. This may be overriden to perform a more sophisticated computation
        return 3.0
    }
    
    private func setImageCenter() {
        var intendHorizon = (screenSize().width - imageView.frame.width ) / 2
        var intendVertical = (screenSize().height - imageView.frame.height ) / 2
        intendHorizon = intendHorizon > 0 ? intendHorizon : 0
        intendVertical = intendVertical > 0 ? intendVertical : 0
        contentInset = UIEdgeInsets(top: intendVertical, left: intendHorizon, bottom: intendVertical, right: intendHorizon)
    }
    
    private func isFullScreen() -> Bool {
        return imageView.frame.width >= screenSize().width && imageView.frame.height >= screenSize().height
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !zoomEnabled {
            imageView.frame.size = frame.size;
        } else if (!isZoomed()) {
            imageView.frame.size = calculateImageViewSize()
            setImageCenter()
        }
        
        if isFullScreen() {
            clearContentInsets()
        } else {
            setImageCenter()
        }
        
        self.contentSize = imageView.frame.size
        self.maximumZoomScale = calculateMaximumScale()
    }
    
    func clearContentInsets(){
        self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        setImageCenter()
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.zoomEnabled ? imageView : nil;
    }
    
}