//
//  FlightStop.swift
//  FlightWatchCompanion
//
//  Created by Dan Isacson on 17/03/15.
//  Copyright (c) 2015 dna. All rights reserved.
//

import Foundation

class FlightStop {
    var country: String?
    var countryCode: String?
    var city: String?
    var airport: String?
    var airportCode: String?
    var terminal: String?
    
    init(){
        
    }
    
    init(country: String, countryCode: String, city: String, airport: String, airportCode: String, terminal: String?){
        self.country = country
        self.countryCode = countryCode
        self.city = city
        self.airport = airport
        self.airportCode = airportCode
        self.terminal = terminal
    }
}