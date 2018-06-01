//
//  CreateNewHousePresenter.swift
//  Roommates-N-Bills
//
//  Created by Arvin San Miguel on 5/28/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import Foundation
import UIKit

protocol CreateNewHousePresenterInput {
    func presentSearchedAddress(_ response: CreateNewHouse.SearchAddress.Response)
    func presentRetrievedAddresses(_ response: CreateNewHouse.RetrieveAddresses.Response)
    func presentGeocodedAddress(_ response: CreateNewHouse.GeoCode.Response)
}

protocol CreateNewHousePresenterOutput: class {
    func displaySearchedAddress(_ viewModel: CreateNewHouse.SearchAddress.ViewModel)
    func displayRetrievedAddresses(_ viewModel: CreateNewHouse.RetrieveAddresses.ViewModel)
    func displayGeocodedAddress(_ viewModel: CreateNewHouse.GeoCode.ViewModel)
    
}

class CreateNewHousePresenter: CreateNewHousePresenterInput {
    
    weak var output : CreateNewHousePresenterOutput!
    
    func presentSearchedAddress(_ response: CreateNewHouse.SearchAddress.Response) {
        let viewModel = CreateNewHouse.SearchAddress.ViewModel(displayedItems: CreateNewHouse.SearchAddress.ViewModel.Result(address: response.addresses))
        output.displaySearchedAddress(viewModel)
    }
    
    func presentRetrievedAddresses(_ response: CreateNewHouse.RetrieveAddresses.Response) {
        let viewModel = CreateNewHouse.RetrieveAddresses.ViewModel(displayedItems: CreateNewHouse.RetrieveAddresses.ViewModel.Result(addresses: response.addresses))
        output.displayRetrievedAddresses(viewModel)
    }
    
    func presentGeocodedAddress(_ response: CreateNewHouse.GeoCode.Response) {
        let viewModel = CreateNewHouse.GeoCode.ViewModel(displayedItems: response.convertCLPlacemarkToString())
        output.displayGeocodedAddress(viewModel)
    }
    
}

extension CreateNewHouse.GeoCode.Response {
    
    func convertCLPlacemarkToString() -> CreateNewHouse.GeoCode.ViewModel.Result {
        
        if let subthoroughfare = self.addresses[0].subThoroughfare,
            let thoroughfare = self.addresses[0].thoroughfare,
            let sublocality = self.addresses[0].locality,
            let adminArea = self.addresses[0].administrativeArea,
            let locality = self.addresses[0].locality,
            let postal = self.addresses[0].postalCode {
            
                return CreateNewHouse.GeoCode.ViewModel.Result(fullAddress: self.fullAddress,
                                                               subthoroughfare: subthoroughfare,
                                                               thoroughfare: thoroughfare,
                                                               sublocality: sublocality,
                                                               adminArea: adminArea,
                                                               locality: locality,
                                                               postal: postal)
        }
        
        return CreateNewHouse.GeoCode.ViewModel.Result(fullAddress: "",
                                                       subthoroughfare: "",
                                                       thoroughfare: "",
                                                       sublocality: "",
                                                       adminArea: "",
                                                       locality: "",
                                                       postal: "")
    }
    
}
