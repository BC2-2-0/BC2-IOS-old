//
//  SubView.swift
//  BC2
//
//  Created by 신아인 on 2023/04/16.
//

import UIKit
import Then
import SnapKit

class SubView: UIView {
    
    let subView: UIView = UIView()
    
    func subViewSet(){
        subView.backgroundColor = .black
        subView.layer.cornerRadius = 30
        subView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        subView.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
        subView.layer.shadowOffset = CGSize(width: 0, height: -5)
        subView.layer.shadowRadius = 4
        subView.layer.shadowOpacity = 0.8
        subView.layer.masksToBounds = true
        addSubview(subView)
    }
    
    let myAccountLabel = UILabel().then{
        $0.text = "내 계좌"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 20)
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
        subViewSet()
        addSubview(myAccountLabel)
    }
    
    func setLayout() {
        subView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(150)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        myAccountLabel.snp.makeConstraints{ make in
            make.top.equalTo(subView.snp.top).inset(60)
            make.leading.equalTo(30)
        }
    }
    
}
