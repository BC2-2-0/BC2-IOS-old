//
//  Header.swift
//  BC2
//
//  Created by 신아인 on 2023/04/16.
//

import UIKit
import Then
import SnapKit

class Header: UIView {
    
    let userNameLabel = UILabel().then{
        $0.text = "신아인님"
        $0.textColor = UIColor(named: "SubTextColor")
        $0.font = .systemFont(ofSize: 28)
        
        let font = UIFont.boldSystemFont(ofSize: 28)
        let attributedStr = NSMutableAttributedString(string: $0.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.black, range: ($0.text! as NSString).range(of: "신아인"))
        attributedStr.addAttribute(.font, value: font, range: ($0.text! as NSString).range(of: "신아인"))
        $0.attributedText = attributedStr
    }
    
    let helloLabel = UILabel().then{
        $0.text = "안녕하세요!"
        $0.textColor = UIColor(named: "SubTextColor")
        $0.font = .systemFont(ofSize: 28)
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
        addSubview(userNameLabel)
        addSubview(helloLabel)
        
    }
    
    func setLayout(){
        self.userNameLabel.snp.makeConstraints{
            $0.top.equalTo(safeAreaLayoutGuide).inset(55)
            $0.leading.equalTo(35)
        }
        self.helloLabel.snp.makeConstraints{
            $0.width.equalTo(130)
            $0.height.equalTo(30)
            $0.top.equalTo(userNameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(35)
        }
    }
}
