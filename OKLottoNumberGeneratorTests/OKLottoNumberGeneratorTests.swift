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
        let generator = LottoNumberGenerator()
        let lottoNumbers = generator.lottoNumbers()
        let specification = LottoNumberSpecification()
        XCTAssertTrue(lottoNumbers.count == specification.numberOfLottoNumbers)
        print("Lotto numbers: \(lottoNumbers)")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
