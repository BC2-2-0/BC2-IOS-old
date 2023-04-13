//
//  BaseVC.swift
//  BC2
//
//  Created by AnnKangHo on 2023/04/10.
//

import UIKit
import Lottie
class BaseVC: UIViewController {
    
    lazy var indicator = LottieAnimationView(name: "MainLottie").then {
        $0.contentMode = .scaleAspectFit
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
        delegate()
    }
    func addView(){}
    func setLayout(){}
    func addTarget(){}
    func delegate(){}
}
