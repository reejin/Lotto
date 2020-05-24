//
//  LottoNumberGenerator.swift
//  OKLottoNumberGenerator
//
//  Created by Ocheol Kwon on 2020/05/23.
//  Copyright © 2020 Ocheol Kwon. All rights reserved.
//

import UIKit

class LottoNumberGenerator: NSObject {
    
    private func lottoNumber() -> Int {
        return Int(arc4random_uniform(45)) + 1;
    }
    
    public func lottoNumbers() -> Array<Int> {
        var lottoNumbers = Array<Int>()
        for _ in 0..<6 {
            lottoNumbers.append(lottoNumber())
        }
        
        return lottoNumbers
    }
    
}
