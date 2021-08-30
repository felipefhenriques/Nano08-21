//
//  PetCoreData.swift
//  Nano0821
//
//  Created by Felipe Ferreira on 26/08/21.
//

import Foundation
import CoreData
import UIKit

class petCoreData {

    //Objects
    var managedObject: NSManagedObject!
    var objectContext: NSManagedObjectContext!
    var savedPets: [NSManagedObject] = []

    /// Save a pet into the data entity
    func savePet(entity: String, pet: Pet){
        let entityDescription = NSEntityDescription.entity(forEntityName: entity, in: self.objectContext)
        
        let managedObj = NSManagedObject(entity: entityDescription!, insertInto: self.objectContext)
        
        readEntries(entity: "PetEntity")
        if savedPets.count > 0 {
            let lastIndex = savedPets[savedPets.count-1].value(forKey: "index") as! Int
            managedObj.setValue((lastIndex + 1), forKey: "index")
        } else {
            managedObj.setValue(0, forKey: "index")
        }
        
        managedObj.setValue(pet.imgData, forKey: "imagem")
        managedObj.setValue(pet.especie, forKey: "especie")
        managedObj.setValue(pet.nome, forKey: "nome")
        managedObj.setValue(pet.raca, forKey: "raca")
        managedObj.setValue(pet.sexo, forKey: "sexo")
        managedObj.setValue(pet.cor, forKey: "cor")
        managedObj.setValue(pet.peso, forKey: "peso")
        managedObj.setValue(pet.outros, forKey: "outros")
        
        managedObj.setValue(pet.ano, forKey: "anoNasc")
        managedObj.setValue(pet.mes, forKey: "mesNasc")
        managedObj.setValue(pet.dia, forKey: "diaNasc")
        
        do {
            try objectContext.save()
        } catch let error as NSError {
            print("Não foi possível salvar a entrada \(error.description)")
        }
        
    }
    
    /// Reads the entity
    func readEntries(entity: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entity)

        do {
             savedPets = try managedContext.fetch(fetchRequest)
                } catch let error as NSError {
            print("Não foi possível carregar os dados. \(error), \(error.userInfo)")
            }
        
    }

    /// Reads the Pet entity and returns an array with as the Pet struct
    func readAndReturn(entity: String) -> [Pet]{
        var petsArray: [Pet] = []
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return petsArray
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entity)

        do {
             savedPets = try managedContext.fetch(fetchRequest)
                } catch let error as NSError {
            print("Não foi possível carregar os dados. \(error), \(error.userInfo)")
            }
        
        
        if savedPets.count > 0 {
            for i in 0...savedPets.count-1 {
                let pet: Pet = Pet(
                    index: savedPets[i].value(forKey: "index") as! Int,
                    imgData: savedPets[i].value(forKey: "imagem") as! Data,
                    especie: savedPets[i].value(forKey: "especie") as! String,
                    nome: savedPets[i].value(forKey: "nome") as! String,
                    raca: savedPets[i].value(forKey: "raca") as! String,
                    sexo: savedPets[i].value(forKey: "sexo") as! String,
                    cor: savedPets[i].value(forKey: "cor") as! String,
                    peso: savedPets[i].value(forKey: "peso") as! Double,
                    outros: savedPets[i].value(forKey: "outros") as! String,
                    dia: savedPets[i].value(forKey: "diaNasc") as! String,
                    mes: savedPets[i].value(forKey: "mesNasc") as! String,
                    ano: savedPets[i].value(forKey: "anoNasc") as! String)
                petsArray.append(pet)
            }
        }
        return petsArray
    }

    /// Delete all the pets from the database
    func deleteData(entity: String){
        
        let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do
        {
            try context.execute(deleteRequest)
            try context.save()
        }
        catch
        {
            print ("There was an error")
        }
        
        
    }

    /// Delete a certain pet from the database
    func deletePet(entity: String, petIndex: Int){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entity)
        
        fetchRequest.predicate = NSPredicate(format: "index = %@", "\(petIndex)")
        
            do {
                let fetchedResults =  try managedContext.fetch(fetchRequest)
                for row in fetchedResults {
                    managedContext.delete(row)
                    try managedContext.save()
                }
            }
            catch _ {
                print("Could not delete")

            }
    }
}
