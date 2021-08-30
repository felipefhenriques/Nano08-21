//
//  CustomHomeCollectionCell.swift
//  Nano0821
//
//  Created by Felipe Ferreira on 24/08/21.
//

import Foundation
import UIKit

class petCollectionCell: UICollectionViewCell {
    
    var coreData = petCoreData()
    var petsArray: [Pet] = []
    var petImage: UIImageView = {
        let uiview = UIImageView(frame: .zero)
        uiview.contentMode = .scaleToFill
        uiview.translatesAutoresizingMaskIntoConstraints = false
        uiview.layer.masksToBounds = true
        uiview.layer.cornerRadius = 30
        return uiview
    }()
    var plusImage = UIImageView()
    
    var labelNome: UILabel = {
        var label = UILabel()
//        label.font = UIFont(name: "Avenir-Next", size: 20)
        label.tintColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        plusImage.removeFromSuperview()
    }
    
    override init(frame: CGRect = .zero){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        //View setup
        collectionCellConstraints()
        self.layer.cornerRadius = 30
        
        //Initializing vars
        petsArray = coreData.readAndReturn(entity: "PetEntity")
    }
    
    func loadCell(index: Int){
        self.backgroundColor = #colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)
        
        //setup
        let imgPet = UIImage(data: petsArray[index].imgData)
        petImage.image = imgPet
        
        //View hierarchy
        self.addSubview(petImage)
        petImageConstraints()
        self.addSubview(labelNome)
        labelNomeConstraints()
        
    }
    
    func collectionCellConstraints(){
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 150),
            self.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func loadFirstCell(){
        self.backgroundColor = #colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)
        plusImage = UIImageView(image: UIImage(named: "plusIcon"))
        plusImage.tintColor = #colorLiteral(red: 0.3659011722, green: 0.2833195925, blue: 0.2716813982, alpha: 1)
        plusImage.translatesAutoresizingMaskIntoConstraints = false

        //View hierarchy
        self.addSubview(plusImage)
        plusImageConstraints()
        
        self.addSubview(labelNome)
        labelNomeConstraints()
        
    }
    
    func plusImageConstraints(){
        NSLayoutConstraint.activate([
            plusImage.heightAnchor.constraint(equalToConstant: 100),
            plusImage.widthAnchor.constraint(equalToConstant: 100),
            plusImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            plusImage.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func petImageConstraints(){
        NSLayoutConstraint.activate([
            petImage.heightAnchor.constraint(equalTo: self.heightAnchor),
            petImage.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
    func labelNomeConstraints(){
        NSLayoutConstraint.activate([
            labelNome.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 5),
            labelNome.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPlusImageConstraints(){
        NSLayoutConstraint.activate([
            plusImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            plusImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            plusImage.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -30),
            plusImage.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -30)
        ])
    }
}
