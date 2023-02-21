//
//  ServerAPI.swift
//  CountryList
//
//  Created by Dana De Voe on 2/15/23.
//

import Foundation

/*
 This file is a facade for the Server object object.  It is designed to allow the code
 to interact with the server logic as API without having to handle the issues associate with
 server logic.
 */

class ServerAPI {
    
    func getCountries( completion: @escaping ClosureCountryError ) {
        
        Server().handleEndPoint(endpoint: .getCountries, completion: { data, error in
            
            if let error = error {
                completion( nil, error )
            } else if let data = data {
                
                if let country = try? JSONDecoder().decode([Country].self, from: data) {
                    completion( country, nil )
                } else {
                    completion( nil, ApplicationError.unknown )
                }
                
            } else {
                completion( nil,ApplicationError.unknown )
            }
            
        })
    }
}
