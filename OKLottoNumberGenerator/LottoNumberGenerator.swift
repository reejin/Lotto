//
//  LottoNumberGenerator.swift
//  OKLottoNumberGenerator
//
//  Created by Ocheol Kwon on 2020/05/23.
//  Copyright © 2020 Ocheol Kwon. All rights reserved.
//

import UIKit

class LottoNumberGenerator: NSObject {
    
    public func lottoNumbers() -> Array<LottoNumber> {
        let specification = LottoNumberSpecification()
        var lottoNumbers = Array<LottoNumber>()
        for _ in 0..<specification.numberOfLottoNumbers {
            lottoNumbers.append(LottoNumber())
        }
        return lottoNumbers
    }
    
}
