//
//  BankTests.swift
//  OKLottoNumberGeneratorTests
//
//  Created by Ocheol Kwon on 2020/06/06.
//  Copyright © 2020 Ocheol Kwon. All rights reserved.
//

import XCTest
@testable import OKLottoNumberGenerator

class BankTests: XCTestCase {
    let lottoNumberRange = LottoNumberRange()
    let bank = Bank()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLottoNumberWinning() throws {
        let balls = self.dummyBalls()
        let bonusBall = self.dummyBonusBall()
        let lottoNumbers = self.sameLottoNumbers(withBalls: balls)
        XCTAssertTrue(self.bank.checkWinningResults(withPickedBalls: balls, bonusBall: bonusBall, markedLottoNumbers: lottoNumbers) == .WinningResultsRank1)
    }
    
    func testLottoNumberNoWinning() throws {
        let balls = self.dummyBalls()
        let bonusBall = self.dummyBonusBall()
        let lottoNumbers = self.differentLottoNumbers(withBalls: balls)
        XCTAssertTrue(self.bank.checkWinningResults(withPickedBalls: balls, bonusBall: bonusBall, markedLottoNumbers: lottoNumbers) == .WinningResultsRankNone)
    }
    
    func dummyBalls() -> Array<Ball> {
        var balls = Array<Ball>()
        let minimumLottoNumber = self.lottoNumberRange.minimumNumber
        for i in minimumLottoNumber..<minimumLottoNumber+numberOfBallsPickedAtOneTime {
            balls.append(Ball(i))
        }
        return balls
    }
    
    func dummyBonusBall() -> Ball {
        return Ball(self.lottoNumberRange.maximumNumber)
    }
    
    func sameLottoNumbers(withBalls balls: Array<Ball>) -> Array<Int> {
        var lottoNumbers = Array<Int>()
        for ball: Ball in balls {
            lottoNumbers.append(ball.lottoNumber)
        }
        return lottoNumbers
    }
    
    func differentLottoNumbers(withBalls balls: Array<Ball>) -> Array<Int> {
        return balls.map { $0.lottoNumber + balls.count }
    }
}
