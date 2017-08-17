//
//  MapViewController.swift
//  MyLocations
//
//  Created by Erik Uecke on 8/17/17.
//  Copyright © 2017 Erik Uecke. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    var managedObjectContext: NSManagedObjectContext!
    
    @IBAction func showUser() {
        let region = MKCoordinateRegionMakeWithDistance( mapView.userLocation.coordinate, 1000, 1000)
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
    }
    
    @IBAction func showLocations() {
    }
}
extension MapViewController: MKMapViewDelegate {
}


