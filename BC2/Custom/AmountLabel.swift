//
//  AmountLabel.swift
//  BC2
//
//  Created by 신아인 on 2023/04/16.
//

import UIKit
import Then
import SnapKit

class AmountLabel: UIView {
    
    let pointLabel = UILabel().then{
        $0.text = "BC2 Point"
        $0.textColor = UIColor(named: "SubTextColor")
        $0.font = .boldSystemFont(ofSize: 16)
    }
    
    let amountLabel = UILabel().then{
        $0.text = "10,000 원"
        $0.textColor = UIColor.black
        $0.font = .boldSystemFont(ofSize: 28)
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
        addSubview(pointLabel)
        addSubview(amountLabel)
    }
    
    func setLayout() {
        pointLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(300)
            make.leading.equalToSuperview().offset(45)
        }
        amountLabel.snp.makeConstraints{ make in
            make.top.equalTo(pointLabel.snp.bottom).offset(9)
            make.leading.equalToSuperview().offset(45)
        }
    }
}
