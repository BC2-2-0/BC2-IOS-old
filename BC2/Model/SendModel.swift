//
//  SendModel.swift
//  BC2
//
//  Created by 신아인 on 2023/05/06.
//

import Foundation

struct chargeRequest: Codable {
    let email: String
    let balance: Int
    let charged_money: Int
}
