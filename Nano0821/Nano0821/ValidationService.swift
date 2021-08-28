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
        guard var dayV = day else { throw ValidationError.invalidValue }
        guard var monthV = month else { throw ValidationError.invalidValue }
        guard let yearV = year else { throw ValidationError.invalidValue }
        
        // Os valores não são inteiros
        guard let dayInt = Int(dayV) else { throw ValidationError.isNotInt }
        guard let monthInt = Int(monthV) else { throw ValidationError.isNotInt }
        guard let yearInt = Int(yearV) else { throw ValidationError.isNotInt }
        
        // Dia e mês invalido
        guard dayInt >= 1 && dayInt <= 31 else { throw ValidationError.isNotValidDay }
        guard monthInt >= 1 && monthInt <= 12 else { throw ValidationError.isNotValidMonth }
        
        // Meses com 31 dias: 1, 3, 5, 7, 8, 10, 12
        if dayInt == 31 && (monthInt != 1 || monthInt != 3 || monthInt != 5 || monthInt != 7 || monthInt != 8 || monthInt != 10 || monthInt != 12) {
            throw ValidationError.dayNotInMonth
        }
        if dayInt == 30 && monthInt == 2 {
            throw ValidationError.dayNotInMonth
        }
        
        // Verifica se o ano é válido, nada do futuro nem muito velho
        let currentYear = Calendar.current.component(.year, from: Date())
        if yearInt > currentYear || yearInt < 1600 { throw ValidationError.isNotValidYear }
        
        // Formatação de String de dia e mês
        if dayInt < 10 { dayV = "0" + dayV }
        if monthInt < 10 { monthV = "0" + monthV }
        
        return (dayV, monthV, yearV)
    }
    
    func validateWeight(_ weight: String?) throws -> Double {
        guard let weightV = weight else { throw ValidationError.invalidValue }
        let wConverted = weightV.replacingOccurrences(of: ",", with: ".")
        guard let weightD = Double(wConverted) else { throw ValidationError.weightIsNotValid }
        return weightD
    }
    
    func validateEmpties(_ field: String?) throws -> String {
        guard let field = field else { throw ValidationError.invalidValue }
        if field == "" { throw ValidationError.invalidValue }
        return field
    }
}

enum ValidationError: LocalizedError {
    case invalidValue
    case isNotInt
    case isNotValidDay
    case isNotValidMonth
    case isNotValidYear
    case weightIsNotValid
    case dayNotInMonth
    
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
            return "Esse é um valor inválido."//
        case .isNotInt:
            return "Esse não é um valor inteiro."//
        case .isNotValidDay:
            return "Esse não é um dia válido."//
        case .isNotValidMonth:
            return "Esse não é um mês válido."//
        case .isNotValidYear:
            return "Esse não é um ano válido."//
        case .weightIsNotValid:
            return "Esse valor para peso não é valido."//
        case .dayNotInMonth:
            return "Esse dia não existe nesse mês."//
        }
    }
}
