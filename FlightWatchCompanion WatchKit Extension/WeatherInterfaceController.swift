//
//  WeatherInterfaceController.swift
//  FlightWatchCompanion
//
//  Created by Dan Isacson on 11/03/15.
//  Copyright (c) 2015 dna. All rights reserved.
//

import WatchKit
import Foundation

//openweathermap API KEY : bf7df99ad9fde30fa56cb4c047b426e8

//TODO: celsius/fahrenheit setting

class WeatherInterfaceController: WKInterfaceController {

    @IBOutlet var weatherTable: WKInterfaceTable!
    var apiKey: String = "bf7df99ad9fde30fa56cb4c047b426e8" //not sure how to get from plist on a watchkit extension
    var imageDictionary: [String:String] = ["01d":"sunny", "02d":"partlycloudy", "03d":"cloudy", "04d":"brokencloudy", "09d":"showery", "10d":"rainy", "11d":"thundery", "13d":"snowy", "50d":"misty", "01n":"clearnighty", "02n":"partlycloudynight", "03n":"cloudy", "04n":"brokencloudy", "09n":"showery", "10n":"rainyneutral", "11n":"thundery", "13n":"snowy", "50n":"mistynight"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let city = "Berlin" //needs formatting for " " etc
        
        request(.GET, "http://api.openweathermap.org/data/2.5/forecast/daily?q=\(city)&mode=json&units=metric&cnt=7&APPID=\(apiKey)", parameters: nil, encoding: ParameterEncoding.URL).responseJSON { (_, _, response, _) -> Void in
            if let jsonResponse: AnyObject = response{
                println(jsonResponse)
                self.setWeatherTable(JSON(jsonResponse))
            }
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func setWeatherTable(json: JSON){
        if let days = json["list"].array {
            self.weatherTable.setNumberOfRows(days.count, withRowType: "weatherrow")
            
            for(var i = 0; i < days.count; i++){
                var row: WeatherRowController = self.weatherTable.rowControllerAtIndex(i) as WeatherRowController
                
                row.dayLabel.setText(self.dayStringFromEpochTime(days[i]["dt"].int))
                if let imageIcon = days[i]["weather"][0]["icon"].string{
                    row.icon.setImageNamed(self.imageDictionary[imageIcon])
                }
                row.statusLabel.setText(days[i]["weather"][0]["description"].string)
                let min = days[i]["temp"]["min"].int
                let max = days[i]["temp"]["max"].int
                row.temperatureLabel.setText("\(max!.description)° / \(min!.description)°")
            }
        }
    }
    
    func dayStringFromEpochTime(time: Int?)->String{
        var day: String = ""
        if let time = time{
            let interval = NSTimeInterval(time)
            var currentDay = NSDate(timeIntervalSince1970: interval)
            var dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "EEE, d MMM"
            day = dateFormatter.stringFromDate(currentDay)
        }
        return day
    }
    
}
