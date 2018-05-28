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

class CreateNewHouseVC: UIViewController {

    let lineOne_textfield = UITextField()
    let lineTwo_textfield = UITextField()
    let city_textfield = UITextField()
    let zip_textfield = UITextField()
    
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.layoutUI()
        self.searchCompleter.delegate = self
        //self.lineOne_textfield.delegate = self
        self.lineOne_textfield.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
    }
    
    @objc func respondToSwipeRight(_ sender: UISwipeGestureRecognizer) {
        
        if let swipeGesture = sender as UISwipeGestureRecognizer? {
            switch swipeGesture.direction {
            case .left:
                print("swipe left")
                self.heroModalAnimationType = .slide(direction: .left)
                self.dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
    }
    
    @objc func editingChanged(_ sender: UITextField) {
        if let address = sender.text as String? {
            print(address)
            searchCompleter.queryFragment = address
        }
    }
    
}

//extension CreateNewHouseVC : UITextFieldDelegate {
//
////    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
////
////        if let address = textField.text as String? {
////            searchCompleter.queryFragment = address
////        }
////        return true
////    }
//
//
//
//}

extension CreateNewHouseVC : MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        for i in searchResults {
            print(i)
            print("\n")
        }
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        // handle error
    }
}
