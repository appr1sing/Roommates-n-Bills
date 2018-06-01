//
//  CreateNewHouseWorker.swift
//  Roommates-N-Bills
//
//  Created by Arvin San Miguel on 5/31/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import Foundation
import MapKit

class CreateNewHouseWorker {
    
    func performGeocoding(_ address: String, completion: @escaping (_ placemarks: [CLPlacemark]) -> Void) {
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            guard let placemarks = placemarks else { return }
            completion(placemarks)
        }
        
    }
    
    
    
    
}
