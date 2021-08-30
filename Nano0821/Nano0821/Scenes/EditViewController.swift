//
//  EditViewController.swift
//  Nano0821
//
//  Created by Rafael Costa on 27/08/21.
//

import UIKit
import CoreData

class EditViewController: UIViewController, UITextFieldDelegate {
    
    let customView = EditView()
    let coreData = petCoreData()
    var petImage = UIImage()
    
    var alert = UIAlertController(title: "Mensagem", message: "msg", preferredStyle: .alert)
    let validation = ValidationFunctions()
    
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(addTapped))
    }

    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
        })
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
    
    @objc func addTapped(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        coreData.objectContext = appDelegate.persistentContainer.viewContext
        
        do {
            // Validar quanto ao campo estar em branco
            let species = try validation.validateEmpties(customView.fdSpecies.text)
            let name = try validation.validateEmpties(customView.fdName.text)
            let breed = try validation.validateEmpties(customView.fdBreed.text)
            let gender = try validation.validateEmpties(customView.fdGender.text)
            let color = try validation.validateEmpties(customView.fdColor.text)
            let weightS = try validation.validateEmpties(customView.fdWeight.text)
            let other = try validation.validateOtherInfo(customView.fdMoreInfo.text)
            
            // Validar se peso é um numero
            let weight = try validation.validateWeight(weightS)
            
            // Validar a data
            let dateTriple = try validation.validateDate(customView.fdDay.text, month: customView.fdMonth.text, year: customView.fdYear.text)
            
            // Validar a imagem
            let img = try validation.validateImg(petImage.pngData())
            
            // Se deu tudo certo
            let petAdicionado = Pet(
                index: 0, imgData: img, especie: species,
                nome: name, raca: breed,
                sexo: gender, cor: color,
                peso: weight, outros: other, dia: dateTriple.0, mes: dateTriple.1, ano: dateTriple.2)
            coreData.savePet(entity: "PetEntity", pet: petAdicionado)
            
            self.navigationController?.popViewController(animated: true)
            
        } catch {
            alert.title = "Erro"
            alert.message = error.localizedDescription
            present(alert, animated: true)
        }
        
        
        
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
            petImage = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
