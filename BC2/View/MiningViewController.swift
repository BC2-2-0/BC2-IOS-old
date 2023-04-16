//
//  MiningViewController.swift
//  BC2
//
//  Created by 신아인 on 2023/04/16.
//

import UIKit

class MiningViewController: BaseVC {
    
    private let HeaderView = Header()
    
    private let sub = SubView().then {
        $0.myAccountLabel.text = "채굴장"
    }
    
    private let Box = BoxView()
    
    private let BoxInLabel = AmountLabel()
    
    private let infoButton = UIButton().then {
        $0.setImage(UIImage(systemName: "info.circle.fill"), for: .normal)
        $0.tintColor = UIColor(named: "Button2Color")
    }

    private let Button1 = PaymentButton().then {
        $0.paymentButton.backgroundColor = .white
        $0.paymentButton.setTitle("56221ed7995860546cf055584433e3e9", for: .normal)
        $0.paymentButton.setTitleColor(UIColor.black, for: .normal)
        $0.paymentButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.paymentButton.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
        $0.paymentButton.layer.shadowOffset = CGSize(width: 3, height: 1)
        $0.paymentButton.layer.shadowRadius = 6
        $0.paymentButton.layer.shadowOpacity = 1
    }
    
    private let Button2 = PaymentButton().then{
        $0.paymentButton.setTitle("메인으로", for: .normal)
        $0.paymentButton.backgroundColor = UIColor(named: "Button2Color")
        $0.paymentButton.setTitleColor(UIColor(named: "MainTextColor"), for: .normal)
    }
    
    override func addView() {
        view.addSubview(HeaderView)
        view.addSubview(sub)
        view.addSubview(Box)
        view.addSubview(BoxInLabel)
        view.addSubview(infoButton)
        view.addSubview(block)
        view.addSubview(coin)
        view.addSubview(coinAction)
        view.addSubview(Button1)
        view.addSubview(Button2)
    }
    
    override func setLayout() {
        
        infoButton.snp.makeConstraints{ make in
            make.width.height.equalTo(50)
            make.top.equalToSuperview().offset(300)
            make.leading.equalTo(BoxInLabel.amountLabel.snp.trailing).offset(130)
        }
        block.snp.makeConstraints{ make in
            make.width.equalTo(115)
            make.height.equalTo(105)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.leading.equalTo(230)
        }
        coinAction.snp.makeConstraints{ make in
            make.width.height.equalTo(300)
            make.top.equalTo(BoxInLabel.amountLabel.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
        }
        coin.snp.makeConstraints{ make in
            make.width.height.equalTo(200)
            make.top.equalTo(BoxInLabel.amountLabel.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
        }
        Button2.snp.makeConstraints{ make in
            make.top.equalTo(Button1.snp.bottom).offset(60)
        }
    }
}

//#if DEBUG
//import SwiftUI
//
//extension UIViewController {
//    private struct Preview: UIViewControllerRepresentable {
//        let viewController: UIViewController
//
//        func makeUIViewController(context: Context) -> UIViewController {
//            return viewController
//        }
//
//        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        }
//    }
//
//    func toPreview() -> some View {
//        Preview(viewController: self)
//    }
//}
//
//struct VCPreView: PreviewProvider {
//    static var previews: some View {
//        MiningViewController().toPreview()
//    }
//}
//#endif
