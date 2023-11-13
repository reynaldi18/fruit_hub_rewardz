//
//  ProductCollectionViewCell.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupUI(product: ProductModel) {
        rootView.layer.setShadows()
        productNameLabel.text = product.name
        productPriceLabel.text = product.price
        productImage.image = UIImage(named: product.image ?? "")
    }

}
