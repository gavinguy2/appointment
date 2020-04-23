//
//  Item.swift
//  Appointment
//
//  Created by Stringham on 10/22/18.
//  Copyright © 2018 Stringham. All rights reserved.
//

import UIKit
class Item: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(appType, forKey: "appType")
        aCoder.encode(appLocation, forKey: "appLocation")
        aCoder.encode(itemKey, forKey: "itemKey")
        aCoder.encode(appDate, forKey: "appDate")
        aCoder.encode(appTime, forKey: "appTime")
    }
    
    required init?(coder aDecoder: NSCoder) {
        appType = aDecoder.decodeObject(forKey: "appType") as! String
        appLocation = aDecoder.decodeObject(forKey: "appLocation") as! String
        itemKey = aDecoder.decodeObject(forKey: "itemKey") as! String
        appDate = aDecoder.decodeObject(forKey: "appDate") as! String
        appTime = aDecoder.decodeObject(forKey: "appTime") as! String
        super.init()
    }
    
    var appType: String
    var appDate: String
    var appTime: String
    var appLocation: String
    let itemKey: String
    
    init(type: String, date: String, time: String, location: String) {
        self.appType = type
        self.appDate = date
        self.appTime = time
        self.appLocation = location
        self.itemKey = UUID().uuidString
        super.init()
    }
    
    
    convenience init(random: Bool = false) {
        if random {
            let types = ["Doctor", "Dentist", "Nails", "Hair"]
            let dates = ["10/22/18", "11/11/18", "12/1/18","12/31/18"]
            let times = ["4:00 PM", "8:00 AM", "12:00 PM", "1:00 AM"]
            let locations = ["Main St", "Bluff St", "View Dr","Lloyd Dr" ]
            
            var idx = arc4random_uniform(UInt32(types.count))
            let randomType = types[Int(idx)]
            
            idx = arc4random_uniform(UInt32(dates.count))
            let randomDate = dates[Int(idx)]
            
            idx = arc4random_uniform(UInt32(times.count))
            let randomTime = times[Int(idx)]
            
            idx = arc4random_uniform(UInt32(locations.count))
            let randomLocation = locations[Int(idx)]
            
            self.init(type: randomType,date: randomDate,time: randomTime, location: randomLocation)
                      
        } else {
            self.init(type: "",date: "",time: "",location: "")
        }
       
    }

    
    
    
    
    
    
    
    
    
    
}
    

