//
//  CategoryCollectionViewCell.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var selectedView: UIView!
    
    var categorySelected: CategoryModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupUI(data: CategoryModel) {
        categoryNameLabel.text = data.name
        selectedView.isHidden = !(data.id == categorySelected?.id)
    }
}
