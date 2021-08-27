//
//  EditLabel.swift
//  Nano0821
//
//  Created by Rafael Costa on 27/08/21.
//

import UIKit

class CustomText: UILabel {
    let customFontName = "Helvetica Neue"
    
    // MARK: init
    init(text: String, fontSize: CGFloat) {
        super.init(frame: .zero)
        setupLabel(labelText: text, fontSize: fontSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setupLabel
    private func setupLabel(labelText: String, fontSize: CGFloat) {
        textColor = .init(red: 89/255, green: 74/255, blue: 70/255, alpha: 1)
        font = UIFont(name: "Objektiv Mk1 Black", size: 20)
        translatesAutoresizingMaskIntoConstraints = false
        text = labelText
        numberOfLines = 0
        sizeToFit()
    }
    
    // MARK: setupConstraints
    func setupConstraints(marginsView: UILayoutGuide, constant: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
            
        leadingAnchor.constraint(equalTo: marginsView.leadingAnchor, constant: 35).isActive = true
        
        topAnchor.constraint(equalTo: marginsView.topAnchor, constant: constant).isActive = true
            
    }
}
