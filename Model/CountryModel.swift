//
//  CountryModel.swift
//  CountryList
//
//  Created by Dana De Voe on 2/15/23.
//

import Foundation

/*
 This file contains the main model for the application.  It is designed to imported the contains of the
 json file at: https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json
 
 [
    {
     "capital": "Kabul",
     "code": "AF",
     "currency": {
       "code": "AFN",
       "name": "Afghan afghani",
       "symbol": "؋"
     },
     "flag": "https://restcountries.eu/data/afg.svg",
     "language": {
       "code": "ps",
       "name": "Pashto"
     },
     "name": "Afghanistan",
     "region": "AS"
   },
 
   ...
 ]
 
 */

public struct Country: Decodable {
    public let capital, code: String?
    public let currency: Currency?
    public let flag: String?
    public let language: Language?
    public let name, region: String?
    
}

public struct Currency: Decodable {
    public let code, name, symbol: String?
}

public struct Language: Decodable {
    public let code, name: String?
}

typealias CountryList = [Country]
