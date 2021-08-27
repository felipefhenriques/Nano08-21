//
//  EditPetIcon.swift
//  Nano0821
//
//  Created by Rafael Costa on 27/08/21.
//

import UIKit

class CustomIcon: UIButton {
    let customFontName = "Helvetica Neue"
    
    // MARK: init
    init(text: String, fontSize: CGFloat) {
        super.init(frame: .zero)
        setupIcon(labelText: text, fontSize: fontSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setupLabel
    private func setupIcon(labelText: String, fontSize: CGFloat) {
        layer.cornerRadius = 45
        titleLabel?.font = UIFont(name: "Objektiv Mk1 Black", size: 40)
        setTitleColor(.init(red: 89/255, green: 74/255, blue: 70/255, alpha: 1), for: .normal)
        setTitle("", for: .normal)
        layer.borderWidth = 1
        layer.borderColor = .init(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)
        backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        sizeToFit()
    }
    
    // MARK: setupConstraints
    func setupConstraints(marginsView: UILayoutGuide, constant: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        
        heightAnchor.constraint(equalToConstant: 160).isActive = true
        widthAnchor.constraint(equalToConstant: 160).isActive = true
        leadingAnchor.constraint(equalTo: marginsView.leadingAnchor, constant: 20).isActive = true
        
        topAnchor.constraint(equalTo: marginsView.topAnchor, constant: constant).isActive = true
            
    }
}
