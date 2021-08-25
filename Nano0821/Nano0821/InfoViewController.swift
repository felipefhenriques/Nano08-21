//
//  InfoViewController.swift
//  Nano0821
//
//  Created by Caroline Viana on 24/08/21.
//

import UIKit

class InfoViewController: UIViewController {
    
    let customView = InfoView()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .gray
        view.addSubview(customView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        customView.setupConstraints(with: view)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
