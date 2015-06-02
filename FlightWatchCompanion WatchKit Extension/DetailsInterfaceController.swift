//
//  DetailsInterfaceController.swift
//  FlightWatchCompanion
//
//  Created by Dan Isacson on 11/03/15.
//  Copyright (c) 2015 dna. All rights reserved.
//

import WatchKit
import Foundation


class DetailsInterfaceController: WKInterfaceController {

    var flight: Flight?
    
    @IBOutlet var checkinGroup: WKInterfaceGroup!
    @IBOutlet var boardingGroup: WKInterfaceGroup!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.flight = context as? Flight
        if let flight = self.flight{
            self.setUpDetailsView(flight)
        }
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

    func setUpDetailsView(flight: Flight){
        self.setUpFlightInfoGroup(flight)
        
        if(flight.state == .Checkin){
            self.boardingGroup.setHidden(true)
            self.setUpCheckinGroup(flight)
        }else if(flight.state == .Boarding){
            self.checkinGroup.setHidden(true)
            self.setUpBoardingGroup(flight)
        }else{
            //thanks for flying
        }
    }
    
    //Flight info group outlets
    @IBOutlet var flightNumberLabel: WKInterfaceLabel!
    @IBOutlet var fromLabel: WKInterfaceLabel!
    @IBOutlet var toLabel: WKInterfaceLabel!
    @IBOutlet var timeLabel: WKInterfaceLabel!
    @IBOutlet var dateLabel: WKInterfaceLabel!
    
    func setUpFlightInfoGroup(flight: Flight){
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
    }
    
    //Check-in group outlets
    @IBOutlet var onlineCheckinStatusLabel: WKInterfaceLabel!
    @IBOutlet var onlineCheckinTimeLabel: WKInterfaceLabel!
    @IBOutlet var onlineCheckinDateLabel: WKInterfaceLabel!
    
    @IBOutlet var checkinTimeLabel: WKInterfaceLabel!
    @IBOutlet var checkinDateLabel: WKInterfaceLabel!
    @IBOutlet var checkinStatusLabel: WKInterfaceLabel!
    @IBOutlet var checkinCounterLabel: WKInterfaceLabel!
    @IBOutlet var checkinTerminalLabel: WKInterfaceLabel!
    
    func setUpCheckinGroup(flight: Flight){
        if(flight.isCurrentlyCounterCheckin()){
            //hide time and date
            self.checkinDateLabel.setHidden(true)
            self.checkinTimeLabel.setHidden(true)
            self.setUpCounterInfo(flight)
        }else{
            if let time = flight.counterCheckinTime{
                self.checkinStatusLabel.setHidden(true)
                self.setUpCounterInfo(flight)
            }else{
                self.checkinTimeLabel.setHidden(true)
                self.checkinDateLabel.setHidden(true)
                self.checkinStatusLabel.setText("Time information currently not available")
                self.checkinStatusLabel.setTextColor(UIColor.lightGrayColor())
                self.setUpCounterInfo(flight)
            }
        }
        if(flight.isCurrentlyOnlineCheckin()){
            self.onlineCheckinDateLabel.setHidden(true)
            self.onlineCheckinTimeLabel.setHidden(true)
        }else{
            if let time = flight.onlineCheckinTime{
                self.onlineCheckinStatusLabel.setHidden(true)
            }else{
                self.onlineCheckinDateLabel.setHidden(true)
                self.onlineCheckinTimeLabel.setHidden(true)
                self.onlineCheckinStatusLabel.setText("Time information currently not available")
                self.onlineCheckinStatusLabel.setTextColor(UIColor.lightGrayColor())
            }
        }
        
        //else, message of when checkin starts
    }
    
    func setUpCounterInfo(flight: Flight){
        if let counter = flight.checkinCounter{
            self.checkinCounterLabel.setText("Counter: \(counter)")
        }else{
            self.checkinCounterLabel.setHidden(true)
        }
        if let terminal = flight.from?.terminal{
            if let airport = flight.from?.airport {
                self.checkinTerminalLabel.setText("\(airport) \(terminal)")
            }else{
                self.checkinTerminalLabel.setText(terminal)
            }
        }else{
            self.checkinTerminalLabel.setHidden(true)
        }
    }
    

    //Boarding group outlets
    
    @IBOutlet var boardingTimeLabel: WKInterfaceLabel!
    @IBOutlet var boardingTerminalLabel: WKInterfaceLabel!
    @IBOutlet var boardingGateLabel: WKInterfaceLabel!
    @IBOutlet var boardingSeatLabel: WKInterfaceLabel!
    
    @IBOutlet var boardingSeparator: WKInterfaceSeparator!
    @IBOutlet var boardinQR: WKInterfaceImage!
    
    func setUpBoardingGroup(flight: Flight){
        self.setupBoardingTime(flight)
        self.setupBoardingTerminal(flight)
        self.setupGate(flight)
        self.setupSeat(flight)
        self.setupQR(flight)
    }
    func setupBoardingTime(flight: Flight){
        if flight.isCurrentlyBoarding(){
            self.boardingTimeLabel.setText("Now")
        }else{
            if let boardingTime = flight.boardingTime{
                self.boardingTimeLabel.setText(TimeAndDateFormatter.timeString(boardingTime))
            }else{
                self.boardingTimeLabel.setText("n/a")
            }
        }
    }
    func setupBoardingTerminal(flight: Flight){
        if let terminal = flight.from?.terminal{
            if let airport = flight.from?.airport{
                self.boardingTerminalLabel.setText("\(airport) \(terminal)")
            }else{
                self.boardingTerminalLabel.setText(terminal)
            }
        }else{
            self.boardingTerminalLabel.setHidden(true)
        }
    }
    func setupGate(flight: Flight){
        if let gate = flight.gate {
            self.boardingGateLabel.setText("Gate: \(gate)")
        }else{
            self.boardingGateLabel.setHidden(true)
        }
    }
    func setupSeat(flight: Flight){
        if let seat = flight.seat {
            self.boardingSeatLabel.setText("Seat: \(seat)")
        }else{
            self.boardingSeatLabel.setHidden(true)
        }
    }
    func setupQR(flight: Flight){
        if let qr = flight.qrImage{
            self.boardinQR.setImage(qr)
        }else{
            self.boardingSeparator.setHidden(true)
            self.boardinQR.setHidden(true)
        }
    }
    
}
