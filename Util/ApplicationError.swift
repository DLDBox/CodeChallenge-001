//
//  ApplicationError.swift
//  CountryList
//
//  Created by Dana De Voe on 2/15/23.
//

import Foundation

/*
    This file implements this applications error codes
 */

enum ApplicationError: Error {
    case unknown
    case success
    case notFound
    case invalidRequest
    case invalidCredentials
    case maxResourcesExceeded
    case networkNotAvailable
    
    //
    //MARK: - Help functions
    //
    
    static func error( _ error: Error ) -> ApplicationError {
        return .unknown
    }
    
    static func netError( _ errorCode: Int ) -> ApplicationError {
        
        switch errorCode {
        case 200:
            return .success
        case 400:
            return .invalidRequest
        case 401:
            return .invalidCredentials
        case 404:
            return .notFound
        case -1103:
            return .maxResourcesExceeded
        default:
            return .unknown
        }
    
    }
    
}
