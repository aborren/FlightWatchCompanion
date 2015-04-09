//
//  TimeAndDateFormatter.swift
//  FlightWatchCompanion
//
//  Created by Dan Isacson on 18/03/15.
//  Copyright (c) 2015 dna. All rights reserved.
//

import Foundation

class TimeAndDateFormatter{
    class func timeString(date: NSDate)->String{
        // add some setting to determine which format
        let timeFormat = NSDateFormatter()
        timeFormat.dateFormat = "h:mm a"
        return timeFormat.stringFromDate(date)
    }
    
    class func dateString(date: NSDate)->String{
        let dateFormat = NSDateFormatter()
        dateFormat.dateFormat = "MMM d, y"
        return dateFormat.stringFromDate(date)
    }
}