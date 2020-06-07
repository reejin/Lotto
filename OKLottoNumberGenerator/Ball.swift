//
//  Ball.swift
//  OKLottoNumberGenerator
//
//  Created by Ocheol Kwon on 2020/06/06.
//  Copyright © 2020 Ocheol Kwon. All rights reserved.
//

import UIKit

struct LottoNumberRange {
    let minimumNumber: Int = 1
    let maximumNumber: Int = 45
}

class Ball: NSObject {
    public let lottoNumberRange = LottoNumberRange()
    public let lottoNumber: Int
    
    override init() {
        lottoNumber = Int(arc4random_uniform(UInt32(lottoNumberRange.maximumNumber))) + 1
    }
    
    init(_ initialNumber: Int) {
        lottoNumber = initialNumber
    }
    
    public func validateLottoNumber() -> Bool {
        (self.lottoNumber >= self.lottoNumberRange.minimumNumber) && (self.lottoNumber <= self.lottoNumberRange.maximumNumber)
    }
    
    public func isSameBall(_ otherBall: Ball) -> Bool {
        self.lottoNumber == otherBall.lottoNumber
    }
}
