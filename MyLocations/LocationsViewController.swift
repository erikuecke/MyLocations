//
//  LocationsViewController.swift
//  MyLocations
//
//  Created by Erik Uecke on 8/16/17.
//  Copyright © 2017 Erik Uecke. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

class LocationsViewController: UITableViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    var locations = [Location]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1 
        let fetchRequest = NSFetchRequest<Location>()
        // 2 
        let entity = Location.entity()
        fetchRequest.entity = entity
        // 3 
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            // 4 
            locations = try managedObjectContext.fetch(fetchRequest)
        } catch {
            fatalCoreDataError(error)
        }
    }

    // MARK: - UITableViewDataSource 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell( withIdentifier: "LocationCell", for: indexPath)
            let location = locations[indexPath.row]
            let descriptionLabel = cell.viewWithTag(100) as! UILabel
            descriptionLabel.text = location.locationDescription
            let addressLabel = cell.viewWithTag(101) as! UILabel
            if let placemark = location.placemark {
                var text = ""
                if let s = placemark.subThoroughfare {
                    text += s + " "
                }
                if let s = placemark.thoroughfare {
                    text += s + ", "
                }
                if let s = placemark.locality {
                    text += s
                }
                addressLabel.text = text
            } else {
                addressLabel.text = ""
            }
            return cell
            
    }
}
    
