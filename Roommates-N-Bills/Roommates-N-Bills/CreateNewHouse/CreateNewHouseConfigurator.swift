//
//  CreateHouseConfigurator.swift
//  Roommates-N-Bills
//
//  Created by Arvin San Miguel on 5/28/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import Foundation
import UIKit

// MARK: Connect View, Interactor, and Presenter

extension CreateNewHouseVC: CreateNewHousePresenterOutput {
}

extension CreateNewHouseInteractor: CreateNewHouseVCOutput {
}

extension CreateNewHousePresenter: CreateNewHouseInteractorOutput{
}

class CreateNewHouseConfigurator {
    // MARK: Object lifecycle
    
    class var sharedInstance: CreateNewHouseConfigurator{
        struct Static {
            static let instance =  CreateNewHouseConfigurator()
        }
        return Static.instance
    }
    
    // MARK: Configuration
    
    func configure(_ viewController: CreateNewHouseVC ){
        let router = CreateNewHouseRouter()
        router.viewController = viewController
        
        let presenter = CreateNewHousePresenter()
        presenter.output = viewController
        
        let interactor = CreateNewHouseInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
