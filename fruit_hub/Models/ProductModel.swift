//
//  ProductModel.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import Foundation

struct ProductModel {
    var id: Int?
    var image: String?
    var name: String?
    var price: String?
    var categoryId: Int?
}


let mockProductRecommended = [
    ProductModel(id: 1, image: "Honey-Lime-Peach-Fruit-Salad", name: "Honey lime combo", price: "2,000", categoryId: 3),
    ProductModel(id: 2, image: "Glowing-Berry-Fruit-Salad", name: "Berry mango combo", price: "8,000", categoryId: 3),
    ProductModel(id: 3, image: "breakfast-quinoa-and-red-fruit-salad", name: "Quinoa fruit salad", price: "10,000", categoryId: 1),
    ProductModel(id: 4, image: "Best-Ever-Tropical-Fruit-Salad", name: "Tropical fruit salad", price: "10,000", categoryId: 2),
    ProductModel(id: 5, image: "BerryWorld-Kiwiberry-Fruit-Salad", name: "Melon fruit salad", price: "10,000", categoryId: 4),
]

let mockProduct = [
    ProductModel(id: 1, image: "Honey-Lime-Peach-Fruit-Salad", name: "Honey lime combo", price: "2,000", categoryId: 3),
    ProductModel(id: 2, image: "Glowing-Berry-Fruit-Salad", name: "Berry mango combo", price: "8,000", categoryId: 3),
    ProductModel(id: 3, image: "breakfast-quinoa-and-red-fruit-salad", name: "Quinoa fruit salad", price: "10,000", categoryId: 1),
    ProductModel(id: 4, image: "Best-Ever-Tropical-Fruit-Salad", name: "Tropical fruit salad", price: "10,000", categoryId: 2),
    ProductModel(id: 5, image: "BerryWorld-Kiwiberry-Fruit-Salad", name: "Melon fruit salad", price: "10,000", categoryId: 4),
]
