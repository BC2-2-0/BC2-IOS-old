//
//  MiningViewController.swift
//  BC2
//
//  Created by 신아인 on 2023/04/16.
//

import UIKit

class MiningViewController: BaseVC {
    
    private let headerView = Header()
    
    private let sub = SubView().then {
        $0.myAccountLabel.text = "채굴장"
    }
    
    private let box = BoxView()
    
    private let boxInLabel = AmountLabel()
    
    private let infoButton = UIButton().then {
        $0.setImage(UIImage(systemName: "info.circle.fill"), for: .normal)
        $0.tintColor = UIColor(named: "Button2Color")
    }
    
    private let miningCodeButton = PaymentButton().then {
        $0.backgroundColor = .white
        $0.setTitle("56221ed7995860546cf055584433e3e9", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
        $0.layer.shadowOffset = CGSize(width: 2, height: 1)
        $0.layer.shadowRadius = 5
        $0.layer.shadowOpacity = 1
    }
    
    private let mainButton = PaymentButton().then{
        $0.setTitle("메인으로", for: .normal)
        $0.backgroundColor = UIColor(named: "Button2Color")
        $0.setTitleColor(UIColor(named: "MainTextColor"), for: .normal)
        $0.addTarget(self, action: #selector(goToMain), for: .touchUpInside)
    }
    
    override func addTarget() {
        mainButton.addTarget(self, action: #selector(goToMain), for: .touchUpInside)
    }
    
    override func addView() {
        view.addSubview(headerView)
        view.addSubview(block)
        view.addSubview(sub)
        view.addSubview(box)
        view.addSubview(boxInLabel)
        view.addSubview(infoButton)
        view.addSubview(coin)
        view.addSubview(coinAction)
        view.addSubview(miningCodeButton)
        view.addSubview(mainButton)
    }
    
    override func setLayout() {
        headerView.userNameLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalTo(35)
        }
        headerView.helloLabel.snp.makeConstraints{
            $0.width.equalTo(130)
            $0.height.equalTo(30)
            $0.top.equalTo(headerView.userNameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(35)
        }
        block.snp.makeConstraints{
            $0.width.equalTo(115)
            $0.height.equalTo(105)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            $0.leading.equalTo(230)
        }
        sub.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.bottom).offset(60)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        box.snp.makeConstraints{
            $0.width.equalTo(350)
            $0.height.equalTo(700)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(sub.snp.top).offset(70)
        }
        boxInLabel.snp.makeConstraints {
            $0.top.equalTo(box.snp.top).offset(15)
            $0.leading.equalTo(box.snp.leading).offset(10)
        }
        infoButton.snp.makeConstraints{
            $0.width.height.equalTo(30)
            $0.top.equalTo(boxInLabel.pointLabel.snp.top)
            $0.leading.equalTo(boxInLabel.amountLabel.snp.trailing).offset(120)
        }
        coin.snp.makeConstraints{
            $0.width.height.equalTo(200)
            $0.top.equalTo(boxInLabel.amountLabel.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
        }
        coinAction.snp.makeConstraints{
            $0.width.equalTo(200)
            $0.top.equalTo(coin.snp.top).offset(-30)
            $0.bottom.equalTo(coin.snp.bottom).offset(27)
            $0.centerX.equalToSuperview()
        }
        miningCodeButton.snp.makeConstraints{
            $0.width.equalTo(288)
            $0.height.equalTo(45)
            $0.top.equalTo(coin.snp.bottom).offset(37)
            $0.leading.equalToSuperview().offset(53)
        }
        mainButton.snp.makeConstraints{
            $0.width.equalTo(288)
            $0.height.equalTo(45)
            $0.top.equalTo(miningCodeButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(53)
        }
    }
    
    @objc func goToMain(){
        let nextVC = MainViewController()
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
}
