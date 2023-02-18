//
//  ListTableViewCell.swift
//  CountryList
//
//  Created by Dana De Voe on 2/15/23.
//

import Foundation
import UIKit

/*
 The tableView cell implementation
 */

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryCode: UILabel!
    @IBOutlet weak var countryCapital: UILabel!
    
    var country: Country? {
        
        set(value) {
            if let value = value, let name = value.name {
                let region = value.region ?? ""
                
                countryName.text = "\(name), \(region)"
                countryCode.text = value.code
                countryCapital.text = value.capital
            }
        }

        get { return nil }
    }
}
