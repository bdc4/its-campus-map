//
//  ViewController.swift
//  ScrollViewController
//
//  Created by Joyce Echessa on 6/3/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate, HotspotImageViewDelegate {
    
    var scrollView: UIScrollView!
    var hotspotImageView: HotspotImageView!
    
    
    func hotspotHit(name: String) {}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hotspotImageView = HotspotImageView(image: UIImage(named: "Campus_map.png"))
        hotspotImageView.userInteractionEnabled = true
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor.blackColor()
        scrollView.contentSize = hotspotImageView.bounds.size
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        scrollView.contentOffset = CGPoint(x: 1000, y: 450)
        
        scrollView.addSubview(hotspotImageView)
        view.addSubview(scrollView)
        
        scrollView.delegate = self
        
        setZoomScale()
        
        setupGestureRecognizer()
    }

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return hotspotImageView
    }
    
    override func viewWillLayoutSubviews() {
        setZoomScale()
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        let imageViewSize = hotspotImageView.frame.size
        let scrollViewSize = scrollView.bounds.size
        
        let verticalPadding = imageViewSize.height < scrollViewSize.height ?
            (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ?
            (scrollViewSize.width - imageViewSize.width) / 2 : 0
        
        scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding,
                                               bottom: verticalPadding, right: horizontalPadding)
    }
    
    func setZoomScale() {
        let imageViewSize = hotspotImageView.bounds.size
        let scrollViewSize = scrollView.bounds.size
        let widthScale = scrollViewSize.width / imageViewSize.width
        let heightScale = scrollViewSize.height / imageViewSize.height
        
       
        scrollView.minimumZoomScale = min(widthScale, heightScale)
        scrollView.zoomScale = 0.25
        
    }
    
    func setupGestureRecognizer() {
        let doubleTap = UITapGestureRecognizer(target: self,
                                               action: #selector(ScrollViewController.handleDoubleTap(_:)))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.cancelsTouchesInView = true
        scrollView.addGestureRecognizer(doubleTap)
        
        let singleTap = UITapGestureRecognizer(target: hotspotImageView,
                                               action: #selector(HotspotImageView.handleSingleTap(_:)))
        singleTap.numberOfTapsRequired = 1
        singleTap.cancelsTouchesInView = false // we're not about this boolean
        hotspotImageView.addGestureRecognizer(singleTap)
    }
    

    
    func handleDoubleTap(recognizer: UITapGestureRecognizer) {
        
        if (scrollView.zoomScale > scrollView.minimumZoomScale) {
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        } else {
            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
        }
    }

}

