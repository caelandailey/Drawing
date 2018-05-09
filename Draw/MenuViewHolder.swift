//
//  MenuView.swift
//  Draw
//
//  Created by Caelan Dailey on 5/8/18.
//  Copyright © 2018 Caelan Dailey. All rights reserved.
//

import Foundation
import UIKit

// Views

class MenuViewHolder: UIView {
    
    let barView: UIView = {
        let barView = UIView()
        return barView
    }()
    
    let circleView: UIView = {
        let circleView = UIView()
        return circleView
    }()
    
    let viewHolder: UIView = {
        let viewHolder = UIView()
        viewHolder.backgroundColor = UIColor.darkGray
        return viewHolder
    }()
    
    let chatButton: UIButton = {
        let chatButton = UIButton()
        return chatButton
    }()
    
    let colorButton: UIButton = {
        let colorButton = UIButton()
        return colorButton
    }()
    
    //ADD SUBVIEWS AND TARGETS
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add
        addSubview(barView)
        addSubview(circleView)
        //addSubview(chatButton)
        //addSubview(colorButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        let barInset: CGFloat = 20
        let barSize: CGFloat = 40
        let circleSize = self.bounds.width/4
        // Frame and set
        barView.frame = CGRect(x: 0, y: barInset, width: self.bounds.width, height: self.bounds.height - barInset)
        circleView.frame = CGRect(x: self.bounds.width/2 - circleSize/2, y: 0, width: circleSize, height: circleSize )
        
        barView.backgroundColor = UIColor.darkGray
        circleView.backgroundColor = UIColor.darkGray
        circleView.layer.cornerRadius = circleView.frame.size.width/2
        circleView.layer.masksToBounds = true
    }
    
}
