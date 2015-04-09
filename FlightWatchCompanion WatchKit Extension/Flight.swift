//
//  Flight.swift
//  FlightWatchCompanion
//
//  Created by Dan Isacson on 17/03/15.
//  Copyright (c) 2015 dna. All rights reserved.
//

import Foundation
import UIKit

enum State {
    case Checkin
    case Boarding
    case Departed
}

class Flight{
    
    var state: State?
    var flightId: String?
    var from: FlightStop?
    var to: FlightStop?
    var departureTime: NSDate?
    
    var onlineCheckinTime: NSDate?
    var counterCheckinTime: NSDate?
    var checkinCounter: String?
    
    var luggage: [Luggage] = []
    var dropoffTime: NSDate?
    var luggageCounter: String?
    var didDropoff: Bool = false
    
    var boardingTime: NSDate?
    var gate: String?
    var seat: String?
    var qrImage: UIImage?
    
    init(){
    }
    
    func isCurrentlyOnlineCheckin()->Bool{
        if let onlineCheckinTime = self.onlineCheckinTime{
            if(onlineCheckinTime.timeIntervalSinceDate(NSDate()) <= 0){
                return true
            }
        }
        return false
    }
    func isCurrentlyCounterCheckin()->Bool{
        if let checkinTime = self.counterCheckinTime {
            if(checkinTime.timeIntervalSinceDate(NSDate()) <= 0){
                return true
            }
        }
        return false
    }
    func isCurrentlyBoarding()->Bool{
        if let boardingTime = self.boardingTime{
            if(boardingTime.timeIntervalSinceDate(NSDate()) <= 0){
                return true
            }
        }
        return false
    }
}