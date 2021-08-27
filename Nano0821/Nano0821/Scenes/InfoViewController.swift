//
//  InfoViewController.swift
//  Nano0821
//
//  Created by Caroline Viana on 24/08/21.
//

import UIKit

class InfoViewController: UIViewController {
    
    let customView = InfoView()
    
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

    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}
