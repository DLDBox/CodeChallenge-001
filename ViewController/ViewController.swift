//
//  ViewController.swift
//  CountryList
//
//  Created by Dana De Voe on 2/15/23.
//

import UIKit

/*
 This main view controller for the application.
 */

class ViewController: UIViewController {
    
    @IBOutlet weak var countryListTable: UITableView!
    let model = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countryListTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        model.retrieveCountryList(completion: { error in
                
            guard let error = error else {
                DispatchQueue.main.async {
                    self.countryListTable.reloadData()
                }
                return
            }
            
            /* remember in the simulator when connectivity with the network is restored
               there is a bug in NWPathMonitor and this code will be called several times,
               to verify try running on an iPhone.
             */
            if error == .networkNotAvailable {
                Logger.shared.log(error)
                
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Network Error", message: "Network unavailable", preferredStyle: .alert)
                    
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                    }
                    
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true) {
                    }
                }                
            }
        })
    }
    
}

//
//MARK: UITableViewDataSource Implementation
//

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.countryCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let country = model.country(at: indexPath.row) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier") as? ListTableViewCell {
                
                cell.country = country
                
                return cell
            }
        } else {
            Logger.shared.log("This should never happen")
        }
        
        return UITableViewCell()
    }
    
    
}
