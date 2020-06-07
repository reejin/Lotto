//
//  BallPicker.swift
//  OKLottoNumberGenerator
//
//  Created by Ocheol Kwon on 2020/06/06.
//  Copyright © 2020 Ocheol Kwon. All rights reserved.
//

import UIKit

public let numberOfBallsPickedAtOneTime: Int = 6

class BallPicker: NSObject {
    private var pickedBalls = Array<Ball>()
    
    private func pickBall() -> Ball {
        var ball = Ball()
        while self.containsBall(ball) {
            ball = Ball()
        }
        return ball
    }
    
    private func containsBall(_ ball: Ball) -> Bool {
        let sameBalls = self.pickedBalls.filter { $0.isSameBall(ball) }
        return sameBalls.count > 0
    }
    
    public func pickBalls() -> Array<Ball> {
        self.pickedBalls = Array<Ball>()
        for _ in 0..<numberOfBallsPickedAtOneTime {
            self.pickedBalls.append(self.pickBall())
        }
        return self.pickedBalls
    }
    
    public func pickBonusBall() -> Ball {
        return pickBall()
    }
}
