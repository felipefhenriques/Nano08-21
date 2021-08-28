//
//  Nano0821Tests.swift
//  Nano0821Tests
//
//  Created by Felipe Ferreira on 23/08/21.
//

import XCTest
@testable import Nano0821

class ValidationTests: XCTestCase {
    
    var validation: ValidationService!

    override func setUp() {
        super.setUp()
        validation = ValidationService()
    }
    
    
    override func tearDown() {
        validation = nil
        super.tearDown()
    }
    
    // MARK: Testes pra valores válidos
    func test_weight_is_valid() throws {
        XCTAssertNoThrow(try validation.validateWeight("3"))
        XCTAssertNoThrow(try validation.validateWeight("2.5"))
    }
    
    func test_date_is_valid() throws {
        XCTAssertNoThrow(try validation.validateDate("08", month: "03", year: "2001"))
        XCTAssertNoThrow(try validation.validateDate("3", month: "5", year: "2010"))
    }
    
    // MARK: Teste para .invalidValue
    func test_values_are_empty_or_nil() {
        let expectedError = ValidationError.invalidValue
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateEmpties("")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        
        XCTAssertThrowsError(try validation.validateEmpties(nil)) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
    }
    
    
    // MARK: Teste para .isNotInt
    func test_is_not_int() throws {
        let expectedError = ValidationError.isNotInt
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateDate("Dois", month: "03", year: "2021")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        
        XCTAssertThrowsError(try validation.validateDate("02", month: "Três", year: "2021")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        
        XCTAssertThrowsError(try validation.validateDate("02", month: "03", year: "Dois mil e vinte e um")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
    }
    
    // MARK: Testes para .isNotValidDay
    func test_day_is_invalid() throws {
        let expectedError = ValidationError.isNotValidDay
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateDate("0", month: "03", year: "2021")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        
        XCTAssertThrowsError(try validation.validateDate("32", month: "03", year: "2021")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
    }
    
    // MARK: Testes para .isNotValidMonth
    func test_month_is_invalid() throws {
        let expectedError = ValidationError.isNotValidMonth
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateDate("01", month: "0", year: "2021")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        
        XCTAssertThrowsError(try validation.validateDate("21", month: "13", year: "2021")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
    }
    
    // MARK: Testes para .isNotValidYear
    func test_year_is_invalid() throws {
        let expectedError = ValidationError.isNotValidYear
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateDate("01", month: "03", year: "2022")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        
        XCTAssertThrowsError(try validation.validateDate("25", month: "12", year: "2")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
    }
    
    
    // MARK: Testes para .weightIsNotValid
    func test_weight_is_invalid() throws {
        let expectedError = ValidationError.weightIsNotValid
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateWeight("É pra dar errado")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
    }
    
    // MARK: Testes para .dayNotInMonth
    func test_date_is_not_in_month() throws {
        let expectedError = ValidationError.dayNotInMonth
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateDate("31", month: "04", year: "2021")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        
        XCTAssertThrowsError(try validation.validateDate("30", month: "02", year: "2021")) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
    }

}
