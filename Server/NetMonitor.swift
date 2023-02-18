//
//  NetMonitor.swift
//  CountryList
//
//  Created by Dana De Voe on 2/15/23.
//

import Foundation
import UIKit
import Network

/* Manages the connection status and provides a mechanism to
 trigger a closure to handle a desired action when the
 connection status changes
 
 NOTE: NWPathMonitor seem to have a bug in the simular and does not
        correctly report when the network connection is re-established, so
        please test netconnectivity recovery on a physical device.
 */

class NetMonitor {
    
    //
    //MARK: - Private section
    //
    private let netMonitor: NWPathMonitor
    private var connectClosure: ClosureBool?
    private var isInternetAccessible: Bool

    //
    //MARK: - Public section
    //
    static let shared = NetMonitor()
    
    var timeout: DispatchTimeInterval
    
    init() {
        self.netMonitor = NWPathMonitor()
        self.isInternetAccessible = false
        self.connectClosure = nil
        self.timeout = .seconds(15)

        self.setupCallBack()
    }
    
    /* This function is used to test for connectivity and to postpone
     the execution of the closure until connectivity has be re-established.
     
     PARAMETER:
        completion - will return a bool indicating that there is not connectivity
                    and that the call has not been made.  The closure will be called
                    once a connection has been created.
     
     Usage:
     
     NetMinder.shared.accessible { success in
         
         if success {
            // Do normal action here
         } else {
            // Do network lost action here
         }
     }

     */
    func accessible( _ completion: @escaping ClosureBool ) {
        if self.isInternetAccessible {
            completion(true)
        } else {
            self.connectClosure = completion
            
            DispatchQueue.main.asyncAfter(deadline: .now() + timeout , execute: {
                self.connectClosure?(false)
                self.connectClosure = nil
            })
        }
    }
    
    func cancelCallBack() {
        self.connectClosure = nil
    }
    
    //
    //MARK: - helper section
    //
    
    /* This function sets up the NetMinder object
     */
    private func setupCallBack() {
        self.netMonitor.pathUpdateHandler = { path in
            
            if path.status == .satisfied {
                self.isInternetAccessible = true
                
                if let connectClosure = self.connectClosure {
                    connectClosure(true)
                    self.connectClosure = nil
                }
                
            } else {
                self.isInternetAccessible = false
                if let connectClosure = self.connectClosure {
                    connectClosure(false)
                }
            }
        }
        
        let queue = DispatchQueue.global(qos: .background)
        self.netMonitor.start(queue: queue)
    }
    
}

