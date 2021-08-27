//
//  EditViewController.swift
//  Nano0821
//
//  Created by Rafael Costa on 27/08/21.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {
    
    let customView = EditView()
    
    // MARK: loadView
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        customView.backgroundColor = .init(red: 243/255, green: 242/255, blue: 240/255, alpha: 1)
        initializeHideKeyboard()
        customView.IconBttn.addTarget(self, action: #selector(add), for: UIControl.Event.touchUpInside)
        view.addSubview(customView)
        
        customView.fdSpecies.delegate = self
        customView.fdName.delegate = self
        customView.fdBreed.delegate = self
        customView.fdDay.delegate = self
        customView.fdMonth.delegate = self
        customView.fdYear.delegate = self
        customView.fdColor.delegate = self
        customView.fdGender.delegate = self
        customView.fdWeight.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardhide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
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
    
    @objc func keyboardWillChange(notification: Notification){
        view.frame.origin.y = -200
    }
    
    @objc func keyboardhide(notification: Notification){
        view.frame.origin.y = 0
    }
    
    @objc func add(sender: UIButton){
        let Image = UIImagePickerController()
        Image.sourceType = .photoLibrary
        Image.delegate = self
        Image.allowsEditing = true
        present(Image, animated: true)
    }
    
    // MARK: Dismiss Keyboard
    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}

extension EditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            customView.IconBttn.setImage(image, for: .normal)
            customView.IconBttn.alpha = 1.0
            customView.IconBttn.layer.masksToBounds = true
            customView.IconBttn.layer.cornerRadius = 45
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
