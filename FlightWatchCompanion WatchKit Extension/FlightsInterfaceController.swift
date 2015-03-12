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
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
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
        self.flightsTable.setNumberOfRows(/*departures count*/3, withRowType: "flightrow")
        
        /*self.departuresTable.setNumberOfRows(departures.count, withRowType: "departuresrowcontroller")
        for(var i = 0; i < departures.count; i++){
            var row: DeparturesRowController = self.departuresTable.rowControllerAtIndex(i) as DeparturesRowController
            row.directionLabel.setText("\(departures[i].lineNumber) \(departures[i].direction)")
            //row.numberLabel.setText()
            var df = NSDateFormatter()
            df.dateFormat = "HH:mm"
            row.timeLabel.setText(df.stringFromDate(departures[i].departureTime))
        }*/
    }

}
