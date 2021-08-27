//
//  EditTextField.swift
//  Nano0821
//
//  Created by Rafael Costa on 27/08/21.
//

import UIKit

class CustomTextField: UITextField {
    let customFontName = "Helvetica Neue"
    let Padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    // MARK: init
    init(text: String, fontSize: CGFloat) {
        super.init(frame: .zero)
        setupField(labelText: text, fontSize: fontSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Padding)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Padding)
    }
    
    
    // MARK: setupLabel
    private func setupField(labelText: String, fontSize: CGFloat) {
        textColor = .init(red: 89/255, green: 74/255, blue: 70/255, alpha: 1)
        attributedPlaceholder = NSAttributedString(string: "placeholder text", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 89/255, green: 74/255, blue: 70/255, alpha: 0.5)])
        placeholder = "\(labelText) "
        layer.cornerRadius = 10
        backgroundColor = .init(red: 243/255, green: 242/255, blue: 240/255, alpha: 1)
        layer.borderWidth = 1
        layer.borderColor = .init(red: 112/255, green: 112/255, blue: 112/255, alpha: 1)
        sizeToFit()
    }
    
    // MARK: setupConstraints
    func setupConstraints(marginsView: UILayoutGuide, constant: CGFloat, MoreInfo: Bool){
        translatesAutoresizingMaskIntoConstraints = false
            
        leadingAnchor.constraint(equalTo: marginsView.leadingAnchor, constant: 20).isActive = true
        centerXAnchor.constraint(equalTo: marginsView.centerXAnchor).isActive = true
        
        if MoreInfo == false{
            heightAnchor.constraint(equalToConstant: 43).isActive = true
        }else{
            heightAnchor.constraint(equalToConstant: 100).isActive = true
        }
        
        
        topAnchor.constraint(equalTo: marginsView.topAnchor, constant: constant).isActive = true
            
    }
}
