//
//  HotspotImageView.swift
//  ScrollViewDemo
//
//  Created by student on 4/21/16.
//  Copyright © 2016 Appcoda. All rights reserved.
//

import UIKit

struct Building {
    let name: String
    let polygon: [CGPoint]
}


let upperLeft = CGPoint(x: 0, y: 0)
let upperRight = CGPoint(x: 100,y: 0)
let lowerRight = CGPoint(x: 100, y: 100)
let lowerLeft = CGPoint(x: 0, y: 100)

let aBuilding = Building(name: "Test Building", polygon: [upperLeft, upperRight, lowerRight, lowerLeft])


class HotspotImageView: UIImageView {
    
    var buildings: [Building] = [aBuilding]

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        let touchPoint: CGPoint = touch.locationInView(self)
        for building in buildings {
            //test if touch point is within building
            //if CGPathContainsPoint(building, nil, touchPoint, true) {
            //
            //}
            
            //CGMutablePathRef path = CGPathCreateMutable();
            
            /*
            make a CGPath from the polygon
            ask the path whether it contains the touchPoint by using
            CGPathContainsPoint()
            
            if it does, throw up an alert and break out of the loop
            
            // if it does not, continue looping
             */
          }
        
        
    }

}
