//
//  CreateNewHouseModels.swift
//  Roommates-N-Bills
//
//  Created by Arvin San Miguel on 5/28/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import Foundation
import MapKit

struct CreateNewHouse {
    
    struct SearchAddress {
        struct Request {
            var address: CreateNewHouse.SearchAddress.ViewModel.Result
        }
        
        struct Response {
            var addresses: String
        }
        
        struct ViewModel {
            struct Result {
                var address: String
            }
            var displayedItems: Result
        }
    }
    
    struct RetrieveAddresses {
        struct Request {
            var addresses: CreateNewHouse.RetrieveAddresses.ViewModel.Result
        }
        
        struct Response {
            var addresses: [String]
        }
        
        struct ViewModel {
            struct Result {
                var addresses: [String]
            }
            var displayedItems: Result
        }
    }
    
    struct GeoCode {
        struct Request {
            var data : CreateNewHouse.GeoCode.ViewModel.Result
        }
        
        struct Response {
            var addresses: [CLPlacemark]
            var fullAddress: String 
        }
        
        struct ViewModel {
            
            struct Result {
                var fullAddress : String
                var subthoroughfare: String?
                var thoroughfare: String?
                var sublocality: String?
                var adminArea: String?
                var locality: String?
                var postal: String? 
            }
            
            var displayedItems : Result
        
        }
        
        
    }
    
}
