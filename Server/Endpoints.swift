//
//  Endpoints.swift
//  CountryList
//
//  Created by Dana De Voe on 2/15/23.
//

import Foundation

/*
 This file implements endpoints to the server as a enum.  Each member of the enum is an endpoint
 while the enum has helper functions which create the path, the url and urlrequest.  When creating
 the URLRequest, the header, and or body are created as needed by each endpoint
 */

enum EndPoint {
    case getCountries
    case additionalCommand
    
    var verb: String {
        switch self {
            case .getCountries: return  "GET"
            case .additionalCommand: return "POST"
        }
    }
    
    var path: String {
        
        switch self {
        case .getCountries: return "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
            
        default:return ""
        }
        
    }

    //TODO: The header for a given endpoint
    var header: [ String : String ]? {
        switch self {
        default:
            return nil
        }
    }
    
    //TODO: The body for a given endpoint
    var body: [ String : String ]? {
        switch self {
        default:
            return nil
        }
    }
    
    var request: URLRequest? {
        var request = URLRequest(url: URL(string:self.path)!)//WARN: unwrap
        
        request.httpMethod = self.verb // get the verb for this endpoint

        // Build Header for endpoints which need it
        // Build body for end point which needed it
                
        return request
    }
}
