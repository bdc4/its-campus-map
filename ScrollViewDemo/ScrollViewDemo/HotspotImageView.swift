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
    let rect: CGRect
}


let upperLeft = CGPoint(x: 0, y: 0)
let upperRight = CGPoint(x: 100,y: 0)
let lowerRight = CGPoint(x: 100, y: 100)
let lowerLeft = CGPoint(x: 0, y: 100)



let aBuilding = Building(name: "Test Building", rect: CGRectMake(0, 0, 10000000, 100000000))

protocol HotspotImageViewDelegate { func hotspotHit(name: String) }

class HotspotImageView: UIImageView {
    
    var delegate: HotspotImageViewDelegate! = nil

    var buildings: [Building] = [aBuilding]

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    func handleSingleTap(recognizer: UITapGestureRecognizer) {
        print("handling single tap")
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        let touchPoint: CGPoint = touch.locationInView(self)
        for _ in buildings {
            //test if touch point is within building
            if CGRectContainsPoint(aBuilding.rect, touchPoint) {
            print("I've been touched!!!")
            break
            }
          }
    }

}
