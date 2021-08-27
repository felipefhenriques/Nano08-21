//
//  InfoView.swift
//  Nano0821
//
//  Created by Caroline Viana on 24/08/21.
//

import UIKit

struct Animal {
    let species: String
    let name: String
    let breed: String
    let gender: String
    let birth: String
    let color: String
    let weight: String
    let moreInfo: String
}

class InfoView: UIScrollView {
    
    // MARK: variáveis e constantes
    let contentView = UIView()
    let imgViewBackground = UIImageView()
    
    let information = Animal(species: "Canina", name: "Nico", breed: "Pinscher", gender: "Macho", birth: "12/12/2014",color: "Marrom",weight: "3,8", moreInfo: "pi pi pi po po po bla bla bla coisa linda da mãe. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setupScreen
    func setupScreen(view: UIView) {
        setupConstraints(with: view)
        setupImages()
        addLabels()
    }
    
    // MARK: setupConstraints
    // Faz as constraaints da scrollview e da contentView
    private func setupConstraints(with myview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: myview.centerXAnchor).isActive = true
        widthAnchor.constraint(equalTo: myview.widthAnchor).isActive = true
        topAnchor.constraint(equalTo: myview.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: myview.bottomAnchor).isActive = true
        
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    // MARK: setupImages
    // Adiciona as imagens do background e do pet
    private func setupImages(){
        contentView.layoutIfNeeded()
        let imgBackground = UIImage(named: "backgroundPatinhas")!
        imgViewBackground.image = imgBackground
        
        contentView.addSubview(imgViewBackground)
        imgViewBackground.translatesAutoresizingMaskIntoConstraints = false
        imgViewBackground.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        imgViewBackground.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        contentView.layoutIfNeeded()
        
        let imgPet = UIImage(named: "imgPlaceholder")!
        let imgViewPet = UIImageView(image: imgPet)
        
        imgViewPet.layer.cornerRadius = 50
        imgViewPet.layer.masksToBounds = true
        contentView.addSubview(imgViewPet)
        let widthBackground = imgViewBackground.frame.width / 1.7
        imgViewPet.translatesAutoresizingMaskIntoConstraints = false
        imgViewPet.widthAnchor.constraint(equalToConstant: widthBackground).isActive = true
        imgViewPet.heightAnchor.constraint(equalToConstant: widthBackground).isActive = true
        imgViewPet.centerXAnchor.constraint(equalTo: imgViewBackground.centerXAnchor).isActive = true
        imgViewPet.centerYAnchor.constraint(equalTo: imgViewBackground.centerYAnchor).isActive = true
        
    }
    
    // MARK: addLabels
    // Adiciona todas as labels necessárias
    private func addLabels(){
        contentView.layoutIfNeeded()
        
        var constraintConstant = imgViewBackground.frame.height + 20
        let fontSize: CGFloat = 16
        
        let lblSpecies  = CustomLabel(text: "Espécie: \(information.species)",             fontSize: fontSize)
        let lblName     = CustomLabel(text: "Nome: \(information.name)",                   fontSize: fontSize)
        let lblBreed    = CustomLabel(text: "Raça: \(information.breed)",                  fontSize: fontSize)
        let lblGender   = CustomLabel(text: "Sexo: \(information.gender)",                 fontSize: fontSize)
        let lblBirth    = CustomLabel(text: "Data de nascimento: \(information.birth)",    fontSize: fontSize)
        let lblColor    = CustomLabel(text: "Cor: \(information.color)",                   fontSize: fontSize)
        let lblWeight   = CustomLabel(text: "Peso: \(information.weight)",                 fontSize: fontSize)
        let lblMoreInfo = CustomLabel(text: "Outras informações: \(information.moreInfo)", fontSize: fontSize)
        
        setupLabel(label: lblSpecies, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 40
        
        setupLabel(label: lblName, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 40
        
        setupLabel(label: lblBreed, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 40
        
        setupLabel(label: lblGender, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 40
        
        setupLabel(label: lblBirth, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 40
        
        setupLabel(label: lblColor, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 40
        
        setupLabel(label: lblWeight, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 40
        
        setupLabel(label: lblMoreInfo, constant: constraintConstant, isLast: true)
        constraintConstant += lblSpecies.frame.height + 40
        
    }
    
    // MARK: setupLabel
    // Faz a configuração da label
    private func setupLabel(label: CustomLabel, constant: CGFloat, isLast: Bool){
        contentView.addSubview(label)
        label.setupConstraints(marginsView: contentView.layoutMarginsGuide, constant: constant)
        
        if isLast {
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
        }
    }
    
}
