//
//  StartViewController.swift
//  BC2
//
//  Created by 신아인 on 2023/04/15.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class StartViewController: BaseVC{
    
    var userName: String = " "
    var userEmail: String = " "
    
    private let googleSignupImage = UIImage(named: "GoogleSignup")
    
    private let mainLabel = UILabel().then{
        $0.text = "BC2 Pay"
        $0.textColor = UIColor(named: "MainTextColor")
        $0.font = .boldSystemFont(ofSize: 50)
    }
    
    private let subLabel = UILabel().then{
        $0.text = "빠르고 편한 결제 시스템"
        $0.textColor = UIColor(named: "SubTextColor")
        $0.font = .systemFont(ofSize: 15)
    }
    
    //    private let googleSignupButton = UIButton().then{
    //        //$0.style = .wide
    //        $0.layer.cornerRadius = 28
    //        $0.setTitle("Sign up with Google", for: .normal)
    //        $0.setTitleColor(UIColor(named: "MainTextColor"), for: .normal)
    //        $0.backgroundColor = UIColor(named: "SignUpButtonColor")
    //        $0.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
    //        $0.layer.shadowOffset = CGSize(width: 1, height: 4)
    //        $0.layer.shadowOpacity = 1
    //        $0.layer.shadowRadius = 6
    //
    //        $0.setImage(UIImage(named: "GoogleSignup"), for: .normal)
    //        $0.imageEdgeInsets = .init(top: 12, left: 42, bottom: 12, right: 210)
    //        $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 35)
    //        $0.titleEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: -50)
    //    }
    
    private let googleSignupButton = GIDSignInButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 28
        $0.backgroundColor = .white
        $0.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
        $0.layer.shadowOffset = CGSize(width: 1, height: 4)
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 6
        $0.style = .wide
        
        $0.addTarget(self, action: #selector(signinWithGoogle), for: .touchUpInside)
    }
    
    override func addView() {
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
        view.addSubview(block)
        view.addSubview(googleSignupButton)
    }
    
    override func setLayout(){
        mainLabel.snp.makeConstraints{
            $0.height.equalTo(60)
            $0.width.equalTo(190)
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
            $0.centerX.equalToSuperview()
        }
        subLabel.snp.makeConstraints{
            $0.height.equalTo(17)
            $0.width.equalTo(150)
            $0.top.equalTo(mainLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        block.snp.makeConstraints{
            $0.height.equalTo(240)
            $0.width.equalTo(253)
            $0.top.equalTo(subLabel.snp.bottom).offset(120)
            $0.centerX.equalToSuperview()
        }
        googleSignupButton.snp.makeConstraints{
            $0.height.equalTo(56)
            $0.width.equalTo(320)
            $0.bottom.equalToSuperview().offset(-90)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func signinWithGoogle() {
        googleSignupButton.translatesAutoresizingMaskIntoConstraints = false
        
        googleSignupButton.addAction(.init(handler: { [weak self] _ in
            guard let self = self else { return }
            
            GIDSignIn.sharedInstance.signIn(withPresenting: self) { result, error in
                if let error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user,
                    let idToken = user.idToken?.tokenString
                else {
                    return
                }
                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
                
                Auth.auth().signIn(with: credential) { authResult, error in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    
                    // Firebase에 로그인한 후에 필요한 작업 수행
                    if let user = Auth.auth().currentUser {
                        let email = user.email
                        let name = user.displayName
                        self.userEmail = email ?? "Unknown"
                        self.userName = name ?? "Unknown"
                    }
                    
                    let nextVC = MainViewController()
                    nextVC.userName = self.userName
                    nextVC.userEmail = self.userEmail
                    self.navigationController?.pushViewController(nextVC, animated: false)
                }
            }
            
        }), for: .touchUpInside)
        
    }
}
