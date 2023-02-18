//
//  Server.swift
//  CountryList
//
//  Created by Dana De Voe on 2/15/23.
//

import Foundation

/*
 This file implement the server logic including connectivity using the NetMonitor object.
 */

class Server {
    //
    // Private member section
    //
    private let session = URLSession(configuration: .default)
    private var task: URLSessionDataTask?

    func handleEndPoint(endpoint: EndPoint, completion: @escaping ClosureDataError) {
        
        NetMonitor.shared.accessible { success in
            
            if success, let request = endpoint.request {
                
                self.task = self.session.dataTask(with: request) { [weak self] data, response, error in
                    
                  defer {
                    self?.task = nil
                  }
                  
                  if let error = error {
                    completion(nil, ApplicationError.error(error))
                  } else {
                    completion(data,nil)
                  }
                    
                }
                self.task?.resume()
                
            } else if success == false {
                completion( nil, ApplicationError.networkNotAvailable )
            }
        }
        
    }
    
    
}
