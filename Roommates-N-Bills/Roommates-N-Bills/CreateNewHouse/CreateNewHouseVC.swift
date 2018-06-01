//
//  CreateNewHouseViewController.swift
//  Roommates-N-Bills
//
//  Created by Arvin San Miguel on 5/28/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import UIKit
import Hero
import SnapKit
import MapKit
import DropDown

protocol CreateNewHouseVCInput {
    func displaySearchedAddress(_ viewModel: CreateNewHouse.SearchAddress.ViewModel)
    func displayRetrievedAddresses(_ viewModel: CreateNewHouse.RetrieveAddresses.ViewModel)
    func displayGeocodedAddress(_ viewModel: CreateNewHouse.GeoCode.ViewModel)
}

protocol CreateNewHouseVCOutput {
    func searchAddress(_ request: CreateNewHouse.SearchAddress.Request)
    func retrieveAddresses(_ request: CreateNewHouse.RetrieveAddresses.Request)
    func geocodeAddress(_ request: CreateNewHouse.GeoCode.Request)
}


class CreateNewHouseVC: UIViewController {

    let lineOne_textfield = UITextField()
    let lineTwo_textfield = UITextField()
    let city_textfield = UITextField()
    let zip_textfield = UITextField()
    let dropDown = DropDown()
    
    var retrievedAddresses = [String]()
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()
    
    var output : CreateNewHouseVCOutput!
    var router : CreateNewHouseRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.layoutUI()
        self.setupSearchCompleter()
        self.setupDropdown()
        CreateNewHouseConfigurator.sharedInstance.configure(self)
    
    }
    
    @objc func respondToSwipeRight(_ sender: UISwipeGestureRecognizer) {
        
        if let swipeGesture = sender as UISwipeGestureRecognizer? {
            switch swipeGesture.direction {
            case .left:
                self.router.goToInitialVC()
            default:
                break
            }
        }
    }
    
    @objc func editingChanged(_ sender: UITextField) { 
        if let address = sender.text as String? {
            let result = CreateNewHouse.SearchAddress.ViewModel.Result(address: address)
            let request = CreateNewHouse.SearchAddress.Request(address: result)
            output.searchAddress(request)
            //self.searchCompleter.queryFragment = address
        }
    }
    
    func displaySearchedAddress(_ viewModel: CreateNewHouse.SearchAddress.ViewModel) {
        self.searchCompleter.queryFragment = viewModel.displayedItems.address
    }
 
    func displayRetrievedAddresses(_ viewModel: CreateNewHouse.RetrieveAddresses.ViewModel) {
        self.retrievedAddresses = viewModel.displayedItems.addresses
    }
    
    func displayGeocodedAddress(_ viewModel: CreateNewHouse.GeoCode.ViewModel) {
        self.configureTextfields(viewModel)
    }
    
}

extension CreateNewHouseVC {
    
    // MARK - HELPER FUNCTIONS
    
    private func configureDropdown(_ addresses: [String]) {
        let result = CreateNewHouse.RetrieveAddresses.ViewModel.Result(addresses: addresses)
        let request = CreateNewHouse.RetrieveAddresses.Request(addresses: result)
        output.retrieveAddresses(request)
        
        self.dropDown.dataSource = retrievedAddresses
        self.dropDown.direction = .bottom
        self.dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        self.dropDown.width = dropDown.anchorView?.plainView.bounds.width
        self.dropDown.show()
        self.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            
            let request = CreateNewHouse.GeoCode.Request(data: CreateNewHouse.GeoCode.ViewModel.Result(fullAddress: addresses[index],
                                                                                                       subthoroughfare: nil,
                                                                                                       thoroughfare: nil,
                                                                                                       sublocality: nil,
                                                                                                       adminArea: nil,
                                                                                                       locality: nil,
                                                                                                       postal: nil))
            self.output.geocodeAddress(request)
            self.lineOne_textfield.resignFirstResponder()
        }
    }
    
    private func configureTextfields(_ viewModel: CreateNewHouse.GeoCode.ViewModel) {
        guard let subthrufare = viewModel.displayedItems.subthoroughfare,
              let thrufare = viewModel.displayedItems.thoroughfare,
              let locality = viewModel.displayedItems.locality,
              let adminArea = viewModel.displayedItems.adminArea,
              let postal = viewModel.displayedItems.postal else { return }
        
        self.lineOne_textfield.text = subthrufare + " " + thrufare
        self.city_textfield.text = locality + ", " + adminArea
        self.zip_textfield.text = postal
    }
    
}

extension CreateNewHouseVC : MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        
        self.searchResults = completer.results
        let addresses = searchResults.map({ $0.title + " " + $0.subtitle })
        self.configureDropdown(addresses)
    
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {}
    
}
