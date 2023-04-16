//
//  MainViewController.swift
//  BC2
//
//  Created by 신아인 on 2023/04/15.
//

import UIKit

class MainViewController: BaseVC {
    
    private let HeaderView = Header()
    
    private let sub = SubView()
    
    private let Box = BoxView()
    
    private let BoxInLabel = AmountLabel()
    
    private let goPaymentListBtn = UIButton().then{
        $0.setTitle("거래 내역 조회 ", for: .normal)
        $0.setTitleColor(UIColor(named: "MainTextColor"), for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.tintColor = UIColor(named: "MainTextColor")
        $0.contentHorizontalAlignment = .leading
        $0.semanticContentAttribute = .forceRightToLeft
    }

    private let Button1 = PaymentButton()
    
    private let Button2 = PaymentButton().then{
        $0.paymentButton.setTitle("코인 채굴", for: .normal)
        $0.paymentButton.backgroundColor = UIColor(named: "Button2Color")
        $0.paymentButton.setTitleColor(UIColor(named: "MainTextColor"), for: .normal)
    }
    
    override func addTarget() {
        Button2.paymentButton.addTarget(self, action: #selector(goToMining), for: .touchUpInside)
    }
    
    override func addView() {
        view.addSubview(HeaderView)
        view.addSubview(sub)
        view.addSubview(Box)
        view.addSubview(BoxInLabel)
        view.addSubview(goPaymentListBtn)
        view.addSubview(block)
        view.addSubview(Button1)
        view.addSubview(Button2)
    }
    
    override func setLayout() {
        sub.subView.snp.makeConstraints{ make in
            make.top.equalTo(HeaderView.helloLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        goPaymentListBtn.snp.makeConstraints{ make in
            make.width.equalTo(100)
            make.height.equalTo(17)
            make.top.equalTo(BoxInLabel.amountLabel.snp.bottom).offset(10)
            make.leading.equalTo(BoxInLabel.amountLabel.snp.leading)
        }
        block.snp.makeConstraints{ make in
            make.width.equalTo(170)
            make.height.equalTo(200)
            make.top.equalTo(goPaymentListBtn.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        Button2.snp.makeConstraints{ make in
            make.top.equalTo(Button1.snp.bottom).offset(60)
        }
    }
    
    @objc private func goToMining(){
        let controller = MiningViewController()
        self.present(controller, animated: true)
    }
}

#if DEBUG
import SwiftUI

extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

    func toPreview() -> some View {
        Preview(viewController: self)
    }
}

struct VCPreView: PreviewProvider {
    static var previews: some View {
        MainViewController().toPreview()
    }
}
#endif
