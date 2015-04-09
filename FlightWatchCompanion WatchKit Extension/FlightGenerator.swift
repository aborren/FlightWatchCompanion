//
//  FlightGenerator.swift
//  FlightWatchCompanion
//
//  Created by Dan Isacson on 17/03/15.
//  Copyright (c) 2015 dna. All rights reserved.
//

import Foundation
import UIKit

class FlightGenerator {
 
    class func flight0()->Flight{
        var flight = Flight()
        var from = FlightStop(country: "Sweden", countryCode: "SE", city: "Stockholm", airport: "Arlanda", airportCode: "ARN", terminal: "Terminal 4")
        var to = FlightStop(country: "Germany", countryCode: "DE", city: "Berlin", airport: "Berlin", airportCode: "BER", terminal: "Terminal 1")
        
        flight.state = .Checkin
        flight.flightId = "XY1000"
        flight.to = to
        flight.from = from
        
        
        
        flight.departureTime = NSDate().dateByAddingTimeInterval(3000)
        flight.boardingTime = NSDate().dateByAddingTimeInterval(1500)
        //flight.onlineCheckinTime = NSDate().dateByAddingTimeInterval(1000)
        //flight.counterCheckinTime = NSDate().dateByAddingTimeInterval(100)
        
        flight.dropoffTime = NSDate().dateByAddingTimeInterval(100)
        
        return flight
    }
    
    class func flight1()->Flight{
        var flight = Flight()
        var from = FlightStop(country: "Sweden", countryCode: "SE", city: "Stockholm", airport: "Arlanda", airportCode: "ARN", terminal: "Terminal 4")
        var to = FlightStop(country: "Japan", countryCode: "JP", city: "Tokyo", airport: "Narita", airportCode: "NRT", terminal: "Terminal 1")
        
        flight.state = .Checkin
        flight.flightId = "XY1854"
        flight.to = to
        flight.from = from
        
        flight.checkinCounter = "10-14"
        
        flight.departureTime = NSDate().dateByAddingTimeInterval(3000)
        flight.boardingTime = NSDate().dateByAddingTimeInterval(1500)
        flight.onlineCheckinTime = NSDate().dateByAddingTimeInterval(-1000)
        flight.counterCheckinTime = NSDate().dateByAddingTimeInterval(100)
        
        return flight
    }
    
    class func flight2()->Flight{
        var flight = Flight()
        var from = FlightStop(country: "Sweden", countryCode: "SE", city: "Stockholm", airport: "Arlanda", airportCode: "ARN", terminal: "Terminal 4")
        var to = FlightStop(country: "Germany", countryCode: "DE", city: "Berlin", airport: "Berlin", airportCode: "BER", terminal: "Terminal 1")
        
        flight.state = .Checkin
        flight.flightId = "XY1234"
        flight.to = to
        flight.from = from
        
        flight.checkinCounter = "23-39"
        
        flight.departureTime = NSDate().dateByAddingTimeInterval(3000)
        flight.boardingTime = NSDate().dateByAddingTimeInterval(1500)
        flight.onlineCheckinTime = NSDate().dateByAddingTimeInterval(-1000)
        flight.counterCheckinTime = NSDate().dateByAddingTimeInterval(-100)
        
        return flight
    }
    
    class func flight3()->Flight{
        var flight = Flight()
        var from = FlightStop(country: "Sweden", countryCode: "SE", city: "Stockholm", airport: "Arlanda", airportCode: "ARN", terminal: "Terminal 4")
        var to = FlightStop(country: "United States", countryCode: "US", city: "New York", airport: "Newark", airportCode: "NWK", terminal: "Terminal 1")
        
        flight.state = .Boarding
        flight.flightId = "AA314"
        flight.to = to
        flight.from = from
        
        flight.gate = "47E"
        flight.seat = "27A"
        flight.qrImage = UIImage(named: "sampleQR.jpg")
        
        flight.departureTime = NSDate().dateByAddingTimeInterval(3000)
        flight.boardingTime = NSDate().dateByAddingTimeInterval(100)
        flight.onlineCheckinTime = NSDate().dateByAddingTimeInterval(-1000)
        flight.counterCheckinTime = NSDate().dateByAddingTimeInterval(-100)
        
        flight.didDropoff = true
        flight.dropoffTime = NSDate().dateByAddingTimeInterval(-100)
        
        return flight
    }
    
    class func flight4()->Flight{
        var flight = Flight()
        var from = FlightStop(country: "Sweden", countryCode: "SE", city: "Stockholm", airport: "Arlanda", airportCode: "ARN", terminal: "Terminal 4")
        var to = FlightStop(country: "Germany", countryCode: "DE", city: "Berlin", airport: "Berlin", airportCode: "BER", terminal: "Terminal 1")
        
        flight.state = .Boarding
        flight.flightId = "XY1234"
        flight.to = to
        flight.from = from
        
        flight.gate = "3"
        flight.seat = "17D"
        flight.qrImage = UIImage(named: "sampleQR.jpg")
        
        flight.didDropoff = true
        flight.luggage.append(Luggage())
        flight.luggage.append(Luggage())
        
        flight.departureTime = NSDate().dateByAddingTimeInterval(3000)
        flight.boardingTime = NSDate().dateByAddingTimeInterval(-10)
        flight.onlineCheckinTime = NSDate().dateByAddingTimeInterval(-1000)
        flight.counterCheckinTime = NSDate().dateByAddingTimeInterval(-100)
        
        return flight
    }
}