//
//  Human.swift
//  OKLottoNumberGenerator
//
//  Created by Ocheol Kwon on 2020/06/06.
//  Copyright © 2020 Ocheol Kwon. All rights reserved.
//

import UIKit

class Human: NSObject {
    public func markLottoNumbers() -> Array<Int> {
        let ballPicker = BallPicker()
        let balls = ballPicker.pickBalls()
        var lottoNumbers = Array<Int>()
        for ball: Ball in balls {
            lottoNumbers.append(ball.lottoNumber)
        }
        return lottoNumbers;
    }
}
