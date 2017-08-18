//
//  Location+CoreDataClass.swift
//  MyLocations
//
//  Created by Erik Uecke on 8/16/17.
//  Copyright © 2017 Erik Uecke. All rights reserved.
//

import Foundation
import CoreData
import MapKit


public class Location: NSManagedObject, MKAnnotation {

    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    public var title: String? {
        if locationDescription.isEmpty {
            return "(No Description)"
        } else {
            return locationDescription
        }
    }
    public var subtitle: String? {
        return category
    }

}
