//
//  Bank.swift
//  OKLottoNumberGenerator
//
//  Created by Ocheol Kwon on 2020/06/06.
//  Copyright © 2020 Ocheol Kwon. All rights reserved.
//

import UIKit

enum WinningResults: String {
    case WinningResultsRankNone = "꽝"
    case WinningResultsRank1 = "1등"
    case WinningResultsRank2 = "2등"
    case WinningResultsRank3 = "3등"
    case WinningResultsRank4 = "4등"
    case WinningResultsRank5 = "5등"
}

class Bank: NSObject {
    public func checkWinningResults(withPickedBalls pickedBalls: Array<Ball>, bonusBall: Ball, markedLottoNumbers: Array<Int>) -> WinningResults {
        let winningLottoNumbers = self.winningLottoNumbers(withPickedBalls: pickedBalls, markedLottoNumbers: markedLottoNumbers)
        let winningResult = self.winningResults(withPickedBalls: pickedBalls, bonusBall: bonusBall, markedLottoNumbers: markedLottoNumbers, winningLottoNumbers: winningLottoNumbers)
        
        self.printNumbers(withPickedBalls: pickedBalls, bonusBall: bonusBall)
        self.printNumbers(withMarkedLottoNumbers: markedLottoNumbers)
        self.printNumbers(withWinningLottoNumbers: winningLottoNumbers)
        self.printWinningResult(winningResult)
        
        return winningResult
    }
    
    private func winningLottoNumbers(withPickedBalls pickedBalls: Array<Ball>, markedLottoNumbers: Array<Int>) -> Array<Int> {
        var winningLottoNumbers = Array<Int>()
        for ball: Ball in pickedBalls {
            if markedLottoNumbers.contains(ball.lottoNumber) {
                winningLottoNumbers.append(ball.lottoNumber)
            }
        }
        return winningLottoNumbers
    }
    
    private func isBonusNumberWinning(withBonusBall bonusBall: Ball, noWinningNumbers: Array<Int>) -> Bool {
        let ballsWithSameNumber = noWinningNumbers.filter { $0 == bonusBall.lottoNumber}
        return ballsWithSameNumber.count == 1
    }
    
    private func winningResults(withPickedBalls pickedBalls: Array<Ball>, bonusBall: Ball, markedLottoNumbers: Array<Int>, winningLottoNumbers: Array<Int>) -> WinningResults {
        switch winningLottoNumbers.count {
        case pickedBalls.count:
            return .WinningResultsRank1
        case pickedBalls.count - 1:
            let noWinningNumbers = markedLottoNumbers.filter { !winningLottoNumbers.contains($0) }
            if self.isBonusNumberWinning(withBonusBall: bonusBall, noWinningNumbers: noWinningNumbers) {
                return .WinningResultsRank2
            }
            return .WinningResultsRank3
        case pickedBalls.count - 2:
            return .WinningResultsRank4
        case pickedBalls.count - 3:
            return .WinningResultsRank5
        default:
            return .WinningResultsRankNone
        }
    }
    
    private func printNumbers(withPickedBalls pickedBalls: Array<Ball>, bonusBall: Ball) {
        var string = "기계가 뽑은 번호: "
        for ball: Ball in pickedBalls {
            string.append("\(ball.lottoNumber), ")
        }
        string.append("\(bonusBall.lottoNumber)(보너스)")
        print(string)
    }
    
    private func printNumbers(withMarkedLottoNumbers markedLottoNumbers: Array<Int>) {
        let title = "사람이 선택한 번호: "
        var string = title
        for lottoNumber: Int in markedLottoNumbers {
            if string == title {
                string.append("\(lottoNumber)")
                continue
            }
            string.append(", \(lottoNumber)")
        }
        print(string)
    }
    
    private func printNumbers(withWinningLottoNumbers winningLottoNumbers: Array<Int>) {
        let title = "당첨된 번호: "
        var string = title
        for lottoNumber: Int in winningLottoNumbers {
            if string == title {
                string.append("\(lottoNumber)")
                continue
            }
            string.append(", \(lottoNumber)")
        }
        print(string)
    }
    
    private func printWinningResult(_ winningResult: WinningResults) {
        let string = "당첨 결과: " + "\(winningResult.rawValue)"
        print(string)
    }
}
