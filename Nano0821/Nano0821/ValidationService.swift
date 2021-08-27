//
//  ValidationService.swift
//  Nano0821
//
//  Created by Caroline Viana on 26/08/21.
//

import Foundation

struct ValidationService {
    func validateDate(_ day: String?, month: String?, year: String?) throws -> (String, String, String) {
        // Valores inválidos
        guard let day = day else { throw ValidationError.invalidValue }
        guard let month = month else { throw ValidationError.invalidValue }
        guard let year = year else { throw ValidationError.invalidValue }
        
        // Os valores não são inteiros
        guard let dayInt = Int(day) else { throw ValidationError.isNotInt }
        guard let monthInt = Int(month) else { throw ValidationError.isNotInt }
        guard Int(year) != nil else { throw ValidationError.isNotInt }
        
        // Dia e mês invalido
        guard dayInt >= 1 || dayInt <= 31 else { throw ValidationError.isNotValidDay }
        guard monthInt >= 1 || monthInt <= 12 else { throw ValidationError.isNotValidMonth }
        
        // Meses com 31 dias: 1, 3, 5, 7, 8, 10, 12
        if dayInt == 31 && (monthInt != 1 || monthInt != 3 || monthInt != 5 || monthInt != 7 || monthInt != 8 || monthInt != 10 || monthInt != 12) {
            throw ValidationError.dayNotInMonth
        }
        if dayInt == 30 && monthInt == 2 {
            throw ValidationError.dayNotInMonth
        }
            
        return (day, month, year)
    }
    
    func validateWeight(_ weight: String?) throws -> String {
        guard let weight = weight else { throw ValidationError.invalidValue }
        let wConverted = weight.replacingOccurrences(of: ",", with: ".")
        guard Double(wConverted) != nil else { throw ValidationError.weightIsNotValid }
        return weight
    }
}

enum ValidationError: LocalizedError {
    case invalidValue
    case isNotInt
    case isNotValidDay
    case isNotValidMonth
    case weightIsNotValid
    case dayNotInMonth
    
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
            return "This is an invalid value."//
        case .isNotInt:
            return "This is not an integer."//
        case .isNotValidDay:
            return "This is not a valid day."//
        case .isNotValidMonth:
            return "This is not a valid month."//
        case .weightIsNotValid:
            return "This is not a valid value for wight."//
        case .dayNotInMonth:
            return "This day doesn't exists in this month."//
        }
    }
}
