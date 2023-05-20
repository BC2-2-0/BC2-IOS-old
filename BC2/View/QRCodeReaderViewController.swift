//
//  QRCodeReaderViewController.swift
//  BC2
//
//  Created by 신아인 on 2023/05/18.
//

import UIKit
import AVFoundation
import RealmSwift
import CryptoKit
class QRCodeReaderViewController: BaseVC {
    
    var userEmail: String = " "
    var myMoney: Int = UserDefaults.standard.integer(forKey: "money")
    
    // 실시간 캡처를 수행하기 위해 AVCaptureSession 개체를 인스턴스화
    private let captureSession = AVCaptureSession()
    private var isQRCodeProcessed = false
    
    override func addView(){
        basicSetting()
    }
    
}

extension QRCodeReaderViewController {
    
    private func basicSetting() {
        // AVCaptureDevice : capture sessions 에 대한 입력(audio or video)과 하드웨어별 캡처 기능에 대한 제어를 제공하는 장치
        // 캡처할 방식을 정하는 코드
        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
            
            // 시뮬레이터에서 실행시 카메라를 사용할 수 없기 때문에 에러 발생
            fatalError("No video device found")
        }
        do {
            // 특정 device 를 사용해서 input 초기화.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            captureSession.addInput(input)
            
            // 영상으로 촬영하면서 지속적으로 생성되는 metadata를 처리하는 output
            let output = AVCaptureMetadataOutput()
            
            // session에 주어진 output 추가
            captureSession.addOutput(output)
            
            output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            
            // 리더기가 인식할 수 있는 코드 타입지정 (이 프로젝트의 경우 qr)
            output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            
            // 카메라 영상이 나오는 layer 와 + 모양 가이드 라인을 뷰에 추가
            setVideoLayer()
            setGuideCrossLineView()
            
            captureSession.startRunning()
        }
        catch {
            print("error")
        }
    }
    
    // 카메라 영상이 나오는 layer 를 뷰에 추가
    private func setVideoLayer() {
        // 영상을 담을 공간
        let videoLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        // 카메라의 크기 지정
        videoLayer.frame = view.layer.bounds
        // 카메라의 비율지정
        videoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        view.layer.addSublayer(videoLayer)
    }
    
    //  + 모양 가이드라인을 뷰에 추가
    private func setGuideCrossLineView() {
        let guideCrossLine = UIImageView()
        guideCrossLine.image = UIImage(systemName: "plus")
        guideCrossLine.tintColor = .green
        guideCrossLine.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(guideCrossLine)
        NSLayoutConstraint.activate([
            guideCrossLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            guideCrossLine.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            guideCrossLine.widthAnchor.constraint(equalToConstant: 30),
            guideCrossLine.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

extension QRCodeReaderViewController: AVCaptureMetadataOutputObjectsDelegate {
    
    // caputure output object 가 새로운 metadata objects 를 보냈을 때
    func metadataOutput(_ captureOutput: AVCaptureMetadataOutput,
                        didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection) {
        
        // QR 코드가 이미 처리되었는지 확인
        guard !isQRCodeProcessed,
              let metadataObject = metadataObjects.first,
              let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject,
              let stringValue = readableObject.stringValue else {
            return
        }
        
        // QR 코드에서 값을 추출
        if let qrCodeURL = URL(string: stringValue),
           let queryItems = URLComponents(url: qrCodeURL, resolvingAgainstBaseURL: false)?.queryItems {
            var price: String?
            var quantity: String?
            var menu: String?
            
            for queryItem in queryItems {
                if queryItem.name == "price" {
                    price = queryItem.value
                } else if queryItem.name == "quantity" {
                    quantity = queryItem.value
                } else if queryItem.name == "item" {
                    menu = queryItem.value
                }
            }
            
            // 추출된 값을 출력합니다.
            print("price: \(price ?? "")")
            print("quantity: \(quantity ?? "")")
            print("menu: \(menu ?? "")")
            
            // QR 코드가 처리되었음을 나타내는 플래그 설정
            isQRCodeProcessed = true
            
            // 다이얼로그
            DispatchQueue.main.async {
                //self.dismiss(animated: true, completion: nil)
                self.showResultDialog(price: price, quantity: quantity, menu: menu)
            }
        }
    }
    
    private func showResultDialog(price: String?, quantity: String?, menu: String?) {
        let alertController = UIAlertController(title: "\(price ?? "")원", message: "\(menu ?? "") \(quantity ?? "")개를 구매하시려는게 맞습니까?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (_) in
            // 취소 버튼을 눌렀을 때 실행할 코드
        }
        
        let confirmAction = UIAlertAction(title: "확인", style: .default) { (_) in
            // 확인 버튼을 눌렀을 때 실행할 코드
            let priceInt = Int(price ?? "") ?? 0
            let quantityInt = Int(quantity ?? "") ?? 0
            QRPayment(email: self.userEmail, balance: self.myMoney, menu: menu ?? "", price: priceInt, quantity: quantityInt) { [weak self] _ in
                guard let self else {
                    return
                }
                let realm = try! Realm()
                
                let currentMoney = UserDefaults.standard.integer(forKey: "money")
                
                let balance = currentMoney - priceInt * quantityInt
                
                UserDefaults.standard.setValue(balance, forKey: "money")
                
                let payment = PaymentRealmEntity(emailHash: SHA256.hash(data: self.userEmail.data(using: .utf8)!).compactMap { String(format: "%02x", $0)}.joined(), menu: menu ?? " ", price: "\(priceInt)", quantity: "\(quantityInt)", balance: "\(balance)")
                
                try! realm.write {
                    realm.add(payment)
                }
                
                let successAlert = UIAlertController(title: "성공", message: "결제 완료했습니다!", preferredStyle: .alert)
                successAlert.addAction(UIAlertAction(title: "확인", style: .default){_ in 
                    self.dismiss(animated: true)
                })
                self.present(successAlert, animated: true)
            }
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        
        present(alertController, animated: true, completion: nil)
    }
}


