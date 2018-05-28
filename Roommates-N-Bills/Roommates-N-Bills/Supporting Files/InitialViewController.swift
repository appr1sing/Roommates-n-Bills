//
//  InitialViewController.swift
//  Roommates-N-Bills
//
//  Created by Arvin San Miguel on 5/26/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import UIKit
import SnapKit
import Hero

class InitialViewController: UIViewController {
    
    let createHouseView = UIView()
    let joinHouseView = UIView()
    let createButton = UIButton()
    let joinButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.addButtons()
    }
    
    
    private func setupViews() {
        
        self.view.addSubview(createHouseView)
        self.view.addSubview(joinHouseView)
        
        // Adding Constraints
        self.createHouseView.snp.makeConstraints { (make) in
            make.height.equalTo(view.frame.height)
            make.width.equalTo(view.frame.width/2)
            make.left.equalToSuperview()
        }
        
        
        self.joinHouseView.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.width.equalTo(view.frame.width/2)
            make.right.equalToSuperview()
        }
        
        // Add Gradient -- Blush & Scooter
        let gradient = Gradient(top: Colors.BLUSH.top, btm: Colors.BLUSH.btm)
        let gradient2 = Gradient(top: Colors.SCOOTER.top, btm: Colors.SCOOTER.btm)

        gradient.gl.frame = view.frame.applying(CGAffineTransform(scaleX: 0.5, y: 1.0))
        gradient2.gl.frame = gradient.gl.frame
        self.createHouseView.layer.insertSublayer(gradient.gl, at: 0)
        self.joinHouseView.layer.insertSublayer(gradient2.gl, at: 0)
        
    }
    
    private func addButtons() {
        
        self.createHouseView.addSubview(createButton)
        self.joinHouseView.addSubview(joinButton)
        
        self.createButton.snp.makeConstraints { (make) in
            make.width.equalTo(createHouseView).multipliedBy(0.85)
            make.height.equalTo(createHouseView).multipliedBy(0.18)
            make.centerX.equalTo(createHouseView)
            make.centerY.equalTo(createHouseView)
        }
        
        self.joinButton.snp.makeConstraints { (make) in
            make.width.equalTo(joinHouseView).multipliedBy(0.85)
            make.height.equalTo(joinHouseView).multipliedBy(0.18)
            make.centerX.equalTo(joinHouseView)
            make.centerY.equalTo(joinHouseView)
        }
        
        self.createButton.setTitle("Create House", for: .normal)
        //self.createButton.setTitleColor(.white, for: .normal)
        self.createButton.titleLabel?.font = UIFont(name: "GTWalsheimMedium-Oblique", size: 20)
        self.createButton.addTarget(self, action: #selector(createButtonPressed(_:)), for: .touchUpInside)
        
        self.joinButton.setTitle("Join House", for: .normal)
        self.joinButton.titleLabel?.font = UIFont(name: "GTWalsheimMedium-Oblique", size: 20)
        self.joinButton.setTitleColor(.white, for: .normal)
        self.joinButton.addTarget(self, action: #selector(joinButtonPressed(_:)), for: .touchUpInside)
    }
    
    @objc func createButtonPressed(_ sender: UIButton) {
        let createNewHouseVC = CreateNewHouseVC()
        createNewHouseVC.isHeroEnabled = true
        createNewHouseVC.heroModalAnimationType = .slide(direction: .right)
        self.present(createNewHouseVC, animated: true, completion: nil)
    }
    
    @objc func joinButtonPressed(_ sender: UIButton) {
        let joinNewHouseVC = JoinNewHouseVC()
        joinNewHouseVC.isHeroEnabled = true
        joinNewHouseVC.heroModalAnimationType = .slide(direction: .left)
        self.present(joinNewHouseVC, animated: true, completion: nil)
    }
    
}

