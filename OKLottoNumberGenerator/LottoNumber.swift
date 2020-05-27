//
//  LottoNumber.swift
//  OKLottoNumberGenerator
//
//  Created by Ocheol Kwon on 2020/05/26.
//  Copyright © 2020 Ocheol Kwon. All rights reserved.
//

import UIKit

class LottoNumber: NSObject {
    public var number: Int
    
    override init() {
        let specification = LottoNumberSpecification()
        number = Int(arc4random_uniform(UInt32(specification.maximumLottoNumber))) + 1
    }
}
