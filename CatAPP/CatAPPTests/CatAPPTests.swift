//
//  CatAPPTests.swift
//  CatAPPTests
//
//  Created by Moises Lopez on 18/09/23.
//

import XCTest
@testable import CatAPP

class Calculator {
    var value: Int?

    func add(numberA: Int, numberB: Int) -> Int {
        return numberA + numberB
    }

    func asyncAdd(numberA: Int, numberB: Int, execute: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.value = numberA + numberB
            execute()
        }
    }
}

final class CatAPPTests: XCTestCase {
    let calculator = Calculator()

    func test_add() {
        let result = calculator.add(numberA: 4, numberB: 3)
        XCTAssertEqual(result, 7)
    }

    func test_asyncAdd() {
        let expectation = expectation(description: "CalculatorAsync")
        calculator.asyncAdd(numberA: 4, numberB: 3) {
            expectation.fulfill()
            XCTAssertEqual(self.calculator.value, 7)
        }
        wait(for: [expectation], timeout: 5)
    }
}
