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

class CreateNewHouseVC: UIViewController {

    let lineOne_textfield = UITextField()
    let lineTwo_textfield = UITextField()
    let city_textfield = UITextField()
    let zip_textfield = UITextField()
    let dropDown = DropDown()
    
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.layoutUI()
        self.searchCompleter.delegate = self
        self.searchCompleter.filterType = .locationsAndQueries
        self.lineOne_textfield.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        self.dropDown.anchorView = lineOne_textfield
        
        
    }
    
    @objc func respondToSwipeRight(_ sender: UISwipeGestureRecognizer) {
        
        if let swipeGesture = sender as UISwipeGestureRecognizer? {
            switch swipeGesture.direction {
            case .left:
                self.heroModalAnimationType = .slide(direction: .left)
                self.dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
    }
    
    @objc func editingChanged(_ sender: UITextField) {
        if let address = sender.text as String? {
            searchCompleter.queryFragment = address
        }
    }
    
}

extension CreateNewHouseVC : MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        let address = searchResults.map({ $0.title + " " + $0.subtitle })
        dropDown.dataSource = address
        dropDown.direction = .bottom
        dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.width = dropDown.anchorView?.plainView.bounds.width
        dropDown.show()
        
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            
             self.lineOne_textfield.text = self.searchResults[index].title
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(address[index]) { (placemarks, error) in
                guard let placemarks = placemarks else { return }
                
                if let locality = placemarks[0].locality, let adminArea = placemarks[0].administrativeArea {
                    self.city_textfield.text = locality + ", " + adminArea
                }
                
                if let sublocality = placemarks[0].subLocality, let adminArea = placemarks[0].administrativeArea {
                    self.city_textfield.text = sublocality + ", " + adminArea
                }
                self.zip_textfield.text = placemarks[0].postalCode
            }
            self.lineOne_textfield.resignFirstResponder()
        }
    
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {}
    
}
