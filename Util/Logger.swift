//
//  Logger.swift
//  CountryList
//
//  Created by Dana De Voe on 2/15/23.
//

import Foundation

/*
 And object for logging errors.  This object prints to the screen, but could be designed with
 a transport layer to send logs to disk, database, or cloud, etc.
 */

class Logger {
    static let shared = Logger()

    func log( _ error: Error, _ description: String? = nil) {
        if let description = description {
            print( "Error(\(error): \(description)" )
        } else {
            print( "Error(\(error)" )
        }
    }
    
    func log( _ description: String ) {
        print( "\(description)" )
    }
    
}
