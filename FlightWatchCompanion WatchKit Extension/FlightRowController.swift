//
//  FlightRowController.swift
//  FlightWatchCompanion
//
//  Created by Dan Isacson on 11/03/15.
//  Copyright (c) 2015 dna. All rights reserved.
//

import UIKit
import WatchKit

class FlightRowController: NSObject {
   
    @IBOutlet var flightNumberLabel: WKInterfaceLabel!
    @IBOutlet var fromLabel: WKInterfaceLabel!
    @IBOutlet var toLabel: WKInterfaceLabel!
    @IBOutlet var timeLabel: WKInterfaceLabel!
    @IBOutlet var dateLabel: WKInterfaceLabel!
    
    @IBOutlet var statusSeparator: WKInterfaceSeparator!
    @IBOutlet var statusLabel: WKInterfaceLabel!
    
    func setupRow(flight: Flight){
        if let flightNumber = flight.flightId {
            self.flightNumberLabel.setText("Flight \(flightNumber)")
        }
        if let from = flight.from?.city {
            self.fromLabel.setText("\(from) to")
        }
        if let to = flight.to?.city {
            self.toLabel.setText(to)
        }
        if let time = flight.departureTime {
            self.timeLabel.setText(TimeAndDateFormatter.timeString(time))
            self.dateLabel.setText(TimeAndDateFormatter.dateString(time))
        }
        
        self.setStatusLabel(flight)
    }
    
    func setStatusLabel(flight: Flight){
        //Different statuses: Online Checkin available, Checkin, Boarding
        if(flight.state == .Checkin){
            if(flight.isCurrentlyCounterCheckin()){
                self.statusLabel.setText("Check-in")
                return
            }
            if(flight.isCurrentlyOnlineCheckin()){
                self.statusLabel.setText("Online Check-in available")
                return
            }
        }else if(flight.state == .Boarding){
            if flight.isCurrentlyBoarding(){
                if let gate = flight.gate {
                    self.statusLabel.setText("Now boarding at Gate \(gate)")
                    return
                }
                self.statusLabel.setText("Now boarding")
                return
            }else if let boardingTime = flight.boardingTime{
 
                self.statusLabel.setText("Boarding at \(TimeAndDateFormatter.timeString(boardingTime))")
                return
            }
        }
        self.statusLabel.setHidden(true)
        self.statusSeparator.setHidden(true)
        
    }
}
