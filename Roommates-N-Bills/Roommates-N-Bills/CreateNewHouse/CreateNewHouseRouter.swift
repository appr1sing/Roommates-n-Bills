//
//  CreateNewHouseRouter.swift
//  Roommates-N-Bills
//
//  Created by Arvin San Miguel on 5/28/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import Foundation
import UIKit

protocol CreateNewHouseRouterInput {
    func navigateToSomewhere()
}

class CreateNewHouseRouter : CreateNewHouseRouterInput {
    
    weak var viewController: CreateNewHouseVC!
    
    // MARK: Navigation
    
    func navigateToSomewhere() {}
    
    // MARK: Communication
    
    func passDataToNextScene<T: CreateNewHouseVC>(_ vc: T) {
        
    }
    
    func goToInitialVC() {
        viewController.heroModalAnimationType = .slide(direction: .left)
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func passData(_ from: CreateNewHouseVC, currencies: [CreateNewHouse.SearchAddress.ViewModel.Result]) {
       
    }
    
}
