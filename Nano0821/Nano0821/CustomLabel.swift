//
//  CustomLabel.swift
//  Nano0821
//
//  Created by Caroline Viana on 24/08/21.
//

import UIKit

class CustomLabel: UILabel {
    let customFontName = "Helvetica Neue"
    
    // MARK: init
    init(text: String, fontSize: CGFloat) {
        super.init(frame: .zero)
        setupLabel(labelText: text, fontSize: fontSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: drawText
    // Pra label ser desenhada com padding
    override func drawText(in rect: CGRect) {
        let inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        super.drawText(in: rect.inset(by: inset))
    }
    
    // MARK: intrinsicContentSize
    // Não sei exatamente o que faz, mas é pra manter o padding certo
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + 20, height: size.height + 20)
    }
    
    // MARK: bounds
    // Não sei exatamente o que faz, mas é pra manter o padding certo
    override var bounds: CGRect {
        didSet {
            preferredMaxLayoutWidth = bounds.width - (20)
        }
    }
    
    // MARK: setupLabel
    private func setupLabel(labelText: String, fontSize: CGFloat) {
        text = labelText
        font = UIFont(name: customFontName, size: fontSize)
        backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9490196078, blue: 0.9411764706, alpha: 1)
        layer.cornerRadius = 5
        layer.masksToBounds = true
        numberOfLines = 0
        sizeToFit()
    }
    
    // MARK: setupConstraints
    func setupConstraints(marginsView: UILayoutGuide, constant: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
            
        leadingAnchor.constraint(equalTo: marginsView.leadingAnchor, constant: 10).isActive = true
        trailingAnchor.constraint(equalTo: marginsView.trailingAnchor, constant: -10).isActive = true
        
        topAnchor.constraint(equalTo: marginsView.topAnchor, constant: constant).isActive = true
            
    }
}
