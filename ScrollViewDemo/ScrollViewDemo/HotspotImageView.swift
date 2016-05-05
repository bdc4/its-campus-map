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
        let touchPoint = recognizer.locationOfTouch(0, inView: self)
        
        var found = false
        for building in buildings {
            //test if touch point is within building
            
            if CGRectContainsPoint(building.rect, touchPoint) {
                print("Touch suceeded")
                print(touchPoint.x)
                print(touchPoint.y)
                found = true
                break
            }
        }
        print("found is now \(found)")
        
    }
    
    
    
}
