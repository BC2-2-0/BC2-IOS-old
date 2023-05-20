//
//  Payment.swift
//  BC2
//
//  Created by AnnKangHo on 2023/05/20.
//

import Foundation

struct PaymentResponse: Decodable {
    var bid: Int
    var email: String
    var balance: Int
    var menu: String
    var price: Int
    var quantity: Int
}
