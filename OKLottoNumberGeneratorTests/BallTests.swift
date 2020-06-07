//
//  BallTests.swift
//  OKLottoNumberGeneratorTests
//
//  Created by Ocheol Kwon on 2020/06/06.
//  Copyright © 2020 Ocheol Kwon. All rights reserved.
//

import XCTest
@testable import OKLottoNumberGenerator

class BallTests: XCTestCase {
    let lottoNumberRange = LottoNumberRange()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLottoNumber() throws {
        let ball = Ball(self.lottoNumberRange.maximumNumber)
        XCTAssertTrue(ball.validateLottoNumber())
        
        let wrongBall = Ball(self.lottoNumberRange.maximumNumber + 1)
        XCTAssertFalse(wrongBall.validateLottoNumber())
    }
}
