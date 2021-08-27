//
//  HomeScreenViewController.swift
//  Nano0821
//
//  Created by Felipe Ferreira on 23/08/21.
//

import Foundation
import UIKit

class HomeScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var homeView: HomeScreenView!
    var coreData = petCoreData()
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        homeView = HomeScreenView()
        homeView.collection.delegate = self
        homeView.collection.dataSource = self
        self.view = homeView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Status bar
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1 + coreData.readAndReturn(entity: "PetEntity").count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! petCollectionCell
            myCell.loadFirstCell()
            return myCell
        } else {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! petCollectionCell
            myCell.loadCell(index: indexPath.item)
            return myCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexPath.item == 0 ? print("cadastrar") : print ("pet")
    }
    
}
