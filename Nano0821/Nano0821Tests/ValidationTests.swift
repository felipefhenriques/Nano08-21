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
    
    // MARK: Testes para .invalidValue
    
    // MARK: Testes para .isNotInt
    func test_weight_is_invalid() throws {
        let expectedError = ValidationError.weightIsNotValid
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateWeight("É pra dar errado")) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
    }
    
    func test_date_is_valid() throws {
        XCTAssertNoThrow(try validation.validateDate("08", month: "03", year: "2001"))
        XCTAssertNoThrow(try validation.validateDate("3", month: "5", year: "2010"))
    }
    
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
    
    


}
