//
//  PaymentRealmEntity.swift
//  BC2
//
//  Created by AnnKangHo on 2023/05/20.
//

import Foundation
import RealmSwift

class PaymentRealmEntity: Object {
    @Persisted (primaryKey: true) var uuid: String
    @Persisted var emailHash: String
    @Persisted var menu: String
    @Persisted var price: String
    @Persisted var quantity: String
    @Persisted var balance: String
    convenience init(emailHash: String, menu: String, price: String, quantity: String, balance: String) {
        self.init()
        self.uuid = UUID().uuidString
        self.emailHash = emailHash
        self.menu = menu
        self.price = price
        self.quantity = quantity
        self.balance = balance
    }
}
