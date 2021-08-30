//
//  Nano0821Tests.swift
//  Nano0821Tests
//
//  Created by Felipe Ferreira on 23/08/21.
//

import XCTest
@testable import Nano0821

class ValidationTests: XCTestCase {
    
    var validation: ValidationFunctions!

    override func setUp() {
        super.setUp()
        validation = ValidationFunctions()
    }
    
    
    override func tearDown() {
        validation = nil
        super.tearDown()
    }
    
    // MARK: Testes pra valores válidos
    func testWeightIsValid() throws {
        XCTAssertNoThrow(try validation.validateWeight("3"))
        XCTAssertNoThrow(try validation.validateWeight("2.5"))
    }
    
    func testDateIsValid() throws {
        XCTAssertNoThrow(try validation.validateDate("08", month: "03", year: "2001"))
        XCTAssertNoThrow(try validation.validateDate("3", month: "5", year: "2010"))
    }
    
    // MARK: Teste para .invalidValue
    func testValuesAreEmptyOrNil() {
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateEmpties("")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(ValidationError.invalidValue, error)
        XCTAssertEqual(ValidationError.invalidValue.errorDescription, error?.errorDescription)
        
        XCTAssertThrowsError(try validation.validateEmpties(nil)) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(ValidationError.invalidValue, error)
        XCTAssertEqual(ValidationError.invalidValue.errorDescription, error?.errorDescription)
        
        XCTAssertThrowsError(try validation.validateDate(nil, month: nil, year: nil)) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(ValidationError.invalidValue, error)
        XCTAssertEqual(ValidationError.invalidValue.errorDescription, error?.errorDescription)
    }
    
    
    // MARK: Teste para .isNotInt
    func testIsNotInt() throws {
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateDate("Dois", month: "03", year: "2021")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(ValidationError.isNotInt, error)
        XCTAssertEqual(ValidationError.isNotInt.errorDescription, error?.errorDescription)
        
        XCTAssertThrowsError(try validation.validateDate("02", month: "Três", year: "2021")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(ValidationError.isNotInt, error)
        XCTAssertEqual(ValidationError.isNotInt.errorDescription, error?.errorDescription)
        
        XCTAssertThrowsError(try validation.validateDate("02", month: "03", year: "Dois mil e vinte e um")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(ValidationError.isNotInt, error)
        XCTAssertEqual(ValidationError.isNotInt.errorDescription, error?.errorDescription)
    }
    
    // MARK: Testes para .isNotValidDay
    func testDayIsInvalid() throws {
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateDate("0", month: "03", year: "2021")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(ValidationError.isNotValidDay, error)
        XCTAssertEqual(ValidationError.isNotValidDay.errorDescription, error?.errorDescription)
        
        XCTAssertThrowsError(try validation.validateDate("32", month: "03", year: "2021")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(ValidationError.isNotValidDay, error)
        XCTAssertEqual(ValidationError.isNotValidDay.errorDescription, error?.errorDescription)
    }
    
    // MARK: Testes para .isNotValidMonth
    func testMonthIsInvalid() throws {
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateDate("01", month: "0", year: "2021")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(ValidationError.isNotValidMonth, error)
        XCTAssertEqual(ValidationError.isNotValidMonth.errorDescription, error?.errorDescription)
        
        XCTAssertThrowsError(try validation.validateDate("21", month: "13", year: "2021")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(ValidationError.isNotValidMonth, error)
        XCTAssertEqual(ValidationError.isNotValidMonth.errorDescription, error?.errorDescription)
    }
    
    // MARK: Testes para .isNotValidYear
    func testYearIsInvalid() throws {
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateDate("01", month: "03", year: "2022")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(ValidationError.isNotValidYear, error)
        XCTAssertEqual(ValidationError.isNotValidYear.errorDescription, error?.errorDescription)
        
        XCTAssertThrowsError(try validation.validateDate("25", month: "12", year: "2")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(ValidationError.isNotValidYear, error)
        XCTAssertEqual(ValidationError.isNotValidYear.errorDescription, error?.errorDescription)
    }
    
    
    // MARK: Testes para .weightIsNotValid
    func testWeightIsInvalid() throws {
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateWeight("É pra dar errado")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(ValidationError.weightIsNotValid, error)
        XCTAssertEqual(ValidationError.weightIsNotValid.errorDescription, error?.errorDescription)
    }
    
    // MARK: Testes para .dayNotInMonth
    func testDateIsNotInMonth() throws {
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateDate("31", month: "04", year: "2021")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(ValidationError.dayNotInMonth, error)
        XCTAssertEqual(ValidationError.dayNotInMonth.errorDescription, error?.errorDescription)
        
        XCTAssertThrowsError(try validation.validateDate("30", month: "02", year: "2021")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(ValidationError.dayNotInMonth, error)
        XCTAssertEqual(ValidationError.dayNotInMonth.errorDescription, error?.errorDescription)
    }
    
    // MARK: Testes para .imgNotFound
    func testImgIsInvalid() throws {
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateImg(nil)) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(ValidationError.imgNotFound, error)
        XCTAssertEqual(ValidationError.imgNotFound.errorDescription, error?.errorDescription)
    }

}
