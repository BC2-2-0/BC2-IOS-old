//
//  ChargeResponse.swift
//  BC2
//
//  Created by AnnKangHo on 2023/05/19.
//

import Foundation

struct ChargeResponse: Decodable {
    var email: String
    var balance: String
    var charged_money: String
    var mid: Int
    var type: String
}
