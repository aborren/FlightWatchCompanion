//
//  InterfaceController.swift
//  FlightWatchCompanion WatchKit Extension
//
//  Created by Dan Isacson on 11/03/15.
//  Copyright (c) 2015 dna. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
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
    
    override func handleActionWithIdentifier(identifier: String?, forLocalNotification localNotification: UILocalNotification) {
        if(identifier == "firstButtonAction"){
            println("clicked first")
        }else if(identifier == "secondButtonAction"){
            println("clicked second")
        }else{
            println("something else")
        }
    }

    override func handleActionWithIdentifier(identifier: String?, forRemoteNotification remoteNotification: [NSObject : AnyObject]) {
        if(identifier == "firstButtonAction"){
            println("clicked first")
        }else if(identifier == "secondButtonAction"){
            println("clicked second")
        }else{
            println("something else")
        }

    }
}
