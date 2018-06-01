//
//  DropDownCell.swift
//  Roommates-N-Bills
//
//  Created by Arvin San Miguel on 6/1/18.
//  Copyright © 2018 Appr1sing Studios. All rights reserved.
//

import UIKit
import DropDown

class CustomDropCell: DropDownCell {
    
    public var addressLabel : UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.font = Fonts.GTWALSHEIM_MED_OBL
        return lbl
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        
        addSubview(addressLabel)
        addressLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        addressLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
}
