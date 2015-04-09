//
//  NotificationController.swift
//  FlightWatchCompanion WatchKit Extension
//
//  Created by Dan Isacson on 11/03/15.
//  Copyright (c) 2015 dna. All rights reserved.
//

import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController {

    @IBOutlet var topLabel: WKInterfaceLabel!
    @IBOutlet var botLabel: WKInterfaceLabel!
    override init() {
        // Initialize variables here.
        super.init()
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    override func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a local notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        completionHandler(.Custom)
    }
    
    
    
    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a remote notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        
        let apsDict = remoteNotification["aps"] as! NSDictionary
        println(apsDict)
        self.topLabel.setText("Boarding soon")
        self.topLabel.setHidden(false)
        let flightinfo = apsDict["flightinfo"] as! NSDictionary
        let flightnumber = flightinfo["flightnumber"] as! String
        let gate = flightinfo["gate"] as! String
        let time = flightinfo["boardingtime"] as! String
        
        self.botLabel.setText("\(flightnumber)\n\(gate)\n\(time)")
        self.botLabel.setHidden(false)
        
        
        completionHandler(.Custom)
    }

}
