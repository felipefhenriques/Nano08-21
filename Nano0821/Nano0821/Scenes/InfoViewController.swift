//
//  InfoViewController.swift
//  Nano0821
//
//  Created by Caroline Viana on 24/08/21.
//

import UIKit

class InfoViewController: UIViewController {
    
    var customView: InfoView!
    var idPet: Int!
    var coreData = petCoreData()
    
    // MARK: loadView
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        view.addSubview(customView)
    }
    
    // MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        customView.setupScreen(view: view)
        
    }
    
    init(idPet: Int){
        super.init(nibName: nil, bundle: nil)
        customView = InfoView(frame: .zero, idPet: idPet)
        self.idPet = idPet
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Deletar", style: .plain, target: self, action: #selector(deleteId))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func deleteId(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        coreData.objectContext = appDelegate.persistentContainer.viewContext
        print(coreData.readEntries(entity: "PetEntity"))
        
        coreData.deletePet(entity: "PetEntity", petIndex: idPet)
        print("o id deletado é \(String(describing:idPet))")
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}
