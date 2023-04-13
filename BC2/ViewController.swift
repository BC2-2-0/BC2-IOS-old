//
//  ViewController.swift
//  BC2
//
//  Created by AnnKangHo on 2023/04/09.
//

import UIKit
import SnapKit
import Then
import Lottie
class ViewController: BaseVC {
    
    let firstLabel = PaymentListMainLabel()

    let tableViewBG = UIView().then {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 24
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        $0.layer.masksToBounds = true
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowOpacity = 0.5
        $0.layer.shadowRadius = 4
        $0.layer.shadowOffset = CGSize(width: 2, height: -3)
        $0.clipsToBounds = false
    }
    let paymentDetailButton = UIButton().then {
        $0.setTitle("결제", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
    }
    let rechargeDetailButton = UIButton().then {
        $0.setTitle("충전", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
    }
    let paymentDetailTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.isHidden = false
    }
    let rechargeDetailTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.isHidden = true
    }
    override func addTarget() {
        paymentDetailButton.addTarget(
            self,
            action: #selector(paymentButtonDidTap),
            for: .touchUpInside)
        rechargeDetailButton.addTarget(
            self,
            action: #selector(rechargeButtonDidTap),
            for: .touchUpInside)
        paymentDetailTableView.register(
            BC2TableViewCell.self,
            forCellReuseIdentifier: "cell")
        rechargeDetailTableView.register(
            BC2TableViewCell.self,
            forCellReuseIdentifier: "cell")
    }
    override func addView() {
        view.addSubview(tableViewBG)
        view.addSubview(firstLabel)
        view.addSubview(indicator)
        view.addSubview(paymentDetailButton)
        view.addSubview(rechargeDetailButton)
        view.addSubview(paymentDetailTableView)
        view.addSubview(rechargeDetailTableView)
    }
    override func setLayout() {
        tableViewBG.snp.makeConstraints{ make in
            make.leading.trailing.equalTo(view.safeAreaInsets).inset(0)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(140)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(0)
        }
        indicator.snp.makeConstraints{ make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(14)
            make.width.equalTo(113)
            make.height.equalTo(107)
        }
        paymentDetailButton.snp.makeConstraints{ make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(160)
            make.width.equalTo(26)
            make.height.equalTo(18)
        }
        rechargeDetailButton.snp.makeConstraints{ make in
            make.leading.equalTo(paymentDetailButton.snp.trailing).inset(-15)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(160)
            make.width.equalTo(26)
            make.height.equalTo(18)
        }
        paymentDetailTableView.snp.makeConstraints{ make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(190)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(0)
        }
        rechargeDetailTableView.snp.makeConstraints{ make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(190)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(0)
        }
    }
    override func delegate() {
        paymentDetailTableView.delegate = self
        paymentDetailTableView.dataSource = self
        rechargeDetailTableView.delegate = self
        rechargeDetailTableView.dataSource = self
    }
}
extension ViewController {
    @objc func paymentButtonDidTap(_ sender: UIButton){
        paymentDetailButton.setTitleColor(.black, for: .normal)
        rechargeDetailButton.setTitleColor(.gray, for: .normal)
        paymentDetailTableView.isHidden = false
        rechargeDetailTableView.isHidden = true
    }
    @objc func rechargeButtonDidTap(_ sender: UIButton){
        paymentDetailButton.setTitleColor(.gray, for: .normal)
        rechargeDetailButton.setTitleColor(.black, for: .normal)
        paymentDetailTableView.isHidden = true
        rechargeDetailTableView.isHidden = false
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == rechargeDetailTableView {
            return 5
        }
        else{
            return 10
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BC2TableViewCell
        cell.customLabel.text = "Custom cell \(indexPath.row)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
