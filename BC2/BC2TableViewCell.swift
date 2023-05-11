//
//  BC2TableViewCell.swift
//  BC2
//
//  Created by AnnKangHo on 2023/04/12.
//

import UIKit
import SnapKit
import Then

class BC2TableViewCell: UITableViewCell {
    let customLabel = UILabel()
    let cellView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.5
        $0.layer.shadowRadius = 4
        $0.layer.shadowOffset = CGSize(width: 2, height: 3)
        $0.layer.cornerRadius = 10
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        addView()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addView(){
        addSubview(cellView)
        addSubview(customLabel)
    }
    func setLayout(){
        cellView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(100)
        }
        customLabel.snp.makeConstraints{ make in
            make.leading.equalTo(cellView.snp.leading).inset(30)
            make.top.equalTo(cellView.snp.top).inset(38)
        }
    }
}
