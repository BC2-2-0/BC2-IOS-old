//
//  RealmModel.swift
//  BC2
//
//  Created by AnnKangHo on 2023/05/18.
//

import Foundation
import RealmSwift
class Data: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var ownMoney: Int = 0
}
