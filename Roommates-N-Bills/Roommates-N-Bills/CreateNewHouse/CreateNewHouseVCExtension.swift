//
//  CreateNewHouseVCExtension.swift
//  Roommates-N-Bills
//
//  Created by Arvin San Miguel on 5/28/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import Foundation
import UIKit

extension CreateNewHouseVC {
    
    func layoutUI() {
        
        // MARK -- Add Gradient Background
        let gradient = Gradient(top: Colors.BLUSH.top, btm: Colors.BLUSH.btm)
        gradient.gl.frame = view.frame
        view.layer.addSublayer(gradient.gl)
        
        // MARK -- Add Swipe Gesture
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeRight(_:)))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        view.isHeroEnabled = true
        
        // MARK -- Adding textfields
        self.view.addSubview(lineOne_textfield)
        self.view.addSubview(lineTwo_textfield)
        self.view.addSubview(city_textfield)
        self.view.addSubview(zip_textfield)
        
//        self.lineOne_textfield.backgroundColor = .clear
//        self.lineTwo_textfield.backgroundColor = .green
//        self.city_textfield.backgroundColor = .yellow
//        self.zip_textfield.backgroundColor = .green
        
        let height = 0.10
        let width = 0.90
        
        self.lineOne_textfield.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).inset(40)
            make.left.equalTo(view.snp.left).inset(20)
            make.width.equalToSuperview().multipliedBy(width)
            make.height.equalToSuperview().multipliedBy(height)
        }
        
        self.lineTwo_textfield.snp.makeConstraints { (make) in
            make.top.equalTo(lineOne_textfield.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).inset(20)
            make.width.equalToSuperview().multipliedBy(width)
            make.height.equalToSuperview().multipliedBy(height)
        }
        
        self.city_textfield.snp.makeConstraints { (make) in
            make.top.equalTo(lineTwo_textfield.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).inset(20)
            make.width.equalToSuperview().multipliedBy(width)
            make.height.equalToSuperview().multipliedBy(height)
        }

        self.zip_textfield.snp.makeConstraints { (make) in
            make.top.equalTo(city_textfield.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).inset(20)
            make.width.equalToSuperview().multipliedBy(width)
            make.height.equalToSuperview().multipliedBy(height)
        }
        
        self.lineOne_textfield.attributedPlaceholder = NSAttributedString(string: "Street Address",
                                                                          attributes: [NSAttributedStringKey.foregroundColor: UIColor.white.withAlphaComponent(0.7)])
        self.lineTwo_textfield.attributedPlaceholder = NSAttributedString(string: "Apt, Unit, Bldg, Floor, etc.",
                                                                          attributes: [NSAttributedStringKey.foregroundColor: UIColor.white.withAlphaComponent(0.7)])
        self.city_textfield.attributedPlaceholder = NSAttributedString(string: "City",
                                                                          attributes: [NSAttributedStringKey.foregroundColor: UIColor.white.withAlphaComponent(0.7)])
        self.zip_textfield.attributedPlaceholder = NSAttributedString(string: "ZIP",
                                                                          attributes: [NSAttributedStringKey.foregroundColor: UIColor.white.withAlphaComponent(0.7)])
        
        self.lineOne_textfield.font = Fonts.GTWALSHEIM_MED_OBL
        self.lineTwo_textfield.font = Fonts.GTWALSHEIM_MED_OBL
        self.city_textfield.font = Fonts.GTWALSHEIM_MED_OBL
        self.zip_textfield.font = Fonts.GTWALSHEIM_MED_OBL
        
        self.lineOne_textfield.textColor = .white
        self.lineTwo_textfield.textColor = .white
        self.city_textfield.textColor = .white
        self.zip_textfield.textColor = .white
        
        
        
    }
    
    
}

