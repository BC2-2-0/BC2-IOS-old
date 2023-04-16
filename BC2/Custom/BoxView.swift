//
//  BoxView.swift
//  BC2
//
//  Created by 신아인 on 2023/04/16.
//

import UIKit
import Then
import SnapKit

class BoxView: UIView {
    
    let boxView: UIView = UIView()
    
    func boxViewSet(){
        boxView.backgroundColor = .white
        boxView.layer.cornerRadius = 13
        boxView.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
        boxView.layer.shadowOffset = CGSize(width: 0, height: 2)
        boxView.layer.shadowRadius = 4
        boxView.layer.shadowOpacity = 1
        addSubview(boxView)
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
        boxViewSet()
    }
    
    func setLayout(){
        boxView.snp.makeConstraints{ make in
            make.width.equalTo(320)
            make.height.equalTo(400)
            make.top.equalToSuperview().offset(290)
            make.left.right.equalToSuperview().offset(35)
            //make.centerY.equalToSuperview()
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
}
