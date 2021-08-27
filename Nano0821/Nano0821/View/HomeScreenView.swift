//
//  HomeScreenView.swift
//  Nano0821
//
//  Created by Felipe Ferreira on 23/08/21.
//

import Foundation
import UIKit

class HomeScreenView: UIView {
    
    var pataVerde: UIImageView = {
        var image = UIImageView()
        image = UIImageView(image: (UIImage(named: "pataVerde")))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var pataLaranja: UIImageView = {
        var image = UIImageView()
        image = UIImageView(image: (UIImage(named: "pataLaranja")))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumLineSpacing = 30
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.register(petCollectionCell.self, forCellWithReuseIdentifier: "cell")
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = #colorLiteral(red: 0.365377754, green: 0.2833439708, blue: 0.2716933489, alpha: 1)
        
        //view hierarchy
        self.addSubview(pataLaranja)
        pataLaranjaConstraints()
        self.addSubview(pataVerde)
        pataVerdeConstraints()
        
        self.addSubview(collection)
        collectionViewConstraints()
    }
    
    func collectionViewConstraints(){
        NSLayoutConstraint.activate([
            collection.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            collection.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            collection.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -60),
            collection.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -150)
        ])
    }
    
    func pataLaranjaConstraints(){
        NSLayoutConstraint.activate([
            pataLaranja.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 150),
            pataLaranja.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 150)
        ])
    }
    
    func pataVerdeConstraints(){
        NSLayoutConstraint.activate([
            pataVerde.topAnchor.constraint(equalTo: self.topAnchor, constant: -150),
            pataVerde.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -150)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




