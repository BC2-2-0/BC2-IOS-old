//
//  PaymentButton.swift
//  BC2
//
//  Created by 신아인 on 2023/04/16.
//

import UIKit
import Then
import SnapKit

class PaymentButton: UIView {
    
    let paymentButton = UIButton().then{
        $0.layer.cornerRadius = 12
        $0.backgroundColor = UIColor(named: "Button1Color")
        $0.setTitle("결제", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addView()
        setLayout()
    }
    
    func addView(){
        addSubview(paymentButton)
    }
    
    func setLayout(){
        paymentButton.snp.makeConstraints{ make in
            make.width.equalTo(288)
            make.height.equalTo(45)
            make.top.equalToSuperview().inset(633)
            make.leading.equalToSuperview().offset(55)
        }
    }
}
