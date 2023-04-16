//
//  MainViewController.swift
//  BC2
//
//  Created by 신아인 on 2023/04/15.
//

import UIKit

class MainViewController: BaseVC {
    
    private let headerView = Header()
    
    private let sub = SubView()
    
    private let box = BoxView()
    
    private let boxInLabel = AmountLabel()
    
    private let goPaymentListBtn = UIButton().then{
        $0.setTitle("거래 내역 조회 ", for: .normal)
        $0.setTitleColor(UIColor(named: "MainTextColor"), for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.tintColor = UIColor(named: "MainTextColor")
        $0.contentHorizontalAlignment = .leading
        $0.semanticContentAttribute = .forceRightToLeft
    }

    private let paymentButton = PaymentButton()
    
    private let miningButton = PaymentButton().then{
        $0.paymentButton.setTitle("코인 채굴", for: .normal)
        $0.paymentButton.backgroundColor = UIColor(named: "Button2Color")
        $0.paymentButton.setTitleColor(UIColor(named: "MainTextColor"), for: .normal)
    }
    
    override func addTarget() {
        miningButton.paymentButton.addTarget(self, action: #selector(goToMining), for: .touchUpInside)
    }
    
    override func addView() {
        view.addSubview(headerView)
        view.addSubview(sub)
        view.addSubview(box)
        view.addSubview(boxInLabel)
        view.addSubview(goPaymentListBtn)
        view.addSubview(block)
        view.addSubview(paymentButton)
        view.addSubview(miningButton)
    }
    
    override func setLayout() {
        goPaymentListBtn.snp.makeConstraints{ make in
            make.width.equalTo(100)
            make.height.equalTo(17)
            make.top.equalTo(boxInLabel.amountLabel.snp.bottom).offset(10)
            make.leading.equalTo(boxInLabel.amountLabel.snp.leading)
        }
        block.snp.makeConstraints{ make in
            make.width.equalTo(170)
            make.height.equalTo(200)
            make.top.equalTo(goPaymentListBtn.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        miningButton.snp.makeConstraints{ make in
            make.top.equalTo(paymentButton.snp.bottom).offset(60)
        }
    }
    
    @objc private func goToMining(){
        let controller = MiningViewController()
        self.present(controller, animated: true)
    }
}
