//
//  CreateNewHouseInteractor.swift
//  Roommates-N-Bills
//
//  Created by Arvin San Miguel on 5/28/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import Foundation
protocol CreateNewHouseInteractorInput {
    func searchAddress(_ request: CreateNewHouse.SearchAddress.Request)
    func retrieveAddresses(_ request: CreateNewHouse.RetrieveAddresses.Request)
    func geocodeAddress(_ request: CreateNewHouse.GeoCode.Request)
}

protocol CreateNewHouseInteractorOutput {
    func presentSearchedAddress(_ response: CreateNewHouse.SearchAddress.Response)
    func presentRetrievedAddresses(_ response: CreateNewHouse.RetrieveAddresses.Response)
    func presentGeocodedAddress(_ response: CreateNewHouse.GeoCode.Response)
}


class CreateNewHouseInteractor: CreateNewHouseInteractorInput {
    
    var output : CreateNewHouseInteractorOutput!
    let worker = CreateNewHouseWorker()
    
    func searchAddress(_ request: CreateNewHouse.SearchAddress.Request) {
        let response = CreateNewHouse.SearchAddress.Response(addresses: request.address.address)
        output.presentSearchedAddress(response)
    }
    
    func retrieveAddresses(_ request: CreateNewHouse.RetrieveAddresses.Request) {
        let response = CreateNewHouse.RetrieveAddresses.Response(addresses: request.addresses.addresses)
        output.presentRetrievedAddresses(response)
    }
    
    func geocodeAddress(_ request: CreateNewHouse.GeoCode.Request) {
        worker.performGeocoding(request.data.fullAddress) { (placemark) in
            let response = CreateNewHouse.GeoCode.Response(addresses: placemark, fullAddress: request.data.fullAddress)
            self.output.presentGeocodedAddress(response)
        }
        
    }
    
}
