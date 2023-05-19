////
////  QRCodeReaderViewController.swift
////  BC2
////
////  Created by 신아인 on 2023/05/18.
////
//
//import UIKit
//import AVFoundation
//
//class QRCodeReaderViewController: BaseVC {
//
//    var userEmail: String = " "
//    var myMoney: Int = 0
//
//    private let captureSession = AVCaptureSession()
//    private var isQRCodeProcessed = false
//
//    override func addView() {
//        basicSetting()
//    }
//
//}
//
//extension QRCodeReaderViewController {
//
//    private func basicSetting() {
//        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
//            fatalError("No video device found")
//        }
//        do {
//            let input = try AVCaptureDeviceInput(device: captureDevice)
//
//            captureSession.addInput(input)
//
//            let output = AVCaptureMetadataOutput()
//
//            captureSession.addOutput(output)
//
//            output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
//
//            output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
//
//            setVideoLayer()
//            setGuideCrossLineView()
//
//            captureSession.startRunning()
//        } catch {
//            print("error")
//        }
//    }
//
//    private func setVideoLayer() {
//        let videoLayer = AVCaptureVideoPreviewLayer(session: captureSession)
//        videoLayer.frame = view.layer.bounds
//        videoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
//        view.layer.addSublayer(videoLayer)
//    }
//
//    private func setGuideCrossLineView() {
//        let guideCrossLine = UIImageView()
//        guideCrossLine.image = UIImage(systemName: "plus")
//        guideCrossLine.tintColor = .green
//        guideCrossLine.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(guideCrossLine)
//
//        guideCrossLine.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//            $0.centerY.equalToSuperview()
//            $0.width.height.equalTo(30)
//        }
//    }
//}
//
//extension QRCodeReaderViewController: AVCaptureMetadataOutputObjectsDelegate {
//
//    func metadataOutput(_ captureOutput: AVCaptureMetadataOutput,
//                        didOutput metadataObjects: [AVMetadataObject],
//                        from connection: AVCaptureConnection) {
//
//        guard !isQRCodeProcessed,
//              let metadataObject = metadataObjects.first,
//              let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject,
//              let stringValue = readableObject.stringValue else {
//            return
//        }
//
//        if let qrCodeURL = URL(string: stringValue),
//           let queryItems = URLComponents(url: qrCodeURL, resolvingAgainstBaseURL: false)?.queryItems {
//            var price: String?
//            var quantity: String?
//            var menu: String?
//            var number: String?
//
//            for queryItem in queryItems {
//                if queryItem.name == "price" {
//                    price = queryItem.value
//                } else if queryItem.name == "quantity" {
//                    quantity = queryItem.value
//                } else if queryItem.name == "item" {
//                    menu = queryItem.value
//                } else if queryItem.name == "number" {
//                    number = queryItem.value
//                }
//            }
//
//            print("price: \(price ?? "")")
//            print("quantity: \(quantity ?? "")")
//            print("menu: \(menu ?? "")")
//            print("number: \(number ?? "")")
//
//            isQRCodeProcessed = true
//
//            DispatchQueue.main.async {
//                self.showResultDialog(price: price, quantity: quantity, menu: menu, number: number)
//            }
//        }
//    }
//
//    private func showResultDialog(price: String?, quantity: String?, menu: String?, number: String?) {
//        let alertController = UIAlertController(title: "\(price ?? "")원", message: "\(menu ?? "") \(quantity ?? "")개를 구매하시려는게 맞습니까?", preferredStyle: .alert)
//
//        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (_) in
//            // Code to execute when Cancel button is pressed
//        }
//
//        let confirmAction = UIAlertAction(title: "확인", style: .default) { (_) in
//            // Code to execute when Confirm button is pressed
//            let priceInt = Int(price ?? "") ?? 0
//            let quantityInt = Int(quantity ?? "") ?? 0
//            let numberInt = Int(number ?? "") ?? 0
//            QRPayment(email: self.userEmail, balance: self.myMoney, menu: menu ?? "", price: priceInt, quantity: quantityInt, number: numberInt)
//        }
//
//        alertController.addAction(cancelAction)
//        alertController.addAction(confirmAction)
//
//        present(alertController, animated: true, completion: nil)
//    }
//}
