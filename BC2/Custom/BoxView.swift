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
    
    let boxView: UIView = UIView().then {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 13
        $0.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
        $0.layer.shadowRadius = 4
        $0.layer.shadowOpacity = 1
    }
    
//    func boxViewSet(){
//        boxView.backgroundColor = .white
//        boxView.layer.cornerRadius = 13
//        boxView.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
//        boxView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        boxView.layer.shadowRadius = 4
//        boxView.layer.shadowOpacity = 1
//    }
    
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
        //boxViewSet()
        addSubview(boxView)
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
