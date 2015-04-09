//
//  LuggageInterfaceController.swift
//  FlightWatchCompanion
//
//  Created by Dan Isacson on 17/03/15.
//  Copyright (c) 2015 dna. All rights reserved.
//

import WatchKit
import Foundation


class LuggageInterfaceController: WKInterfaceController {

    @IBOutlet var baggageGroup: WKInterfaceGroup!
    @IBOutlet var dropoffGroup: WKInterfaceGroup!
    
    @IBOutlet var informationLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
        self.setupView(context as! Flight)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func setupView(flight: Flight){
        if(flight.didDropoff){
            self.setupBaggageGroup(flight)
        }else{
            if let dropoffTime = flight.dropoffTime{
                //if drop off time not over show baggage drop off information. in this case before boarding time
                if let boardingTime = flight.boardingTime{
                    if (boardingTime.timeIntervalSinceDate(NSDate()) >= 0){
                        self.setupBaggageDropoffGroup(flight)
                        return
                    }
                }
            }
            self.showInformationLabel()
        }
    }
    
    //baggage info outlets
    @IBOutlet var baggageItemsLabel: WKInterfaceLabel!
    @IBOutlet var baggageTable: WKInterfaceTable!
    
    func setupBaggageGroup(flight: Flight){
        self.dropoffGroup.setHidden(true)
        self.informationLabel.setHidden(true)
        
        self.baggageItemsLabel.setText("Checked-in items: \(flight.luggage.count)")
        self.baggageTable.setNumberOfRows(flight.luggage.count, withRowType: "baggage")
        
        for(var i = 0; i < flight.luggage.count; i++){
            var row = self.baggageTable.rowControllerAtIndex(i) as! LuggageRowController
            //no setup for now
        }
    }
    
    
    
    @IBOutlet var dropoffTimeLabel: WKInterfaceLabel!
    @IBOutlet var dropoffCounterLabel: WKInterfaceLabel!
    @IBOutlet var dropoffTerminalLabel: WKInterfaceLabel!
    
    func setupBaggageDropoffGroup(flight: Flight){
        self.baggageGroup.setHidden(true)
        self.informationLabel.setHidden(true)
        self.setupDropoffTime(flight)
        self.setupDropoffCounter(flight)
        self.setupDropoffTerminal(flight)
    }
    func setupDropoffTime(flight: Flight){
        if let time = flight.dropoffTime{
            self.dropoffTimeLabel.setText(TimeAndDateFormatter.timeString(time))
        }else{
            self.dropoffTimeLabel.setHidden(true)
        }
    }
    func setupDropoffCounter(flight: Flight){
        if let counter = flight.luggageCounter{
            self.dropoffCounterLabel.setText("Counter: \(counter)")
        }else{
            self.dropoffCounterLabel.setHidden(true)
        }
        
    }
    func setupDropoffTerminal(flight: Flight){
        if let terminal = flight.from?.terminal{
            if let airport = flight.from?.airport{
                self.dropoffTerminalLabel.setText("\(airport) \(terminal)")
            }else{
                self.dropoffTerminalLabel.setText(terminal)
            }
        }else{
            self.dropoffTerminalLabel.setHidden(true)
        }
    }
 
    func showInformationLabel(){
        self.dropoffGroup.setHidden(true)
        self.baggageGroup.setHidden(true)
    }
}
