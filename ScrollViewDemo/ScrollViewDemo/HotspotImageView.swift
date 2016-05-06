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

let brousseou = Building(name: "Brousseou Hall", rect: CGRectMake(1613, 3090, 250, -600))
let galileo = Building(name: "Galileo Hall", rect: CGRectMake(1712, 3413, 500, -230))
let garaventa = Building(name: "Garaventa Hall", rect: CGRectMake(2880, 3712, 190, -260))
let dante = Building(name: "Dante Hall", rect: CGRectMake(2890, 3400, 390, -235))
let sah = Building(name: "Saint Albert Hall Library", rect: CGRectMake(3315, 3712, 250, -235))
let delasalle = Building(name: "De La Salle Hall", rect: CGRectMake(3961, 3478, 200, -380))
let bjWest = Building(name: "Brother Jerome West Hall", rect: CGRectMake(1622, 4037, 220, -315))
let sichel = Building(name: "Sichel Hall", rect: CGRectMake(1873, 3686, 300, -160))
let fab = Building(name: "Filippi Administrative Building", rect: CGRectMake(1852, 3993, 325, -190))
let fah = Building(name: "Filippi Academic Hall", rect: CGRectMake(3736, 4080, 490, -255))
let augustine = Building(name: "Augustine Hall", rect: CGRectMake(3785, 3700, 480, -110))
let dryOlive = Building(name: "Dryden/Oliver", rect: CGRectMake(2726, 2944, 360, -480))

protocol HotspotImageViewDelegate { func hotspotHit(name: String) }

class HotspotImageView: UIImageView {
    
    var delegate: HotspotImageViewDelegate! = nil
    
    var buildings: [Building] = [brousseou, galileo, garaventa, dante, sah, delasalle, bjWest, sichel, fab, fah,
                                 augustine, dryOlive]
    
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
        var name: String = "N/A"
        for building in buildings {
            //test if touch point is within building
            
            if CGRectContainsPoint(building.rect, touchPoint) {
              
                found = true
                name = building.name
                break
            }
        }
        print(touchPoint.x)
        print(touchPoint.y)
        print("found is now \(found)")
        print("building name is \(name)")
        
    }
    
    
    
}
