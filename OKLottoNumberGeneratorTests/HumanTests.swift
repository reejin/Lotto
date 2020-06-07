//
//  HumanTests.swift
//  OKLottoNumberGeneratorTests
//
//  Created by Ocheol Kwon on 2020/06/06.
//  Copyright © 2020 Ocheol Kwon. All rights reserved.
//

import XCTest
@testable import OKLottoNumberGenerator

class HumanTests: XCTestCase {
    let human = Human()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMarkedLottoNumbers() throws {
        let lottoNumbers = self.human.markLottoNumbers()
        XCTAssertFalse(self.hasSameNumber(lottoNumbers))
    }
    
    func hasSameNumber(_ numbers: Array<Int>) -> Bool {
        for number in numbers {
            let sameNumbers = numbers.filter { $0 == number }
            if sameNumbers.count >= 2 {
                return true;
            }
        }
        return false;
    }
}
