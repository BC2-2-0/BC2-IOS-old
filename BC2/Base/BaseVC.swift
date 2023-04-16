//
//  BaseVC.swift
//  BC2
//
//  Created by 신아인 on 2023/04/15.
//

import UIKit
import SnapKit
import Then
import Lottie

class BaseVC: UIViewController {

    lazy var block = LottieAnimationView(name: "block").then {
        $0.contentMode = .scaleAspectFill
        $0.loopMode = .loop
        $0.play()
    }
    
    lazy var coin = LottieAnimationView(name: "Coin").then {
        $0.backgroundColor = UIColor.black
        $0.contentMode = .scaleAspectFill
        $0.loopMode = .loop
        $0.play()
    }
    lazy var coinAction = LottieAnimationView(name: "CoinAction").then {
        //$0.backgroundColor = UIColor.black
        $0.contentMode = .scaleAspectFill
        $0.loopMode = .loop
        $0.play()
    }
    
    @available(*, unavailable)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        setLayout()
        addTarget()
    }
    func addView(){}
    func setLayout(){}
    func addTarget(){}
}

