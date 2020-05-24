//
//  OKLottoNumberGeneratorTests.swift
//  OKLottoNumberGeneratorTests
//
//  Created by Ocheol Kwon on 2020/05/23.
//  Copyright © 2020 Ocheol Kwon. All rights reserved.
//

import XCTest
@testable import OKLottoNumberGenerator

class OKLottoNumberGeneratorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLottoNumberVaildation() throws {
        
        func validateLottoNumber(lottoNumber: Int) -> Bool {
            if lottoNumber >= 1 && lottoNumber <= 45 {
                return true
            }
            
            return false
        }
        
        let generator = LottoNumberGenerator()
        let lottoNumbers = generator.lottoNumbers()
        
        XCTAssertTrue(lottoNumbers.count == 6)
        
        let reducedLottoNumber = lottoNumbers.reduce(1, { (s1: Int, s2: Int) -> Int in
            if !validateLottoNumber(lottoNumber: s1) {
                return 0
            }
            
            if !validateLottoNumber(lottoNumber: s2) {
                return 0
            }
            
            return 1
        })
        XCTAssertTrue(validateLottoNumber(lottoNumber: reducedLottoNumber))
        
        print("Lotto numbers: \(lottoNumbers)")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
