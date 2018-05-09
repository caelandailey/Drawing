//
//  ViewHolder.swift
//  pixelArt
//
//  Created by Caelan Dailey on 4/11/18.
//  Copyright © 2018 Caelan Dailey. All rights reserved.
//

import Foundation
import UIKit

// View holder for the world
class DrawViewHolder: UIView, UIScrollViewDelegate {
    
    let sizeFactor: CGFloat = 5
    
    let colorPickerControl: ColorControl = {
        let colorPickerControl = ColorControl()
        colorPickerControl.translatesAutoresizingMaskIntoConstraints = false
        return colorPickerControl
    }()
    
    let pixelView: DrawView = {
        let pixelView = DrawView()
        pixelView.translatesAutoresizingMaskIntoConstraints = false
        pixelView.backgroundColor = UIColor.white
        print("CREATING PIXELVIEW")
        return pixelView
    }()
    
    let pixelScrollView: UIScrollView = {
        
        let pixelScrollView = UIScrollView()
        pixelScrollView.translatesAutoresizingMaskIntoConstraints = false
        pixelScrollView.maximumZoomScale = 50
        pixelScrollView.bouncesZoom = false
        pixelScrollView.showsHorizontalScrollIndicator = false
        pixelScrollView.showsVerticalScrollIndicator = false
        pixelScrollView.bounces = false
        
        return pixelScrollView
    }()
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return pixelView
    }
    
    
    //ADD SUBVIEWS AND TARGETS
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        let colorPickerFrameHeight: CGFloat = 80
        pixelView.frame = CGRect(x: 0, y: 0, width: frame.width * sizeFactor, height: (frame.height - colorPickerFrameHeight) * sizeFactor)
        
        pixelView.pixelSize = 10/sizeFactor
        
        colorPickerControl.frame = CGRect(x: 0, y: frame.height - colorPickerFrameHeight, width: frame.width, height: colorPickerFrameHeight)
        pixelScrollView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height - colorPickerFrameHeight)
        
        pixelScrollView.addSubview(pixelView)
        pixelScrollView.delegate = self
        pixelScrollView.minimumZoomScale = 1/sizeFactor
        pixelScrollView.zoomScale = 1/sizeFactor
        pixelScrollView.contentSize = CGSize(width: pixelView.frame.width, height: pixelView.frame.height)
        
       
        addSubview(colorPickerControl)
        addSubview(pixelScrollView)
         addSubview(MenuViewHolder(frame: CGRect(x: 0, y: self.bounds.height/2, width: self.bounds.width, height: self.bounds.height/2)))
    }
    
    override func layoutSubviews() {
        pixelView.setNeedsDisplay()
        pixelScrollView.setNeedsDisplay()
    }
    
    private func viewWidth() -> CGFloat {
        return UIScreen.main.bounds.width*5
    }
    
    private func viewHeight() -> CGFloat {
        return UIScreen.main.bounds.height*5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
