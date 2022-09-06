//
//  Category.swift
//  Todoey
//
//  Created by Kaan Uslu on 2.09.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
    @objc dynamic var color: String = ""
}
