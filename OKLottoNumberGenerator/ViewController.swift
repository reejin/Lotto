//
//  ViewController.swift
//  OKLottoNumberGenerator
//
//  Created by Ocheol Kwon on 2020/05/23.
//  Copyright © 2020 Ocheol Kwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let human = Human()
        let markedNumbers = human.markLottoNumbers()
        
        let ballPicker = BallPicker()
        let pickedBalls = ballPicker.pickBalls()
        let bonusBall = ballPicker.pickBonusBall()
        
        let bank = Bank()
        bank.checkWinningResults(withPickedBalls: pickedBalls, bonusBall: bonusBall, markedLottoNumbers: markedNumbers)
    }
}

