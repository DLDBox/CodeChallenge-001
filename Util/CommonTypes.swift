//
//  CommonTypes.swift
//  CountryList
//
//  Created by Dana De Voe on 2/15/23.
//

import Foundation

/*
 This file contains the commonly used data types for this code base
 */

typealias Closure = () -> ()
typealias ClosureBool = (_ success: Bool) -> ()
typealias ClosureError = (_ error: ApplicationError? ) -> ()
typealias ClosureStringError = (_ string: String?,_ error: ApplicationError?) -> ()
typealias ClosureDataError = (_ data: Data?,_ error: ApplicationError?) -> ()
typealias ClosureCountryError = (_ data: [Country]?,_ error: ApplicationError?) -> ()
