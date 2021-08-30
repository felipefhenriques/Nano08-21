//
//  HomeScreenViewController.swift
//  Nano0821
//
//  Created by Felipe Ferreira on 23/08/21.
//

import Foundation
import UIKit
import CoreData

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
        
        coreData.deleteData(entity: "PetEntity")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        coreData.objectContext = appDelegate.persistentContainer.viewContext
        print(coreData.readEntries(entity: "PetEntity"))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        homeView.collection.reloadData()
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
            myCell.loadCell(index: indexPath.item-1)
            return myCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let editAndAdd = EditViewController()
        let petInfo = InfoViewController(idPet: indexPath.item-1)
        self.navigationController?.isNavigationBarHidden = false
        
        indexPath.item == 0 ? self.navigationController?.pushViewController(editAndAdd, animated: true) : self.navigationController?.pushViewController(petInfo, animated: true)
    }
    
}
