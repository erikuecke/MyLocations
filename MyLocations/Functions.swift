//
//  Functions.swift
//  MyLocations
//
//  Created by Erik Uecke on 8/16/17.
//  Copyright © 2017 Erik Uecke. All rights reserved.
//

import Foundation
import Dispatch
import CoreData

func afterDelay(_ seconds: Double, closure: @escaping () -> ()){
    
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: closure)
}

let applicationDocumentsDirectory: URL = {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask )
    return paths[0]
}()

let MyManagedObjectContextSaveDidFailNotification = Notification.Name( rawValue: "MyManagedObjectContextSaveDidFailNotification")

func fatalCoreDataError(_ error: Error) {
    print("*** Fatal error: \(error)")
    NotificationCenter.default.post( name: MyManagedObjectContextSaveDidFailNotification, object: nil)
}


