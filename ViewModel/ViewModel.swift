//
//  ViewModel.swift
//  CountryList
//
//  Created by Dana De Voe on 2/15/23.
//

import Foundation

/*
 This is the main view model, it handles retreiving the list of country from the serverAPI
 and persisting a copy of the data in the CountryModel array
 */

class ViewModel {
    private var countryList: [Country]? = nil
    
    public var countryCount: Int {
        return self.countryList?.count ?? 0
    }
    
    public func country(at: Int) -> Country? {
        if let countryList = self.countryList, at < countryList.count {
            return countryList[at]
        }
        return nil
    }
    
    func retrieveCountryList( completion: @escaping ClosureError ) {
        ServerAPI().getCountries(completion: { countries, error in
            
            if let error = error {
                completion(error)
                self.countryList = nil
            } else {
                self.countryList = countries
                completion(nil)
            }
        })
    }
}


