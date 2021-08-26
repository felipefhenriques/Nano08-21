//
//  HomeScreenView.swift
//  Nano0821
//
//  Created by Felipe Ferreira on 23/08/21.
//

import Foundation
import UIKit

class HomeScreenView: UIView {
    
    var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        //layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumLineSpacing = 30
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.register(petCollectionCell.self, forCellWithReuseIdentifier: "cell")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = #colorLiteral(red: 0.365377754, green: 0.2833439708, blue: 0.2716933489, alpha: 1)
        collection.backgroundColor = self.backgroundColor
        self.addSubview(collection)
        tryConstraints()
    }
    
    func tryConstraints(){
        NSLayoutConstraint.activate([
            collection.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            collection.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            collection.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -60),
            collection.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -150)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




