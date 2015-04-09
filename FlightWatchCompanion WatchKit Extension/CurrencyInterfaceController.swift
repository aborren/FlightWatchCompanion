//
//  CurrencyInterfaceController.swift
//  FlightWatchCompanion
//
//  Created by Dan Isacson on 11/03/15.
//  Copyright (c) 2015 dna. All rights reserved.
//

import WatchKit
import Foundation


class CurrencyInterfaceController: WKInterfaceController {
    
    @IBOutlet var currencyLabel: WKInterfaceLabel!
    @IBOutlet var exchangeLabel: WKInterfaceLabel!
    
    //set from context later on
    var fromNation: String?
    var toNation: String?
    
    //maybe make this to a class instead
    var fromCurrency: String = ""
    var toCurrency: String = ""
    var fromCurrencySymbol: String = ""
    var toCurrencySymbol: String = ""

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let flight = context as! Flight
        self.fromNation = flight.from?.countryCode
        self.toNation = flight.to?.countryCode
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.getCurrencyInformation()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func getCurrencyInformation(){
        request(.GET, "http://www.freecurrencyconverterapi.com/api/v3/countries", parameters: nil, encoding: ParameterEncoding.URL).responseJSON { (_, _, response, _) -> Void in
            if let jsonResponse: AnyObject = response{
                var json = JSON(jsonResponse)
                if let fromNation = self.fromNation{
                    if let from = json["results"][fromNation]["currencyId"].string{
                        self.fromCurrency = from
                    }
                    if let fromSymbol = json["results"][fromNation]["currencySymbol"].string {
                        self.fromCurrencySymbol = fromSymbol
                    }
                }
                
                if let toNation = self.toNation{
                    if let to = json["results"][toNation]["currencyId"].string{
                        self.toCurrency = to
                    }
                    if let toSymbol = json["results"][toNation]["currencySymbol"].string{
                        self.toCurrencySymbol = toSymbol
                    }
                }
                
                self.callExchangeAndDrawView()
            }
        }
    }
    
    func callExchangeAndDrawView(){
        request(.GET, "http://www.freecurrencyconverterapi.com/api/v3/convert?q=\(self.fromCurrency)_\(self.toCurrency)&compact=ultra", parameters: nil, encoding: ParameterEncoding.URL).responseJSON { (_, _, response, _) -> Void in
            if let jsonResponse: AnyObject = response{
                var json = JSON(jsonResponse)
                let exchange = json["\(self.fromCurrency)_\(self.toCurrency)"]
                let exchangeString = String(format: "%.4f", exchange.double!)
                self.currencyLabel.setText("\(self.fromCurrency) : \(self.toCurrency)")
                self.exchangeLabel.setText("1\(self.fromCurrencySymbol) = \(exchangeString)\(self.toCurrencySymbol)")
            }
        }

    }

    @IBAction func swapCurrencyBtnClick() {
        
        var tmpCurrency = self.fromCurrency
        self.fromCurrency = self.toCurrency
        self.toCurrency = tmpCurrency
        
        var tmpSymbol = self.fromCurrencySymbol
        self.fromCurrencySymbol = self.toCurrencySymbol
        self.toCurrencySymbol = tmpSymbol
        
        self.callExchangeAndDrawView()        
    }
}
