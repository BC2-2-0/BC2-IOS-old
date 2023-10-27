//
//  MainViewController.swift
//  BC2
//
//  Created by 신아인 on 2023/04/15.
//

import UIKit

class MainViewController: BaseVC {
    
    var userName: String = " "
    var userEmail: String = " "
    
    var amount = 0
    
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
        $0.addTarget(self, action: #selector(goToList), for: .touchUpInside)
    }
    
    private let miniBlock = BaseVC().block

    private let paymentButton = PaymentButton()
    
    private let miningButton = PaymentButton().then{
        $0.setTitle("코인 채굴", for: .normal)
        $0.backgroundColor = UIColor(named: "Button2Color")
        $0.setTitleColor(UIColor(named: "MainTextColor"), for: .normal)
        $0.addTarget(self, action: #selector(goToMining), for: .touchUpInside)
    }
    
    override func addView() {
        changeNameLabel()
        changeAmountLabel()
        view.addSubview(headerView)
        view.addSubview(miniBlock)
        view.addSubview(sub)
        view.addSubview(box)
        view.addSubview(boxInLabel)
        view.addSubview(goPaymentListBtn)
        view.addSubview(block)
        view.addSubview(paymentButton)
        view.addSubview(miningButton)
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
        miniBlock.snp.makeConstraints {
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
        goPaymentListBtn.snp.makeConstraints{
            $0.width.equalTo(100)
            $0.height.equalTo(17)
            $0.top.equalTo(boxInLabel.amountLabel.snp.bottom).offset(10)
            $0.leading.equalTo(boxInLabel.amountLabel.snp.leading)
        }
        block.snp.makeConstraints{
            $0.width.equalTo(170)
            $0.height.equalTo(200)
            $0.top.equalTo(goPaymentListBtn.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
        paymentButton.snp.makeConstraints{
            $0.width.equalTo(288)
            $0.height.equalTo(45)
            $0.top.equalTo(block.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(53)
        }
        miningButton.snp.makeConstraints{
            $0.width.equalTo(288)
            $0.height.equalTo(45)
            $0.top.equalTo(paymentButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(53)
        }
    }
    override func configNavigation() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backButton.tintColor = .black
        self.navigationItem.backBarButtonItem = backButton
        self.view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true
    }
    
    @objc func goToMining(){
        let nextVC = MiningViewController()
        nextVC.myMoney = amount
        nextVC.userName = self.userName
        nextVC.userEmail = self.userEmail
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    @objc func goToList(){
        let nextVC = ListViewController()
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    func changeAmountLabel() {
        let moneyFormatter: NumberFormatter = NumberFormatter()
        moneyFormatter.numberStyle = .decimal
        let result: String = moneyFormatter.string(for: amount)! + " 원"
        boxInLabel.amountLabel.text = result
    }
    
    func changeNameLabel() {
        let result: String = userName
        headerView.userNameLabel.text = result + "님"
        let font = UIFont.boldSystemFont(ofSize: 28)
        let attributedText = NSMutableAttributedString(string: headerView.userNameLabel.text!)
        
        if let range = headerView.userNameLabel.text?.range(of: result) {
            let nsRange = NSRange(range, in: headerView.userNameLabel.text!)
            attributedText.addAttribute(.foregroundColor, value: UIColor.black, range: nsRange)
            attributedText.addAttribute(.font, value: font, range: nsRange)
        }
        
        headerView.userNameLabel.attributedText = attributedText
    }
}
