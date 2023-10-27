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
<<<<<<< HEAD
class ListViewController: BaseVC {
    
=======
import RealmSwift
class ListViewController: BaseVC {
    
    private var paymentList = [PaymentRealmEntity] ()
    
    private var chargeList = [ChargeRealmEntity] ()
>>>>>>> 2708f5441fe821283a2c71f5890295e055ef0112
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
<<<<<<< HEAD
=======
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let realm = try! Realm()
        self.paymentList = Array(realm.objects(PaymentRealmEntity.self))
        self.chargeList = Array(realm.objects(ChargeRealmEntity.self))
    }
>>>>>>> 2708f5441fe821283a2c71f5890295e055ef0112
    override func addView() {
        view.addSubview(tableViewBG)
        view.addSubview(firstLabel)
        view.addSubview(block)
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
        block.snp.makeConstraints{ make in
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
    override func configNavigation() {
<<<<<<< HEAD
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        backButton.tintColor = .black
        self.navigationItem.backBarButtonItem = backButton
        self.view.backgroundColor = .white
=======
>>>>>>> 2708f5441fe821283a2c71f5890295e055ef0112
        self.navigationItem.hidesBackButton = false
    }
}
extension ListViewController {
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

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == rechargeDetailTableView {
<<<<<<< HEAD
            return 5
        }
        else{
            return 10
=======
            return chargeList.count
        }
        else{
            return paymentList.count
>>>>>>> 2708f5441fe821283a2c71f5890295e055ef0112
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BC2TableViewCell
<<<<<<< HEAD
        cell.customLabel.text = "Custom cell \(indexPath.row)"
        cell.numberLabel.text = "\(indexPath.row + 1)"
        if tableView == rechargeDetailTableView {
            let url = URL(string: "13.125.93.177:3000/send")!
            var urlrequest = URLRequest(url: url)
            urlrequest.httpMethod = "POST"
            let parameter = [
                "email": "String",
                "balance": "Int",
                "charged_money": "Int"
            ] as [String: Any]
            
            let httpbody = try! JSONSerialization.data(withJSONObject: parameter)
            urlrequest.httpBody = httpbody
            urlrequest.addValue("application/JavaScript", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: urlrequest) { data, response, error in
                if let error {
                    print(error)
                }
            }
            
=======
        cell.numberLabel.text = "\(indexPath.row + 1)"
        
        let moneyFormatter: NumberFormatter = NumberFormatter()
        moneyFormatter.numberStyle = .decimal
        
        if tableView == rechargeDetailTableView {
            cell.customLabel.text = "\(chargeList[indexPath.row].emailHash.prefix(16))"
            let rechargeMoney = moneyFormatter.string(for: Int(chargeList[indexPath.row].charged_money)!)
            cell.rechargeLabel.text = "충전 금액 : \(rechargeMoney ?? " ")"
            let moneyBalance = moneyFormatter.string(for: Int(chargeList[indexPath.row].balance)!)
            cell.rechargeBalanceLabel.text = "잔액 : \(moneyBalance ?? " ")"
>>>>>>> 2708f5441fe821283a2c71f5890295e055ef0112
            cell.itemLabel.isHidden = true
            cell.countLabel.isHidden = true
            cell.paymentAmountLabel.isHidden = true
            cell.paymentBalanceLabel.isHidden = true
            cell.rechargeLabel.isHidden = false
            cell.rechargeBalanceLabel.isHidden = false
        }
        else {
<<<<<<< HEAD
=======
            cell.customLabel.text = "\(paymentList[indexPath.row].emailHash.prefix(16))"
            cell.itemLabel.text = "품목 : \(paymentList[indexPath.row].menu)"
            cell.countLabel.text = "개수 : \(paymentList[indexPath.row].quantity)"
            let paymentMoney = moneyFormatter.string(for: Int(paymentList[indexPath.row].price)! * Int(paymentList[indexPath.row].quantity)!)
            cell.paymentAmountLabel.text = "결제 금액 : \(paymentMoney ?? " ")"
            let paymentBalance = moneyFormatter.string(for: Int(paymentList[indexPath.row].balance)!)
            cell.paymentBalanceLabel.text = "잔액 : \(paymentBalance ?? " ")"
>>>>>>> 2708f5441fe821283a2c71f5890295e055ef0112
            cell.itemLabel.isHidden = false
            cell.countLabel.isHidden = false
            cell.paymentAmountLabel.isHidden = false
            cell.paymentBalanceLabel.isHidden = false   
            cell.rechargeLabel.isHidden = true
            cell.rechargeBalanceLabel.isHidden = true
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
