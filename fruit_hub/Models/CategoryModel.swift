//
//  CategoryModel.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import Foundation

struct CategoryModel {
    var id: Int?
    var name: String?
    var isSelected: Bool = false
}

var mockCategory = [
    CategoryModel(id: 1, name: "Hottest", isSelected: true),
    CategoryModel(id: 2, name: "Popular"),
    CategoryModel(id: 3, name: "New Combo"),
    CategoryModel(id: 4, name: "Top")
]
