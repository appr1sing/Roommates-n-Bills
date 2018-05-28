//
//  JoinNewHouseVC.swift
//  Roommates-N-Bills
//
//  Created by Arvin San Miguel on 5/28/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import UIKit

class JoinNewHouseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let gradient = Gradient(top: Colors.SCOOTER.top, btm: Colors.SCOOTER.btm)
        gradient.gl.frame = view.frame
        view.layer.addSublayer(gradient.gl)
    }

    

}
