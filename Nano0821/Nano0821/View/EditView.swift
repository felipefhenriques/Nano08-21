//
//  EditView.swift
//  Nano0821
//
//  Created by Rafael Costa on 27/08/21.
//

import UIKit

let fontSize: CGFloat = 16

class EditView: UIScrollView {
    
    // MARK: variáveis e constantes
    let contentView = UIView()
    var constraintConstant = CGFloat(66)
    let imgViewBackground = UIImageView()
    
    let lblSpecies  = CustomText(text: "Espécie", fontSize: fontSize)
    let lblName     = CustomText(text: "Nome", fontSize: fontSize)
    let lblBreed    = CustomText(text: "Raça", fontSize: fontSize)
    let lblGender   = CustomText(text: "Sexo", fontSize: fontSize)
    let lblBirth    = CustomText(text: "Data de nascimento", fontSize: fontSize)
    let lblDay    = CustomText(text: "Dia", fontSize: fontSize)
    let lblMonth    = CustomText(text: "Mês", fontSize: fontSize)
    let lblYear    = CustomText(text: "Ano", fontSize: fontSize)
    let lblColor    = CustomText(text: "Cor", fontSize: fontSize)
    let lblWeight   = CustomText(text: "Peso", fontSize: fontSize)
    let lblMoreInfo = CustomText(text: "Outras informações", fontSize: fontSize)
    let fdSpecies = CustomTextField(text: "Insira a Espécie", fontSize: fontSize)
    let fdName = CustomTextField(text: "Insira o Nome", fontSize: fontSize)
    let fdBreed  = CustomTextField(text: "Insira a Raça", fontSize: fontSize)
    let fdGender = CustomTextField(text: "Insira o Sexo", fontSize: fontSize)
    let fdDay = CustomTextField(text: "Insira o Dia do Nascimento", fontSize: fontSize)
    let fdMonth = CustomTextField(text: "Insira o Mês do Nascimento", fontSize: fontSize)
    let fdYear = CustomTextField(text: "Insira o Ano do Nascimento", fontSize: fontSize)
    let fdColor = CustomTextField(text: "Insira a Cor", fontSize: fontSize)
    let fdWeight = CustomTextField(text: "Insira o Peso", fontSize: fontSize)
    let fdMoreInfo = CustomTextField(text: "Informações Adicionais", fontSize: fontSize)
    let IconBttn = CustomIcon(text: "a", fontSize: fontSize)
    
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
        setupImage()
        addLabels()
    }
    
    private func setupImage(){
        contentView.layoutIfNeeded()
        let imgBackground = UIImage(named: "PataLaranja")!
        imgViewBackground.image = imgBackground
        
        contentView.addSubview(imgViewBackground)
        imgViewBackground.translatesAutoresizingMaskIntoConstraints = false
        imgViewBackground.centerXAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50).isActive = true
        imgViewBackground.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -28).isActive = true
        
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
    
    // MARK: addLabels
    // Adiciona todas as labels necessárias
    private func addLabels(){
        contentView.layoutIfNeeded()
        
        setupIcon(icon: IconBttn, constant: constraintConstant, isLast: false)
        constraintConstant += IconBttn.frame.height + 150
        
        setupLabel(label: lblSpecies, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 2
        
        setupField(field: fdSpecies, constant: constraintConstant, isLast: false, MoreInfo: false)
        constraintConstant += fdSpecies.frame.height + 40
        
        setupLabel(label: lblName, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 2
        
        setupField(field: fdName, constant: constraintConstant, isLast: false, MoreInfo: false)
        constraintConstant += fdName.frame.height + 40
        
        setupLabel(label: lblBreed, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 2
        
        setupField(field: fdBreed, constant: constraintConstant, isLast: false, MoreInfo: false)
        constraintConstant += fdBreed.frame.height + 40
        
        setupLabel(label: lblGender, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 2
        
        setupField(field: fdGender, constant: constraintConstant, isLast: false, MoreInfo: false)
        constraintConstant += fdGender.frame.height + 40
        
        setupLabel(label: lblBirth, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 15
        
        setupLabel(label: lblDay, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 2
        
        setupField(field: fdDay, constant: constraintConstant, isLast: false, MoreInfo: false)
        constraintConstant += fdSpecies.frame.height + 40
        
        setupLabel(label: lblMonth, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 2
        
        setupField(field: fdMonth, constant: constraintConstant, isLast: false, MoreInfo: false)
        constraintConstant += fdSpecies.frame.height + 40
        
        setupLabel(label: lblYear, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 2
        
        setupField(field: fdYear, constant: constraintConstant, isLast: false, MoreInfo: false)
        constraintConstant += fdSpecies.frame.height + 40
        
        setupLabel(label: lblColor, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 2
        
        setupField(field: fdColor, constant: constraintConstant, isLast: false, MoreInfo: false)
        constraintConstant += fdSpecies.frame.height + 40
        
        setupLabel(label: lblWeight, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 2
        
        setupField(field: fdWeight, constant: constraintConstant, isLast: false, MoreInfo: false)
        constraintConstant += fdSpecies.frame.height + 40
        
        setupLabel(label: lblMoreInfo, constant: constraintConstant, isLast: false)
        constraintConstant += lblSpecies.frame.height + 2
        
        setupField(field: fdMoreInfo, constant: constraintConstant, isLast: true, MoreInfo: true)
        constraintConstant += fdSpecies.frame.height + 40
        
    }
    
    // MARK: setupLabel, stupField, setupIcon
    // Faz a configuração da label
    private func setupLabel(label: CustomText, constant: CGFloat, isLast: Bool){
        contentView.addSubview(label)
        label.setupConstraints(marginsView: contentView.layoutMarginsGuide, constant: constant)
        
        if isLast {
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
        }
    }
    
    // Faz a configuração do Text Field
    private func setupField(field: CustomTextField, constant: CGFloat, isLast: Bool, MoreInfo: Bool){
        contentView.addSubview(field)
        field.setupConstraints(marginsView: contentView.layoutMarginsGuide, constant: constant, MoreInfo: MoreInfo)
        
        if isLast {
            field.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
        }
    }
    
    // Faz a configuração do botão da foto
    private func setupIcon(icon: CustomIcon, constant: CGFloat, isLast: Bool){
        contentView.addSubview(icon)
        icon.setupConstraints(marginsView: contentView.layoutMarginsGuide, constant: constant)
        
        if isLast {
            icon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
        }
    }
    
}
