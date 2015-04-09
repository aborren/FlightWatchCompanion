//
//  FlightsInterfaceController.swift
//  FlightWatchCompanion
//
//  Created by Dan Isacson on 11/03/15.
//  Copyright (c) 2015 dna. All rights reserved.
//

import WatchKit
import Foundation


class FlightsInterfaceController: WKInterfaceController {

    @IBOutlet var flightsTable: WKInterfaceTable!
    var flights: [Flight] = []
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        flights.append(FlightGenerator.flight4())
        flights.append(FlightGenerator.flight3())
        flights.append(FlightGenerator.flight2())
        flights.append(FlightGenerator.flight1())
        flights.append(FlightGenerator.flight0())
        self.setFlightsTable()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func setFlightsTable(){
        self.flightsTable.setNumberOfRows(flights.count, withRowType: "flightrow")
        
        for(var i = 0; i < flights.count; i++){
            var row = self.flightsTable.rowControllerAtIndex(i) as! FlightRowController
            row.setupRow(flights[i])
        }
    }
    
    override func contextsForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> [AnyObject]? {
        return [self.flights[rowIndex], self.flights[rowIndex], self.flights[rowIndex], self.flights[rowIndex]]
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
