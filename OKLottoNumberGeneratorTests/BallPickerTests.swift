//
//  BallPickerTests.swift
//  OKLottoNumberGeneratorTests
//
//  Created by Ocheol Kwon on 2020/06/06.
//  Copyright © 2020 Ocheol Kwon. All rights reserved.
//

import XCTest
@testable import OKLottoNumberGenerator

class BallPickerTests: XCTestCase {
    let ballPicker = BallPicker()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberOfLottoNumbers() throws {
        let balls = self.ballPicker.pickBalls()
        XCTAssertTrue(balls.count == numberOfBallsPickedAtOneTime)
    }
    
    func testLottoNumberRedundancy() throws {
        var balls = self.ballPicker.pickBalls()
        let bonusBall = self.ballPicker.pickBonusBall()
        balls.append(bonusBall)
        XCTAssertFalse(self.hasSameBall(balls))
    }
    
    func hasSameBall(_ balls: Array<Ball>) -> Bool {
        for ball in balls {
            let sameBalls = balls.filter { $0.isSameBall(ball) }
            if sameBalls.count >= 2 {
                return true;
            }
        }
        return false;
    }
}
